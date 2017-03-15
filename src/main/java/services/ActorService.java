package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import repositories.ActorRepository;
import security.UserAccount;
import domain.Actor;

@Service
@Transactional
public class ActorService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(ActorService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private ActorRepository actorRepository;

	// Supporting services ----------------------------------------------------

	// TODO: Add supporting services.

	// Constructors -----------------------------------------------------------

	public ActorService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Collection<Actor> findAll() {
		
		log.debug("ActorService - findAll()");
		
		Collection<Actor> result;

		result = actorRepository.findAll();

		return result;
	}

	public Actor findOne(int actorId) {
		
		log.debug("ActorService - findOne()");
		
		Actor result;

		// TODO: Complete this method.
		result = null;

		return result;
	}

	public void save(Actor actor) {
		
		log.debug("ActorService - save()");
		
		// TODO: Complete this method.
	}

	public void delete(Actor actor) {
		
		log.debug("ActorService - delete()");
		
		// TODO: Complete this method.
	}

	// Other business methods -------------------------------------------------

	public UserAccount findUserAccount(Actor actor) {
		
		log.debug("ActorService - findUserAccount()");
		
		UserAccount result;

		// TODO: Complete this method.
		result = null;

		return result;
	}

}
