package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Bet;

@Repository
public interface BetRepository extends JpaRepository<Bet, Integer>{
	
	@Query("select b from Bet b where b.user.id=?1 and b.status='0'")
	Collection<Bet> findProposedBetsByUser(int userId);

	@Query("select b from Bet b where b.status='2'")
	Collection<Bet> findAcceptedBets();
	
	@Query("select b from Bet b where b.status='0'")
	Collection<Bet> findProposedBets();
	
	@Query("select b from Bet b where b.status='1'")
	Collection<Bet> findPendingBets();
	
	@Query("select b from Bet b where b.status='3'")
	Collection<Bet> findRejectedBets();
}
