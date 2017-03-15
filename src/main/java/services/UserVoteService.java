package services;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.UserVoteRepository;
import domain.Comment;
import domain.UserVote;

@Service
@Transactional
public class UserVoteService {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(UserVote.class);

	// Managed repository -----------------------------------------------------
	
	@Autowired
	private UserVoteRepository voteRepository;
	
	// Supporting services
	
	
	
	// Constructors ------------------------------------------------------------
	
	public UserVoteService(){
		super();
	}
	
	// Simple CRUD methods -----------------------------------------------------
	
	public Collection<UserVote> findAll() {

		log.debug("UserVoteService - findAll()");

		Collection<UserVote> result;

		result = voteRepository.findAll();

		return result;
	}

	public UserVote findOne(int voteId) {

		log.debug("UserVoteService - findOne()");

		UserVote result;

		result = voteRepository.findOne(voteId);

		return result;
	}

	public void save(UserVote vote) {

		log.debug("UserVoteService - save()");

		Assert.notNull(vote);

		voteRepository.save(vote);
	}
	
	public void save(Collection<UserVote> options){
		
		log.debug("UserVoteService - saveOptions()");
		
		Assert.notEmpty(options);
		
		voteRepository.save(options);
	}

	public void delete(UserVote vote) {

		log.debug("UserVoteService - delete()");

		voteRepository.delete(vote);
	}
	
	public void deleteAll(Collection<UserVote> votes) {

		log.debug("UserVoteService - deleteAll()");

		voteRepository.delete(votes);
	}
	
	// Other business methods ------------------------------------------------
	
	public void deleteCommentVotes(Comment comment){
		
		log.debug("UserVoteService - deleteCommentVotes()");
		
		Collection<UserVote> votes = voteRepository.getCommentsVotes(comment.getId());
		for(UserVote vote : votes){
			vote.removeComment(comment);
		}
	}

	public void deleteCommentVotes(Collection<Comment> comments) {

		log.debug("UserVoteService - deleteCommentVotes()");
		
		Collection<UserVote> votes = new ArrayList<UserVote>();
		for(Comment comment: comments){
			votes = voteRepository.getCommentsVotes(comment.getId());
			for(UserVote vote : votes){
				vote.removeComment(comment);
			}
		}
	}

}
