/* UserAccountRepository.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package security;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAccountRepository extends
		JpaRepository<UserAccount, Integer> {

	UserAccount findByUsername(String username);

}
