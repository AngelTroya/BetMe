/**
 * Paypal Button and Instant Payment Notification (IPN) Integration with Java
 * http://codeoftheday.blogspot.com/2013/07/paypal-button-and-instant-payment_6.html
 */
package utilities.paypal;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;


public class IpnHandler
{

    private Logger logger = Logger.getLogger(IpnHandler.class.getName());
    private IpnConfig ipnConfig;
    private IpnInfoService ipnInfoService;

    /**
     * This method handles the Paypal IPN Notification as follows:
     *      1. Read all posted request parameters
     *      2. Prepare 'notify-validate' command with exactly the same parameters
     *      3. Post above command to Paypal IPN URL {@link IpnConfig#ipnUrl}
     *      4. Read response from Paypal
     *      5. Capture Paypal IPN information
     *      6. Validate captured Paypal IPN Information
     *          6.1. Check that paymentStatus=Completed
     *          6.2. Check that txnId has not been previously processed
     *          6.3. Check that receiverEmail matches with configured {@link IpnConfig#receiverEmail}
     *          6.4. Check that paymentAmount matches with configured {@link IpnConfig#paymentAmount}
     *          6.5. Check that paymentCurrency matches with configured {@link IpnConfig#paymentCurrency}
     *      7. In case of any failed validation checks, throw {@link IpnException}
     *      8. If all is well, return {@link IpnInfo} to the caller for further business logic execution
     *
     * @param request {@link HttpServletRequest}
     * @return {@link IpnInfo}
     * @throws IpnException
     */
    public IpnInfo handleIpn (HttpServletRequest request) throws IpnException {
        System.out.println("handleIpn");
        
        logger.info("inside ipn");
        IpnInfo ipnInfo = new IpnInfo();
        try
        {
            //1. Read all posted request parameters
            String requestParams = this.getAllRequestParams(request);
            logger.info(requestParams);

            //2. Prepare 'notify-validate' command with exactly the same parameters
            Enumeration en = request.getParameterNames();
            StringBuilder cmd = new StringBuilder("cmd=_notify-validate");
            String paramName;
            String paramValue;
            while (en.hasMoreElements()) {
                paramName = (String) en.nextElement();
                paramValue = request.getParameter(paramName);
                cmd.append("&").append(paramName).append("=")
                        .append(URLEncoder.encode(paramValue, request.getParameter("charset")));
            }

            //3. Post above command to Paypal IPN URL {@link IpnConfig#ipnUrl}
            URL u = new URL(this.getIpnConfig().getIpnUrl());
            HttpsURLConnection uc = (HttpsURLConnection) u.openConnection();
            uc.setDoOutput(true);
            uc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            uc.setRequestProperty("Host", "www.paypal.com");
            PrintWriter pw = new PrintWriter(uc.getOutputStream());
            pw.println(cmd.toString());
            pw.close();

            //4. Read response from Paypal
            BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
            String res = in.readLine();
            in.close();

            //5. Capture Paypal IPN information
            ipnInfo.setLogTime(System.currentTimeMillis());
            ipnInfo.setItemName(request.getParameter("item_name"));
            ipnInfo.setItemNumber(request.getParameter("item_number"));
            ipnInfo.setPaymentStatus(request.getParameter("payment_status"));
            ipnInfo.setPaymentAmount(request.getParameter("mc_gross"));
            ipnInfo.setPaymentCurrency(request.getParameter("mc_currency"));
            ipnInfo.setTxnId(request.getParameter("txn_id"));
            ipnInfo.setReceiverEmail(request.getParameter("receiver_email"));
            ipnInfo.setPayerEmail(request.getParameter("payer_email"));
            ipnInfo.setResponse(res);
            ipnInfo.setRequestParams(requestParams);

            //6. Validate captured Paypal IPN Information
            if (res.equals("VERIFIED")) {

                //6.1. Check that paymentStatus=Completed
                if(ipnInfo.getPaymentStatus() == null || !ipnInfo.getPaymentStatus().equalsIgnoreCase("COMPLETED"))
                    ipnInfo.setError("payment_status IS NOT COMPLETED {" + ipnInfo.getPaymentStatus() + "}");

                //6.2. Check that txnId has not been previously processed
                IpnInfo oldIpnInfo = this.getIpnInfoService().getIpnInfo(ipnInfo.getTxnId());
                if(oldIpnInfo != null)
                    ipnInfo.setError("txn_id is already processed {old ipn_info " + oldIpnInfo);

                //6.3. Check that receiverEmail matches with configured {@link IpnConfig#receiverEmail}
                if(!ipnInfo.getReceiverEmail().equalsIgnoreCase(this.getIpnConfig().getReceiverEmail()))
                    ipnInfo.setError("receiver_email " + ipnInfo.getReceiverEmail()
                            + " does not match with configured ipn email " + this.getIpnConfig().getReceiverEmail());

                //6.4. Check that paymentAmount matches with configured {@link IpnConfig#paymentAmount}
                if(Double.parseDouble(ipnInfo.getPaymentAmount()) != Double.parseDouble(this.getIpnConfig().getPaymentAmount()))
                    ipnInfo.setError("payment amount mc_gross " + ipnInfo.getPaymentAmount()
                            + " does not match with configured ipn amount " + this.getIpnConfig().getPaymentAmount());

                //6.5. Check that paymentCurrency matches with configured {@link IpnConfig#paymentCurrency}
                if(!ipnInfo.getPaymentCurrency().equalsIgnoreCase(this.getIpnConfig().getPaymentCurrency()))
                    ipnInfo.setError("payment currency mc_currency " + ipnInfo.getPaymentCurrency()
                            + " does not match with configured ipn currency " + this.getIpnConfig().getPaymentCurrency());
            }
            else
                ipnInfo.setError("Inavlid response {" + res + "} expecting {VERIFIED}");

            logger.info("ipnInfo = " + ipnInfo);

            this.getIpnInfoService().log(ipnInfo);

            //7. In case of any failed validation checks, throw {@link IpnException}
            if(ipnInfo.getError() != null)
                throw new IpnException(ipnInfo.getError());
        }
        catch(Exception e)
        {
            if(e instanceof IpnException)
                throw (IpnException) e;
            logger.log(Level.SEVERE, e.toString(), e);
            throw new IpnException(e.toString());
        }

        //8. If all is well, return {@link IpnInfo} to the caller for further business logic execution
        return ipnInfo;
    }

