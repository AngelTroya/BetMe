/* WelcomeController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import services.BetService;
import domain.Bet;

@Controller
@RequestMapping("/welcome")
public class WelcomeController extends AbstractController {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(WelcomeController.class);
	
	// Services ---------------------------------------------------------------
	
	@Autowired
	private BetService betService;

	// Constructors -----------------------------------------------------------
	
	public WelcomeController() {
		super();
	}
		
	// Index ------------------------------------------------------------------		

	@RequestMapping(value = "/index")
	public ModelAndView index() {
		
		log.debug("WelcomeController - index()");
		
		ModelAndView result;
		
		Collection<Bet> bets = betService.findAcceptedBets();
				
		result = new ModelAndView("welcome/index");
		result.addObject("bets", bets);

		return result;
	}
}