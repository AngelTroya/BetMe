/* LoginController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package security;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.UserService;
import controllers.AbstractController;

@Controller
@Transactional
@RequestMapping("/security")
public class LoginController extends AbstractController {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(LoginController.class);

	// Supporting services ----------------------------------------------------

	@Autowired
	LoginService service;
	@Autowired
	UserService userService;

	// Constructors -----------------------------------------------------------

	public LoginController() {
		super();
	}

	// Login ------------------------------------------------------------------

	@RequestMapping("/login")
	public ModelAndView login(@Valid @ModelAttribute Credentials credentials,
			BindingResult bindingResult,
			@RequestParam(required = false) boolean showError,
			@RequestParam(required = false) boolean showRegisterSuccess) {

		log.debug("LoginController - login()");

		Assert.notNull(credentials);
		Assert.notNull(bindingResult);
		ModelAndView result;

		result = new ModelAndView("security/login");
		result.addObject("credentials", credentials);
		result.addObject("showError", showError);
		result.addObject("showRegisterSuccess", showRegisterSuccess);

		return result;
	}

	// LoginFailure -----------------------------------------------------------

	@RequestMapping("/loginFailure")
	public ModelAndView failure() {

		log.debug("LoginController - failure()");

		ModelAndView result;

		result = new ModelAndView("redirect:../welcome/index.do?showLoginError=true");

		return result;
	}

}