<%--
 * action-1.jsp
 *
 * Copyright (C) 2014 Paperbet S.A.
 --%>

<%@page import="utilities.paypal.IpnHandler"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<security:authorize access="hasRole('MODERATOR')">
	<form:form action="moderator/deposit.do" modelAttribute="user">

		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="name" />
		<form:hidden path="surname" />
		<form:hidden path="email" />
		<form:hidden path="phone" />
		<form:hidden path="address" />
		<form:hidden path="dateOfBirth" />
		<form:hidden path="zipCode" />
		<form:hidden path="dni" />
		<form:hidden path="sex" />
		<form:hidden path="province" />
		<form:hidden path="karma" />
		<form:hidden path="image" />
		<form:hidden path="votes" />
		<form:hidden path="userAccount" />
		<form:hidden path="isReported"/>
		<form:hidden path="city"/>
	

		<form:label path="money">
		<spring:message code="money.money" />:
		</form:label>
		<form:input path="money"/>
		<form:errors cssClass="error" path="money" />
		<br />
	
		<input type="submit" name="save"
			value="<spring:message code="money.deposit" />" />&nbsp;
		<input type="button" name="cancel"
			value="<spring:message code="money.cancel" />"
			onclick="javascript: window.location.replace('moderator/users.do');" />  
		<br />

	</form:form>
</security:authorize>
<!--<form:form action="money/deposit.do" modelAttribute="user">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="name" />
	<form:hidden path="surname" />
	<form:hidden path="email" />
	<form:hidden path="phone" />
	<form:hidden path="address" />
	<form:hidden path="dateOfBirth" />
	<form:hidden path="zipCode" />
	<form:hidden path="dni" />
	<form:hidden path="sex" />
	<form:hidden path="province" />
	<form:hidden path="karma" />
	<form:hidden path="image" />
	<form:hidden path="votes" />
	<form:hidden path="userAccount" />
	

	<form:label path="money">
	<spring:message code="money.money" />:
	</form:label>
	<form:input path="money"/>
	<form:errors cssClass="error" path="money" />
	<br />
	
	<input type="submit" name="save"
		value="<spring:message code="money.deposit" />" />&nbsp;
	<input type="button" name="cancel"
		value="<spring:message code="money.cancel" />"
		onclick="javascript: window.location.replace('money/wallet.do');" />  
	<br />

</form:form>-->

<!-- INFO: The post URL "checkout.java" is invoked when clicked on "Pay with PayPal" button.-->

<!--<form action='checkout.java' METHOD='POST'>
	<form action='https://www.sandbox.paypal.com/cgi-bin/websrc' METHOD='POST'>
	<input type='image' name='paypal_submit' id='paypal_submit'  src='https://www.paypal.com/en_US/i/btn/btn_dg_pay_w_paypal.gif' border='0' align='top' alt='Pay with PayPal'/>
</form>-->

<security:authorize access="hasRole('CUSTOMER')">
<form name='formTpv' method='post' action='https://www.sandbox.paypal.com/cgi-bin/webscr'>


	<label for="amount"><spring:message code="money.money" />: </label>
    <input  name='amount' >
    <br />

	<input type='image' name='paypal_submit' id='paypal_submit'  src='https://www.paypal.com/en_US/i/btn/btn_dg_pay_w_paypal.gif' align='top' alt='Pay with PayPal'/> 

    <input type='hidden' name='cmd' value='_xclick'>
    <input type='hidden' name='business' value='paperbet.sa@gmail.com'>
    <input type='hidden' name='item_name' value='Ingreso en la bolsa de Betme'>
    <input type='hidden' name='item_number' value='1'>
    <input type='hidden' name='page_style' value='primary'>
    <input type='hidden' name='no_shipping' value='1'>
    <input type='hidden' name='return' value='http://gumus.eii.us.es:8080/BetMe/money/wallet.do'>
    <input type='hidden' name='rm' value='2'>
    <input type='hidden' name='cancel_return' value='http://gumus.eii.us.es:8080/BetMe/money/wallet.do'>
    <input type='hidden' name='no_note' value='1'>
    <input type='hidden' name='currency_code' value='EUR'>
    <input type='hidden' name='cn' value='PP-BuyNowBF'>
    <!-- <input type='hidden' name='invoice' id='invoice' value ="ID-DE-LA-TRANSACCION">  -->
    <input name="notify_url" value="http://gumus.eii.us.es:8080/BetMe/money/paypalipn.do" type="hidden">
    <!-- <input type='hidden' name='first_name' value='NOMBRE'>

    <input type='hidden' name='last_name' value='APELLIDOS'>

    <input type='hidden' name='address1' value='DIRECCIÓN'>

    <input type='hidden' name='city' value='POBLACIÓN'>

    <input type='hidden' name='zip' value='41004'>

    <input type='hidden' name='night_phone_a' value=''>

    <input type='hidden' name='night_phone_b' value='653481563'>

    <input type='hidden' name='night_phone_c' value=''>  -->
    <input type='hidden' name='lc' value='es'>
    <input type='hidden' name='country' value='ES'>
    
	<input type="button" name="cancel" class="btn btn-default"
		value="<spring:message code="money.cancel" />"
		onclick="javascript: window.location.replace('money/wallet.do');" />
	<br />
</form>

<h6><spring:message code="money.aviso" /></h6>

<!-- <script type='text/javascript'>
    document.formTpv.submit();
</script>  -->



<!-- Add Digital goods in-context experience. Ensure that this script is added before the closing of html body tag -->

<script src='https://www.paypalobjects.com/js/external/dg.js' type='text/javascript'></script>



<!-- Add Digital goods in-context experience. Ensure that this script is added before the closing of html body tag -->

<script src='https://www.paypalobjects.com/js/external/dg.js' type='text/javascript'></script>


<script>

	var dg = new PAYPAL.apps.DGFlow(
	{
		trigger: 'paypal_submit',
		expType: 'instant'
		 //PayPal will decide the experience type for the buyer based on his/her 'Remember me on your computer' option.
	});

</script>
</security:authorize>