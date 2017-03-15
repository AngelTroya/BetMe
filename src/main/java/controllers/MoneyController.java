/* CustomerController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.UserAccountRepository;
import services.UserService;
import utilities.paypal.IpnHandler;
import domain.User;

@Controller
@Transactional
@RequestMapping("/money")
public class MoneyController extends AbstractController {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(MoneyController.class);
	
	// Services ---------------------------------------------------------------

	@Autowired
	private UserService userService;
	@Autowired
	private UserAccountRepository accountRepository;

	// Constructors -----------------------------------------------------------

	public MoneyController() {
		super();
	}

	// My wallet
	// ---------------------------------------------------------------

	@RequestMapping(value = "/wallet", method = RequestMethod.GET)
	public ModelAndView wallet() {

		log.debug("MoneyController - wallet()");
		ModelAndView result;
		User user = userService.findByPrincipal();
		Assert.notNull(user);
		result = new ModelAndView("money/wallet");
		result.addObject("user", user);
		return result;
	}
	
	
	// Deposit money
	// ---------------------------------------------------------------

	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public ModelAndView deposit(@RequestParam int userId) {

		log.debug("MoneyController - deposit()");
		ModelAndView result;
		User user = userService.findOne(userId);
		Assert.notNull(user);
		result = createDepositModelAndView(user);
		return result;
	}

	@RequestMapping(value = "/deposit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveDeposit(@Valid User user, BindingResult binding) {

		log.debug("MoneyController - saveDeposit()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createDepositModelAndView(user);
		} else {
			try {
				
				User u1 = userService.findByPrincipal();
				Double d1 = u1.getMoney();
				Double d2 = user.getMoney();
				
				User u3 = user;
				u3.setMoney(d1 + d2);
				
				beginTransaction();
				userService.save(u3);
				commitTransaction();
				result = new ModelAndView("redirect:wallet.do");
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createDepositModelAndView(user, "money.error");
			}
		}

		return result;
	}

	// Deposit money
	// ---------------------------------------------------------------

	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	public ModelAndView withdraw(@RequestParam int userId) {

		log.debug("MoneyController - withdraw()");
		ModelAndView result;
		User user = userService.findOne(userId);
		Assert.notNull(user);
		result = createWithdrawModelAndView(user);
		return result;
	}

	@RequestMapping(value = "/withdraw", method = RequestMethod.POST, params = "save")
	public ModelAndView saveWithdraw(@Valid User user, BindingResult binding) {

		log.debug("MoneyController - saveWithdraw()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createWithdrawModelAndView(user);
		} else {
			try {
				
				User u1 = userService.findByPrincipal();
				Double d1 = u1.getMoney();
				Double d2 = user.getMoney();
				
				User u3 = user;
				u3.setMoney(d1 - d2);
				if (u3.getMoney() >= 0) {
					beginTransaction();
					userService.save(u3);
					commitTransaction();
					result = new ModelAndView("redirect:wallet.do");
				} else {
					result = createWithdrawModelAndView(user, "money.error");
				}
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createWithdrawModelAndView(user, "money.error");
			}
		}

		return result;
	}
	
	@RequestMapping(value = "/paypalipn", method = RequestMethod.POST)
	public ModelAndView paypalipn(HttpServletRequest request) {
		
		ModelAndView result = new ModelAndView("money/paypalipn");		
		
		try {
			log.debug("MoneyController - ipnpaypal"+ request);
			
			System.out.println("ipn" + request.toString());
			IpnHandler handler = new IpnHandler();
			handler.handleIpn(request);
			//betService.accept(betId);
			//commitTransaction();
			//result = rejected();
			//result.addObject("message", "moderator.commit.ok");
		} catch (Throwable oops) {
			rollbackTransaction();
			//result = rejected();
			//result.addObject("message", "moderator.commit.error");			
		}
		return result;
	}
	
	
	// Ancillary methods ------------------------------------------------------
	
	protected ModelAndView createDepositModelAndView(User user) {

		log.debug("MoneyController - createDepositModelAndView()");
		ModelAndView result;

		result = createDepositModelAndView(user, null);

		return result;
	}

	protected ModelAndView createDepositModelAndView(User user, String message) {

		log.debug("MoneyController - createDepositModelAndView(,)");
		ModelAndView result;

		result = new ModelAndView("money/deposit");
		result.addObject("user", user);
		result.addObject("message", message);

		return result;
	}
	
	protected ModelAndView createWithdrawModelAndView(User user) {

		log.debug("MoneyController - createWithdrawModelAndView()");
		ModelAndView result;

		result = createWithdrawModelAndView(user, null);

		return result;
	}

	protected ModelAndView createWithdrawModelAndView(User user, String message) {

		log.debug("MoneyController - createWithdrawModelAndView(,)");
		ModelAndView result;

		result = new ModelAndView("money/withdraw");
		result.addObject("user", user);
		result.addObject("message", message);

		return result;
	}
	
}