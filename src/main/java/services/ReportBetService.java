package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.ReportBetRepository;
import domain.Bet;
import domain.ReportBet;

@Service
@Transactional
public class ReportBetService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(ReportBetService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private ReportBetRepository reportRepository;
	

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private BetService betService;

	// Constructors -----------------------------------------------------------

	public ReportBetService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	public ReportBet create(int betId){
		
		log.debug("ReportService - create()");
		
		ReportBet result;
		result = new ReportBet();
		
		Bet bet = betService.findOne(betId);
		result.setBet(bet);
		bet.addReport(result);
		
		return result;
	}

	public Collection<ReportBet> findAll() {
		
		log.debug("ReportService - findAll()");
		
		Collection<ReportBet> result;

		result = reportRepository.findAll();

		return result;
	}

	public ReportBet findOne(int reportId) {
		
		log.debug("ReportService - findOne()");
		
		ReportBet result;

		result = reportRepository.findOne(reportId);

		return result;
	}

	public void save(ReportBet report) {
		
		log.debug("ReportService - save()");
		
		Assert.notNull(report);
		
		reportRepository.save(report);
	}

	public void delete(ReportBet report) {
		
		log.debug("ReportService - delete()");
		
		reportRepository.delete(report);
	}
	
	public void deleteAll(Collection<ReportBet> reports) {

		log.debug("ReportService - deleteAll()");

		reportRepository.delete(reports);
	}

	// Other business methods -------------------------------------------------

}
