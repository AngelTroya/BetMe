package services;

import java.util.Collection;
import java.util.HashSet;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.UserRepository;
import repositories.UserVoteRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import security.UserAccountRepository;
import domain.Bet;
import domain.Comment;
import domain.User;
import domain.UserVote;

@Service
@Transactional
public class UserService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(UserService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserAccountRepository userAccountRepository;
	@Autowired
	private UserVoteRepository userVoteRepository;

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private BetService betService;
	@Autowired
	private CommentService commentService;

	// Constructors -----------------------------------------------------------

	public UserService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	
	public User create(){
		
		log.debug("UserService - create()");

		User result = new User();
		UserVote votes = new UserVote();
		votes.setNumVotes(0);
		votes.setUser(result);
		result.setVotes(votes);
		
		return result;
	}

	public UserAccount createAccount(String username, String password){
		
		log.debug("UserService - createAccount()");
		
		UserAccount account;
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		
		account = new UserAccount();
		Authority auth = new Authority();
		auth.setAuthority(Authority.CUSTOMER);
		account.addAuthority(auth);
		account.setPassword(encoder.encodePassword(password, null));
		account.setUsername(username);
		
		return account;
	}	
	
	public Collection<User> findAll() {
		
		log.debug("UserService - findAll()");
		
		Collection<User> result;

		result = userRepository.findAll();

		return result;
	}

	public User findOne(int userId) {
		
		log.debug("UserService - findOne()");
		
		User result;

		result = userRepository.findOne(userId);

		return result;
	}

	public void save(User user) {
		
		log.debug("UserService - save()");
		
		Assert.notNull(user);

		userRepository.save(user);
	}

	public void delete(User user) {
		
		log.debug("UserService - delete()");
		
		Assert.notNull(user);
		Assert.isTrue(user.getId() != 0);

		userRepository.delete(user);
	}
	
	public void disable(User user){
		
		log.debug("UserService - disable()");
		
		Assert.notNull(user);
		Assert.isTrue(user.getId() != 0);
		
		user.getUserAccount().setActive(false);
		
		userRepository.save(user);
	}

	// Other business methods -------------------------------------------------

	public User findByPrincipal() {
		
		log.debug("UserService - findByPrincipal()");
		
		User result;
		UserAccount userAccount;
		
		userAccount = LoginService.getPrincipal();
		result = userRepository.findUserByUserAccount(userAccount);
		
		return result;
	}
	
	public Collection<Bet> getProposedBets(){
		Collection<Bet> bets = new HashSet<Bet>();
		User user = findByPrincipal();
		
		bets = betService.findProposedBetsByUser(user.getId());
		
		return bets;
	}
	
	public boolean voteBetPos(User user, Integer betId){
		
		boolean res = false;
		
		Bet betVoted = betService.findOne(betId);
		
		UserVote vote = userVoteRepository.existsUserBetVote(user.getId(), betId);
		
		if(vote == null){
			res = true;
			user.getVotes().addBet(betVoted);
			user.getVotes().addVote();
			betVoted.addUserVote(vote);
			betVoted.votePositive();
			betVoted.getUser().incrementKarma(betVoted);
		}
		
		return res;
	}
	
	public boolean voteBetNeg(User user, Integer betId){
		
		boolean res = false;
		
		Bet betVoted = betService.findOne(betId);
		
		UserVote vote = userVoteRepository.existsUserBetVote(user.getId(), betId);
		
		if(vote == null){
			res = true;
			user.getVotes().addBet(betVoted);
			user.getVotes().addVote();
			betVoted.addUserVote(vote);
			betVoted.voteNegative();
			betVoted.getUser().decrementKarma(betVoted);
		}
		
		return res;
	}
	
	public boolean voteCommentPos(User user, Integer commentId){
		
		boolean res = false;
		
		Comment commentVoted = commentService.findOne(commentId);
		
		UserVote vote = userVoteRepository.existsUserCommentVote(user.getId(), commentId);
		
		if(vote == null){
			res = true;
			user.getVotes().addComment(commentVoted);
			user.getVotes().addVote();
			commentVoted.addUserVote(vote);
			commentVoted.votePositive();
			commentVoted.getUser().incrementKarma(0.2);
		}
		
		return res;
	}

	public boolean voteCommentNeg(User user, Integer commentId){
	
		boolean res = false;
			
		Comment commentVoted = commentService.findOne(commentId);
	
		UserVote vote = userVoteRepository.existsUserCommentVote(user.getId(), commentId);
	
		if(vote == null){
			res = true;
			user.getVotes().addComment(commentVoted);
			user.getVotes().addVote();
			commentVoted.addUserVote(vote);
			commentVoted.voteNegative();
			commentVoted.getUser().decrementKarma(0.1);
		}
	
		return res;
	}
	
	public boolean betWasVoted(User user, Integer betId){
		
		boolean res = false;
		
		UserVote vote = userVoteRepository.existsUserBetVote(user.getId(), betId);
		
		if(vote != null){
			res = true;
		}
		
		return res;
	}
	
	public boolean commentWasVoted(User user, Integer commentId){
		
		boolean res = false;
		
		UserVote vote = userVoteRepository.existsUserCommentVote(user.getId(), commentId);
		
		if(vote != null){
			res = true;
		}
		
		return res;
	}
	
	public void report(int userId){

		User user = userRepository.findOne(userId);
		
		user.setIsReported(true);
	}

}
