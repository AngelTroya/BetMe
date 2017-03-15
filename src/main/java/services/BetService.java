package services;

import java.util.Collection;
import java.util.HashSet;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.BetRepository;
import domain.Bet;
import domain.BetOption;
import domain.Comment;
import domain.Gamble;
import domain.ReportBet;
import domain.User;

@Service
@Transactional
public class BetService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(BetService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private BetRepository betRepository;

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private UserService userService;
	@Autowired
	private BetOptionService betOptionService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReportBetService reportService;
	@Autowired
	private GambleService gambleService;

	// Constructors -----------------------------------------------------------

	public BetService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Collection<Bet> findAll() {
		
		log.debug("BetService - findAll()");
		
		Collection<Bet> result;

		result = betRepository.findAll();

		return result;
	}

	public Bet findOne(int betId) {
		
		log.debug("BetService - findOne()");
		
		Bet result;

		result = betRepository.findOne(betId);

		return result;
	}

	public void save(Bet bet) {
		
		log.debug("BetService - save()");
		
		Assert.notNull(bet);
		
		betRepository.save(bet);
	}

	public void delete(Bet bet) {
		
		log.debug("BetService - delete()");
		
		betRepository.delete(bet);
	}
	
public void deleteAll(Bet bet) {
		
		log.debug("BetService - deleteAll()");
		
		Collection<Gamble> gambles = bet.getGambles();
		Collection<Comment> comments = bet.getComments();
		Collection<ReportBet> reports = bet.getReports();
		Collection<BetOption> options = bet.getOptions();
		
		gambleService.deleteAll(gambles);
		commentService.deleteAll(comments);
		reportService.deleteAll(reports);
		betOptionService.deleteAll(options);
		
		betRepository.delete(bet);
		
	}
	
	public void deleteEdit(Bet bet) {
		
		log.debug("BetService - deleteEdit()");
		
		Collection<BetOption> options = bet.getOptions();
		betOptionService.deleteAll(options);
		
		betRepository.delete(bet);
		
	}

	// Other business methods -------------------------------------------------
	
	public Collection<Bet> findProposedBetsByUser(int userId){
		
		log.debug("BetService - findProposedBetsByUser("+ userId +")");
		
		Collection<Bet> bets = new HashSet<Bet>();
		
		bets = betRepository.findProposedBetsByUser(userId);
		
		return bets;
	}
	
	public Collection<Bet> findProposedBets(){
		
		log.debug("BetService - findProposedBets()");
		
		Collection<Bet> bets = new HashSet<Bet>();
		User user = userService.findByPrincipal();
		
		bets = findProposedBetsByUser(user.getId());
		
		return bets;
	}

	public Collection<Bet> findAcceptedBets() {

		log.debug("BetService - findAcceptedBets()");
		
		Collection<Bet> bets = betRepository.findAcceptedBets();
		
		return bets;
	}
	
	public Collection<Bet> findProposed() {

		log.debug("BetService - findProposed()");
		
		Collection<Bet> bets = betRepository.findProposedBets();
		
		return bets;
	}
	
	public Collection<Bet> findPending() {

		log.debug("BetService - findPending()");
		
		Collection<Bet> bets = betRepository.findPendingBets();
		
		return bets;
	}
	
	public Collection<Bet> findRejected() {

		log.debug("BetService - findRejected()");
		
		Collection<Bet> bets = betRepository.findRejectedBets();
		
		return bets;
	}
	
	public void accept(int betId) {
		
		log.debug("BetService - accept()");
		
		Bet bet = betRepository.findOne(betId);
		bet.setStatus(Bet.PENDING);
		save(bet);
	}
	
	public void acceptFinal(int betId) {
		
		log.debug("BetService - acceptFinal()");
		
		Bet bet = betRepository.findOne(betId);
		bet.setStatus(Bet.ACCEPTED);
		save(bet);
	}
	
	public void reject(int betId) {
		
		log.debug("BetService - reject()");
		
		Bet bet = betRepository.findOne(betId);
		bet.setStatus(Bet.REJECTED);
		save(bet);
	}

}
