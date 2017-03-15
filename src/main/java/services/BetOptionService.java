package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.BetOptionRepository;
import domain.BetOption;

@Service
@Transactional
public class BetOptionService {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(BetOptionService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private BetOptionRepository betOptionRepository;

	// Supporting services ----------------------------------------------------


	// Constructors -----------------------------------------------------------

	public BetOptionService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------	

	public Collection<BetOption> findAll() {

		log.debug("BetOptionService - findAll()");

		Collection<BetOption> result;

		result = betOptionRepository.findAll();

		return result;
	}

	public BetOption findOne(int betOptionId) {

		log.debug("BetOptionService - findOne()");

		BetOption result;

		result = betOptionRepository.findOne(betOptionId);

		return result;
	}

	public void save(BetOption betOption) {

		log.debug("BetOptionService - save()");

		Assert.notNull(betOption);

		betOptionRepository.save(betOption);
	}
	
	public void save(Collection<BetOption> options){
		
		log.debug("BetOptionService - saveOptions()");
		
		Assert.notEmpty(options);
		
		betOptionRepository.save(options);
	}

	public void delete(BetOption betOption) {

		log.debug("BetOptionService - delete()");

		betOptionRepository.delete(betOption);
	}
	
	public void deleteAll(Collection<BetOption> betOptions) {

		log.debug("BetOptionService - deleteAll()");

		betOptionRepository.delete(betOptions);
	}

	// Other business methods -------------------------------------------------

}