    /**
     * Utility method to extract all request parameters and their values from request object
     *
     * @param request {@link HttpServletRequest}
     * @return all request parameters in the form:
     *                                              param-name 1
     *                                                  param-value
     *                                              param-name 2
     *                                                  param-value
     *                                                  param-value (in case of multiple values)
     */
    private String getAllRequestParams(HttpServletRequest request)
    {
        Map map = request.getParameterMap();
        StringBuilder sb = new StringBuilder("\nREQUEST PARAMETERS\n");
        for (Iterator it = map.keySet().iterator(); it.hasNext();)
        {
            String pn = (String)it.next();
            sb.append(pn).append("\n");
            String[] pvs = (String[]) map.get(pn);
            for (int i = 0; i < pvs.length; i++) {
                String pv = pvs[i];
                sb.append("\t").append(pv).append("\n");
            }
        }
        return sb.toString();
    }

    public Logger getLogger() {
        return logger;
    }

    public void setLogger(Logger logger) {
        this.logger = logger;
    }

    public IpnConfig getIpnConfig() {
        return ipnConfig;
    }

    public void setIpnConfig(IpnConfig ipnConfig) {
        this.ipnConfig = ipnConfig;
    }

    public IpnInfoService getIpnInfoService() {
        return ipnInfoService;
    }

    public void setIpnInfoService(IpnInfoService ipnInfoService) {
        this.ipnInfoService = ipnInfoService;
    }
}
