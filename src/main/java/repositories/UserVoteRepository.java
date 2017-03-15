package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.UserVote;

@Repository
public interface UserVoteRepository extends JpaRepository<UserVote, Integer>{
	
	@Query("select u from UserVote u, IN (u.bets) AS b where u.user.id = ?1 and b.id = ?2")
	UserVote existsUserBetVote(int userId, int betId);
	
	@Query("select u from UserVote u, IN (u.comments) AS c where u.user.id = ?1 and c.id = ?2")
	UserVote existsUserCommentVote(int userId, int commentId);
	
	@Query("select u from UserVote u, IN (u.comments) AS c where c.id = ?1")
	Collection<UserVote> getCommentsVotes(int commentId);
	
}
