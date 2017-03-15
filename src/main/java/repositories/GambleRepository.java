package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Gamble;
import domain.User;

@Repository
public interface GambleRepository extends JpaRepository<Gamble, Integer>{
	
	@Query("select g from Gamble g where g.user = ?1 and g.bet.endingDate < ?2")
	Collection<Gamble> findPastByUser(User user, Date currentMoment);
	
	@Query("select g from Gamble g where g.user = ?1 and g.bet.endingDate > ?2")
	Collection<Gamble> findActiveByUser(User user, Date currentMoment);
	
}
