package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.User;
import domain.ReportUser;
import repositories.ReportUserRepository;

@Service
@Transactional
public class ReportUserService {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(ReportUserService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private ReportUserRepository reportRepository;

	// Supporting services ----------------------------------------------------

	@Autowired
	private UserService userService;

	// Constructors -----------------------------------------------------------

	public ReportUserService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public ReportUser create(int userId) {

		log.debug("ReportService - create()");

		ReportUser result;
		result = new ReportUser();

		User user = userService.findOne(userId);
		result.setUser(user);
		user.addReport(result);

		return result;
	}

	public Collection<ReportUser> findAll() {

		log.debug("ReportService - findAll()");

		Collection<ReportUser> result;

		result = reportRepository.findAll();

		return result;
	}

	public ReportUser findOne(int reportId) {

		log.debug("ReportService - findOne()");

		ReportUser result;

		result = reportRepository.findOne(reportId);

		return result;
	}

	public void save(ReportUser report) {

		log.debug("ReportService - save()");

		Assert.notNull(report);

		reportRepository.save(report);
	}

	public void delete(ReportUser report) {

		log.debug("ReportService - delete()");

		reportRepository.delete(report);
	}

	public void deleteAll(Collection<ReportUser> reports) {

		log.debug("ReportService - deleteAll()");

		reportRepository.delete(reports);
	}

	// Other business methods -------------------------------------------------

}
