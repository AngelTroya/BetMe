package services;

import java.util.Collection;
import java.util.Date;

import javax.naming.OperationNotSupportedException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.GambleRepository;
import domain.Bet;
import domain.BetOption;
import domain.Gamble;
import domain.User;
import forms.GambleForm;

@Service
@Transactional
public class GambleService {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(GambleService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private GambleRepository gambleRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private UserService userService;
	@Autowired
	private BetService betService;
	@Autowired
	private BetOptionService betOptionService;

	// Constructors -----------------------------------------------------------

	public GambleService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Gamble create() {

		log.debug("GambleService - create()");

		Gamble result;

		result = new Gamble();

		return result;
	}

	public Gamble createUserGamble(GambleForm form, User user) {

		log.debug("GambleService - createUserGamble()");

		Gamble result;
		Bet bet = betService.findOne(form.getBetId());
		BetOption option = betOptionService.findOne(form.getBetOptionId());

		result = new Gamble();
		result.setUser(user);
		result.setBet(bet);
		result.setBetOption(option);
		result.setRate(option.getRate());
		result.setAmount(form.getAmount());

		user.addGamble(result);
		bet.addGamble(result);
		bet.gamble();
		option.gamble();

		return result;
	}

	public Collection<Gamble> findAll() {

		log.debug("GambleService - findAll()");

		Collection<Gamble> result;

		result = gambleRepository.findAll();

		return result;
	}

	public Gamble findOne(int gambleId) {

		log.debug("GambleService - findOne()");

		Gamble result;

		result = gambleRepository.findOne(gambleId);

		return result;
	}

	public void save(Gamble gamble) {

		log.debug("GambleService - save()");

		Assert.notNull(gamble);

		gambleRepository.save(gamble);
	}

	public void delete(Gamble gamble) throws OperationNotSupportedException {

		log.debug("GambleService - delete()");

		throw new OperationNotSupportedException(
				"No se permiten borrar apuestas");
	}
	
	public void deleteAll(Collection<Gamble> gambles) {

		log.debug("GambleService - deleteAll()");

		gambleRepository.delete(gambles);
	}

	// Other business methods -------------------------------------------------

	public Collection<Gamble> findPastByUser() {

		log.debug("GambleService - findPastByUser()");

		Collection<Gamble> result;
		Date currentMoment = new Date();
		User user = userService.findByPrincipal();
		result = gambleRepository.findPastByUser(user, currentMoment);
		Assert.notNull(result);

		return result;
	}

	public Collection<Gamble> findActiveByUser() {

		log.debug("GambleService - findActiveByUser()");

		Collection<Gamble> result;
		Date currentMoment = new Date();
		User user = userService.findByPrincipal();
		result = gambleRepository.findActiveByUser(user, currentMoment);
		Assert.notNull(result);

		return result;
	}

}
