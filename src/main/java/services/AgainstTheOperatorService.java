package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AgainstTheOperatorRepository;
import domain.AgainstTheOperator;
import domain.Bet;
import domain.Configuration;
import domain.Moderator;
import domain.User;

@Service
@Transactional
public class AgainstTheOperatorService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(AgainstTheOperatorService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private AgainstTheOperatorRepository againstTheOperatorRepository;

	// Supporting services ----------------------------------------------------

	// TODO: Add supporting services.
	
	@Autowired
	private UserService userService;
	@Autowired
	private ModeratorService moderatorService;
	@Autowired
	private ConfigurationService configurationService;

	// Constructors -----------------------------------------------------------

	public AgainstTheOperatorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	public AgainstTheOperator create(){
		
		log.debug("AgainstTheOperatorService - create()");
		
		AgainstTheOperator result = new AgainstTheOperator();
		
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
		
		return result;
	}

	public Collection<AgainstTheOperator> findAll() {
		
		log.debug("AgainstTheOperatorService - findAll()");
		
		Collection<AgainstTheOperator> result;

		result = againstTheOperatorRepository.findAll();

		return result;
	}

	public AgainstTheOperator findOne(int againstTheOperatorId) {
		
		log.debug("AgainstTheOperatorService - findOne()");
		
		AgainstTheOperator result;

		result = againstTheOperatorRepository.findOne(againstTheOperatorId);

		return result;
	}

	public AgainstTheOperator save(AgainstTheOperator againstTheOperator) {
		
		log.debug("AgainstTheOperatorService - save()");
		
		Assert.notNull(againstTheOperator);
		
		return againstTheOperatorRepository.save(againstTheOperator);
		
	}

	public void delete(AgainstTheOperator againstTheOperator) {
		
		log.debug("AgainstTheOperatorService - delete()");
		
		againstTheOperatorRepository.delete(againstTheOperator);
	}

	// Other business methods -------------------------------------------------

}
