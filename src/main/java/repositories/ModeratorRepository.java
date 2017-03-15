package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import security.UserAccount;
import domain.Moderator;
import domain.User;

@Repository
public interface ModeratorRepository extends JpaRepository<Moderator, Integer>{
	
	@Query("select t from Moderator t where t.userAccount = ?1")
	User findByUserAccount(UserAccount userAccount);

}
