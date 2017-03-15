/* AdministratorController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator")
public class AdministratorController extends AbstractController {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(AdministratorController.class);
	
	// Services ---------------------------------------------------------------
	
	

	// Constructors -----------------------------------------------------------
	
	public AdministratorController() {
		super();
	}
		
	// Action-1 ---------------------------------------------------------------		

	@RequestMapping("/action-1")
	public ModelAndView action1() {
		
		log.debug("AdministratorController - action1()");
		ModelAndView result;
				
		result = new ModelAndView("administrator/action-1");
		
		return result;
	}
	
	// Action-2 ---------------------------------------------------------------
	
	@RequestMapping("/action-2")
	public ModelAndView action2() {
		log.debug("AdministratorController - action2()");
		
		ModelAndView result;
				
		result = new ModelAndView("administrator/action-2");
		
		return result;
	}
	
}