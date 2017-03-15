package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ConfigurationRepository;
import domain.Configuration;

@Service
@Transactional
public class ConfigurationService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(ConfigurationService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private ConfigurationRepository configurationRepository;

	// Supporting services ----------------------------------------------------

	// TODO: Add supporting services.

	// Constructors -----------------------------------------------------------

	public ConfigurationService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Collection<Configuration> findAll() {
		
		log.debug("ConfigurationService - findAll()");
		
		Collection<Configuration> result;

		result = configurationRepository.findAll();

		return result;
	}

	public Configuration findOne(int configurationId) {
		
		log.debug("ConfigurationService - findOne()");
		
		Configuration result;
		
		result = configurationRepository.findOne(configurationId);

		return result;
	}

	public void save(Configuration configuration) {
		
		log.debug("ConfigurationService - save()");
		
		Assert.notNull(configuration);
		
		configurationRepository.save(configuration);
	}

	public void delete(Configuration configuration) {
		
		log.debug("ConfigurationService - delete()");
		
		Assert.notNull(configuration);
		
		configurationRepository.delete(configuration);
	}

	// Other business methods -------------------------------------------------
	
	public Configuration getLast(){
		
		log.debug("ConfigurationService - getLast()");
		
		Configuration result;
		
		result = configurationRepository.getLast().iterator().next();
		
		return result;
	}

}
