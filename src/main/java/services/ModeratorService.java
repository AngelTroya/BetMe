package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ModeratorRepository;
import domain.Moderator;

@Service
@Transactional
public class ModeratorService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(ModeratorService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private ModeratorRepository moderatorRepository;

	// Supporting services ----------------------------------------------------

	// TODO: Add supporting services.

	// Constructors -----------------------------------------------------------

	public ModeratorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Collection<Moderator> findAll() {
		
		log.debug("ModeratorService - findAll()");
		
		Collection<Moderator> result;

		result = moderatorRepository.findAll();

		return result;
	}

	public Moderator findOne(int moderatorId) {
		
		log.debug("ModeratorService - findOne()");
		
		Moderator result;
		
		result = moderatorRepository.findOne(moderatorId);

		return result;
	}

	public void save(Moderator moderator) {
		
		log.debug("ModeratorService - save()");
		
		Assert.notNull(moderator);
		
		moderatorRepository.save(moderator);
	}

	public void delete(Moderator moderator) {
		
		log.debug("ModeratorService - delete()");
		
		Assert.notNull(moderator);
		
		moderatorRepository.delete(moderator);
	}

	// Other business methods -------------------------------------------------

}
