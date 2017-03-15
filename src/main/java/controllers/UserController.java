/* CustomerController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import security.UserAccount;
import security.UserAccountRepository;
import services.CommentService;
import services.ReportUserService;
import services.UserService;
import domain.Actor;
import domain.ReportUser;
import domain.User;
import domain.UserVote;
import forms.ChangePasswordForm;
import forms.ReportForm;
import forms.SignUpForm;
import forms.SignUpFormValidator;
import forms.UploadImageForm;

@Controller
@Transactional
@RequestMapping("/user")
public class UserController extends AbstractController {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(UserController.class);
	
	// Services ---------------------------------------------------------------

	@Autowired
	private UserService userService;
	@Autowired
	private UserAccountRepository accountRepository;
	@Autowired
	private BetController betController;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReportUserService reportService;

	// Constructors -----------------------------------------------------------

	public UserController() {
		super();
	}

	// Show details
	// ---------------------------------------------------------------

	@RequestMapping(value = "/showdetails", method = RequestMethod.GET)
	public ModelAndView showdetails() {

		log.debug("UserController - showDetails()");
		ModelAndView result;
		User user = userService.findByPrincipal();
		Assert.notNull(user);
		result = new ModelAndView("user/showdetails");
		result.addObject("user", user);
		UploadImageForm form = new UploadImageForm();
		result.addObject("uploadForm", form);
		ChangePasswordForm passForm = new ChangePasswordForm();
		result.addObject("changePassForm", passForm);
		return result;
	}

	// Edit details
	// ---------------------------------------------------------------

	@RequestMapping(value = "/editdetails", method = RequestMethod.GET)
	public ModelAndView editdetails() {

		log.debug("UserController - editDetails()");
		ModelAndView result;
		User user = userService.findByPrincipal();
		UploadImageForm form = new UploadImageForm();
		Assert.notNull(user);
		result = createEditModelAndView(user);
		result.addObject("uploadForm", form);
		return result;
	}

	@RequestMapping(value = "/editdetails", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid User user, BindingResult binding) {

		log.debug("UserController - save()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createEditModelAndView(user);
		} else {
			try {
				beginTransaction();
				userService.save(user);
				commitTransaction();
				result = new ModelAndView("redirect:showdetails.do");
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createEditModelAndView(user, "user.error");
			}
		}

		return result;
	}
	
	// Delete user ------------------------------------------------------------
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView deleteUser(){
		log.debug("UserController - deleteUser()");
		
		ModelAndView result;
		User user = userService.findByPrincipal();
		Assert.notNull(user);
		user.getUserAccount().setActive(false);
		user.setVersion(user.getVersion()-1);
		SecurityContextHolder.getContext().setAuthentication(null);
		
		try{
			beginTransaction();
			userService.save(user);
			commitTransaction();
			result = new ModelAndView("redirect:../welcome/index.do?delete=true");
			result.addObject("deleteUser", true);
		}catch(Throwable oops){
			rollbackTransaction();
			log.debug("Error en save: " + oops.getMessage());
			result = new ModelAndView("redirect:../welcome/index.do?delete=true");
		}
		
		return result;
	}

	// Register ---------------------------------------------------------------

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {

		log.debug("UserController - register()");

		ModelAndView result;
		SignUpForm form = new SignUpForm();

		result = createEditModelAndView(form);

		return result;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public @ResponseBody ModelAndView createUser(@Valid SignUpForm form, BindingResult binding) {

		log.debug("UserController - createUser()");
		
		SignUpFormValidator validator = new SignUpFormValidator();
		validator.validate(form, binding);

		ModelAndView result;
		

		if (binding.hasErrors()) {
			result = createEditModelAndView(form);
		} else {
			User user = new User();
			
			UserAccount account = userService.createAccount(form.getUsername(), form.getPassword1());
			
			user.setUserAccount(account);
			user.setName(form.getName());
			user.setSurname(form.getSurname());
			user.setEmail(form.getEmail1());
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			Date birth = null;
			try {
				birth = format.parse(form.getBirthDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			user.setDateOfBirth(birth);
			user.setDni(form.getDni());
			user.setAddress(form.getAdress());
			user.setZipCode(form.getCp());
			user.setProvince(form.getProvince());
			user.setCity(form.getCity());
			user.setPhone(form.getPhone());
			Integer sex = Integer.valueOf(form.getSex());
			if(sex.equals(Actor.MALE) || sex.equals(Actor.FEMALE)){
				user.setSex(sex);
			}
			user.setKarma(0.0);
			user.setMoney(0.0);
			user.setIsReported(false);
			
			MultipartFile file = form.getFileData();
			if(file != null){
				if(file.getSize() > 0){
					try {
						user.setImage(file.getBytes());
					} catch (IOException e) {
						log.debug("Error al subir la foto");
					}
				}
			}
			
			UserVote votes = new UserVote();
			votes.setNumVotes(0);
			votes.setUser(user);
			user.setVotes(votes);

			try {
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Create user con exito");
				result = new ModelAndView(
						"redirect:../welcome/index.do?showRegister=true");
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en create: " + oops.getMessage());
				result = new ModelAndView(
						"redirect:../welcome/index.do?showRegister=false");
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/voteBetPos", method = RequestMethod.GET)
	public ModelAndView voteBetPos(@Valid int betId){
		
		log.debug("UserController - voteBetPos()");
		
		ModelAndView result = null;
		
		User user = userService.findByPrincipal();
		user.setVersion(user.getVersion()-1);
		
		if(userService.voteBetPos(user, betId)){
			try{
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Voto con exito");
			}catch(Throwable oops){
				rollbackTransaction();
				log.debug("Fallo al votar: " + oops.getMessage());
			}
			result = betController.seeDetails(betId);
			result.addObject("voted", true);
		}else{
			result = betController.seeDetails(betId);
			result.addObject("voted", false);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/voteBetNeg", method = RequestMethod.GET)
	public ModelAndView voteBetNeg(@Valid int betId){
		
		log.debug("UserController - voteBetNeg()");
		
		ModelAndView result = null;
		
		User user = userService.findByPrincipal();
		user.setVersion(user.getVersion()-1);
		
		if(userService.voteBetNeg(user, betId)){
			try{
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Voto con exito");
			}catch(Throwable oops){
				rollbackTransaction();
				log.debug("Fallo al votar: " + oops.getMessage());
			}
			result = betController.seeDetails(betId);
			result.addObject("voted", true);
		}else{
			result = betController.seeDetails(betId);
			result.addObject("voted", false);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/voteCommentPos", method = RequestMethod.GET)
	public ModelAndView voteCommentPos(@Valid int commentId, int betId){
		
		log.debug("UserController - voteComment()");
		
		ModelAndView result = null;
		
		User user = userService.findByPrincipal();
		user.setVersion(user.getVersion() - 1);
		
		if(userService.voteCommentPos(user, commentId)){
			try{
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Voto con exito");
			}catch(Throwable oops){
				rollbackTransaction();
				log.debug("Fallo al votar: " + oops.getMessage());
			}
			result = betController.seeDetails(betId);
			result.addObject("voted", true);
		}else{
			result = betController.seeDetails(betId);
			result.addObject("voted", false);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/voteCommentNeg", method = RequestMethod.GET)
	public ModelAndView voteCommentNeg(@Valid int commentId, int betId){
		
		log.debug("UserController - voteComment()");
		
		ModelAndView result = null;
		
		User user = userService.findByPrincipal();
		user.setVersion(user.getVersion() - 1);
		
		if(userService.voteCommentNeg(user, commentId)){
			try{
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Voto con exito");
			}catch(Throwable oops){
				rollbackTransaction();
				log.debug("Fallo al votar: " + oops.getMessage());
			}
			result = betController.seeDetails(betId);
			result.addObject("voted", true);
		}else{
			result = betController.seeDetails(betId);
			result.addObject("voted", false);
		}
		
		return result;
	}
	
	@RequestMapping(value="/changePass", method = RequestMethod.POST)
	public ModelAndView changePass(@Valid ChangePasswordForm form, BindingResult binding){
		
		log.debug("UserController - changePass()");
		
		ModelAndView result;
		
		if (binding.hasErrors()) {
			result = new ModelAndView("redirect:showdetails.do?errorChange=true");
		} else {
			User user = userService.findByPrincipal();
			user.setVersion(user.getVersion() - 1);
			Md5PasswordEncoder encoder = new Md5PasswordEncoder();
			String pass = encoder.encodePassword(form.getOldPass(), null);
			
			if(!user.getUserAccount().getPassword().equals(pass)){
				result = new ModelAndView("redirect:showdetails.do?oldPassError=true");
			}
			if(!form.getNewPass1().equals(form.getNewPass2())){
				result = new ModelAndView("redirect:showdetails.do?distinctPassError=true");
			}
			String newPass = encoder.encodePassword(form.getNewPass1(), null);
			
			user.getUserAccount().setPassword(newPass);
			
			try{
				beginTransaction();
				userService.save(user);
				commitTransaction();
				log.debug("Cambio de contraseña con exito");
				result = new ModelAndView("redirect: showdetails.do?passChange=true");
			}catch(Throwable oops){
				rollbackTransaction();
				log.debug("Error al cambiar la contraseña");
				result = new ModelAndView("redirect: showdetails.do?passChange=true");
			}
		}
		
		return result;
	}
	
	@RequestMapping(value="/uploadPhoto", method = RequestMethod.POST)
	public ModelAndView uploadPhoto(UploadImageForm form, HttpServletRequest request){
		
		log.debug("UserController - uploadImage()");
		
		ModelAndView result = null;
		
		User user = userService.findByPrincipal();
		user.setVersion(user.getVersion()-1);
		
		try {
			MultipartFile file = form.getFileData();
			if(file.getSize() > 0){

				user.setImage(file.getBytes());
				
			}
			beginTransaction();
			userService.save(user);
			commitTransaction();
			log.debug("Exito en uploadImage");
			result = new ModelAndView("redirect:showdetails.do");
		}catch (Throwable e) {
			log.debug("Error en save: " + e.getMessage());
			rollbackTransaction();
			result = new ModelAndView("redirect:showdetails.do");
		} 
		
		return result;
	}
	
	@RequestMapping(value = "/streamPhoto")
	public void streamPhoto(@RequestParam("user") int userId, HttpServletResponse response){
		
		log.debug("UserController - streamPhoto()");
		
		User user = userService.findOne(userId);
		if(user != null){
			try{
				response.setContentType("image/jpeg");
				OutputStream os = response.getOutputStream();
				os.write(user.getImage());
				os.flush();
			}catch(IOException exception){
				log.error("Error al mostrar la imagen: " + exception.getMessage());
			}	
			
		}
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report(@RequestParam int betId,
								@RequestParam int userId) {

		log.debug("BetController - report()");
		ModelAndView result;

		ReportForm form = new ReportForm();

		form.setBetId(betId);
		form.setUserId(userId);

		result = new ModelAndView("user/report");
		result.addObject("form", form);
		
		return result;
	}

	
	@RequestMapping(value = "/report", method = RequestMethod.POST, params = "save")
	public ModelAndView report(@Valid ReportForm form, BindingResult binding) {

		log.debug("BetController - report()");
		ModelAndView result;

		ReportUser report = reportService.create(form.getUserId());
		report.setText(form.getText());
		report.setType(form.getType());

		if (binding.hasErrors()) {
			result = createReportModelAndView(form);
		} else {
			try {
				beginTransaction();
				reportService.save(report);
				User user = userService.findOne(form.getUserId());
				user.setIsReported(true);
				userService.save(user);
				commitTransaction();
				result = betController.seeDetails(form.getBetId());
				result.addObject("reported", true);
			} catch (Throwable oops) {
				rollbackTransaction();
				result = betController.seeDetails(form.getBetId());
				result.addObject("reported", false);
			}
		}

		return result;
	}
	
	@RequestMapping(value = "/checkUsername")
	public @ResponseBody int checkUsername(@RequestParam String username){
		
		log.debug("UserController - checkUsername()");
		
		UserAccount user = accountRepository.findByUsername(username);
		
		if(user != null){
			return 0;
		}else{
			return 1;
		}
	}


	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(User user) {

		log.debug("UserController - createEditeModelAndView()");
		ModelAndView result;

		result = createEditModelAndView(user, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(User user, String message) {

		log.debug("UserController - createEditeModelAndView(,)");
		ModelAndView result;
		UploadImageForm form = new UploadImageForm();

		result = new ModelAndView("user/editdetails");
		result.addObject("user", user);
		result.addObject("message", message);
		result.addObject("uploadForm", form);

		return result;
	}
	
	protected ModelAndView createEditModelAndView(SignUpForm form) {

		log.debug("UserController - creteEditModelAndView()");

		ModelAndView result;

		result = createEditModelAndView(form, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(SignUpForm form,
			String message) {

		log.debug("UserController - createEditModelAndView(,)");

		assert form != null;

		ModelAndView result;
		UploadImageForm uploadForm = new UploadImageForm();

		result = new ModelAndView("security/register");
		result.addObject("signUpForm", form);
		result.addObject("uploadForm", uploadForm);
		result.addObject("message", message);

		return result;
	}
	
	protected ModelAndView createReportModelAndView(ReportForm form) {

		log.debug("UserController - createReportModelAndView()");
		ModelAndView result;

		result = createReportModelAndView(form, null);

		return result;
	}

	protected ModelAndView createReportModelAndView(ReportForm form,
			String message) {

		log.debug("UserController - createReportModelAndView(,)");

		assert form != null;
		ModelAndView result;

		result = new ModelAndView("user/report");
		result.addObject("form", form);
		result.addObject("message", message);

		return result;
	}


}