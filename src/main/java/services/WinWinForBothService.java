package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.WinWinForBothRepository;
import domain.Bet;
import domain.Configuration;
import domain.Moderator;
import domain.User;
import domain.WinWinForBoth;

@Service
@Transactional
public class WinWinForBothService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(WinWinForBothService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private WinWinForBothRepository winwinForBothRepository;

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private UserService userService;
	@Autowired
	private ModeratorService moderatorService;
	@Autowired
	private ConfigurationService configurationService;

	// Constructors -----------------------------------------------------------

	public WinWinForBothService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	public WinWinForBoth create(){
		
		log.debug("WinWinForBothService - create()");
		
		WinWinForBoth result = new WinWinForBoth();
		
		User user = userService.findByPrincipal();
		Moderator moderator = moderatorService.findAll().iterator().next();
		Configuration configuration = configurationService.getLast();

		result.setUser(user);
		result.setModerator(moderator);
		result.setConfiguration(configuration);

		configuration.addBet(result);
		moderator.addBet(result);
		
		result.setStatus(Bet.PROPOSED);
		result.setTotalGambles(0);
		result.setPositiveVotes(0);
		result.setNegativeVotes(0);
		result.setIsReported(false);
		
		result.setBetmax(configuration.getGlobalmax());
		result.setBetmin(configuration.getGlobalmin());
		
		return result;
	}

	public Collection<WinWinForBoth> findAll() {
		
		log.debug("WinWinForBothService - findAll()");
		
		Collection<WinWinForBoth> result;

		result = winwinForBothRepository.findAll();

		return result;
	}

	public WinWinForBoth findOne(int winwinForBothId) {
		
		log.debug("WinWinForBothService - findOne()");
		
		WinWinForBoth result;

		result = winwinForBothRepository.findOne(winwinForBothId);

		return result;
	}

	public WinWinForBoth save(WinWinForBoth winwinForBoth) {
		
		log.debug("WinWinForBothService - save()");
		
		Assert.notNull(winwinForBoth);
		
		return winwinForBothRepository.save(winwinForBoth);
	}

	public void delete(WinWinForBoth winwinForBoth) {
		
		log.debug("WinWinForBothService - delete()");
		
		winwinForBothRepository.delete(winwinForBoth);
	}

	// Other business methods -------------------------------------------------

}
