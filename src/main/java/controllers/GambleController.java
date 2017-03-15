/* CustomerController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.GambleService;
import services.UserService;
import domain.Gamble;
import domain.User;
import forms.GambleForm;

@Controller
@Transactional
@RequestMapping("/gamble")
public class GambleController extends AbstractController {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(GambleController.class);

	// Services ---------------------------------------------------------------

	@Autowired
	private GambleService gambleService;
	@Autowired
	private UserService userService;

	// Constructors -----------------------------------------------------------

	public GambleController() {
		super();
	}

	// Show my active gambles
	// ---------------------------------------------------------------

	@RequestMapping(value = "/showactive", method = RequestMethod.GET)
	public ModelAndView listActive() {

		log.debug("GambleController - listActive()");

		ModelAndView result;
		Collection<Gamble> gambles;

		gambles = gambleService.findActiveByUser();
		result = new ModelAndView("gamble/show");
		result.addObject("requestURI", "gamble/showactive.do");
		result.addObject("gambles", gambles);

		return result;
	}

	// Show my past gambles
	// ---------------------------------------------------------------

	@RequestMapping(value = "/showpast", method = RequestMethod.GET)
	public ModelAndView listPast() {

		log.debug("GambleController - listPast()");

		ModelAndView result;
		Collection<Gamble> gambles;

		gambles = gambleService.findPastByUser();
		result = new ModelAndView("gamble/show");
		result.addObject("requestURI", "gamble/showpast.do");
		result.addObject("gambles", gambles);

		return result;
	}

	// Gamble ------------------------------------------------------------------

	@RequestMapping(value = "/gamble", method = RequestMethod.POST)
	public ModelAndView gamble(@Valid GambleForm form, BindingResult binding) {

		log.debug("GambleController - gamble()");

		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView(
					"redirect:../bet/showBets.do?gamble=false");
		} else {
			User user = userService.findByPrincipal();
			Gamble gamble = gambleService.createUserGamble(form, user);
			String error = gamble.validate();
			if (error.isEmpty()) {
				if (!user.gamble(gamble.getAmount())) {
					result = new ModelAndView("redirect:../bet/seeDetails.do?betId="+form.getBetId()+"&noMoney=true");
				} else {
					try {
						beginTransaction();
						gambleService.save(gamble);
						commitTransaction();
						log.debug("GambleController - gamble(): Gamble creado con exito");
						result = new ModelAndView("redirect:../bet/seeDetails.do?betId="+form.getBetId()+"&gamble=true");
					} catch (Throwable oops) {
						rollbackTransaction();
						log.debug("GambleController - gamble() : Error al crear el gamble: "
								+ oops.getMessage());
						result = new ModelAndView("redirect:../bet/seeDetails.do?betId="+form.getBetId()+"&gamble=false");
					}
				}

			} else {
				result = new ModelAndView("redirect:../bet/seeDetails.do?betId="+form.getBetId()+"&error="
						+ error);
			}
		}

		return result;
	}

	// Ancillary methods ------------------------------------------------------

}