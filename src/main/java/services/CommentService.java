package services;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.CommentRepository;
import domain.Bet;
import domain.Comment;
import domain.User;

@Service
@Transactional
public class CommentService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(CommentService.class);

	// Managed repository -----------------------------------------------------

	@Autowired
	private CommentRepository commentRepository;

	// Supporting services ----------------------------------------------------
	
	@Autowired
	private UserService userService;
	@Autowired
	private BetService betService;
	@Autowired
	private UserVoteService voteService;

	// Constructors -----------------------------------------------------------

	public CommentService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------

	public Comment create(int betId){
		
		log.debug("CommentService - create()");
		
		Comment result;
		result = new Comment();
		
		User user = userService.findByPrincipal();
		result.setUser(user);
		user.addComment(result);
		
		Bet bet = betService.findOne(betId);
		result.setBet(bet);
		bet.addComment(result);
		
		result.setPositiveVotes(0);
		result.setNegativeVotes(0);
		result.setIsReported(false);
		
		return result;
	}

	public Collection<Comment> findAll() {
		
		log.debug("CommentService - findAll()");
		
		Collection<Comment> result;

		result = commentRepository.findAll();

		return result;
	}

	public Comment findOne(int commentId) {
		
		log.debug("CommentService - findOne()");
		
		Comment result;

		result = commentRepository.findOne(commentId);

		return result;
	}

	public void save(Comment comment) {
		
		log.debug("CommentService - save()");
		
		Assert.notNull(comment);
		
//		Bet bet = betService.findOne(comment.getBet().getId());
//		bet.addComment(comment);
//		betService.save(bet);
//		
//		User user = userService.findOne(comment.getBet().getId());
//		user.addComment(comment);
//		userService.save(user);
		
		commentRepository.save(comment);
	}

	public void delete(Comment comment) {
		
		log.debug("CommentService - delete()");
		
		voteService.deleteCommentVotes(comment);
		commentRepository.delete(comment);
	}
	
	public void deleteAll(Collection<Comment> comments) {
		
		log.debug("CommentService - deleteAll()");
		
		voteService.deleteCommentVotes(comments);		
		commentRepository.delete(comments);
	}

	// Other business methods -------------------------------------------------

}
