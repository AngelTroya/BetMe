package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;

import security.UserAccount;
import domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	@Query("select u from User u where u.id = ?1")
	User findUserById(int userId);
	
	@Query("select u from User u where u.userAccount = ?1")
	User findUserByUserAccount(UserAccount userAccount);
	
}
