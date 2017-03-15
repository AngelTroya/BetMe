package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AdminRepository;
import domain.Admin;

@Service
@Transactional
public class AdminService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(AdminService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private AdminRepository adminRepository;

	// Supporting services ----------------------------------------------------

	// TODO: Add supporting services.

	// Constructors -----------------------------------------------------------

	public AdminService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Collection<Admin> findAll() {
		
		log.debug("AdminService - findAll()");
		
		Collection<Admin> result;

		result = adminRepository.findAll();

		return result;
	}

	public Admin findOne(int adminId) {
		
		log.debug("AdminService - findOne()");
		
		Admin result;

		result = adminRepository.findOne(adminId);

		return result;
	}

	public void save(Admin admin) {
		
		log.debug("AdminService - save()");
		
		Assert.notNull(admin);
		
		adminRepository.save(admin);
	}

	public void delete(Admin admin) {
		
		log.debug("AdminService - delete()");
		
		adminRepository.delete(admin);
	}

	// Other business methods -------------------------------------------------

}
