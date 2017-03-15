package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.ReportUser;

@Repository
public interface ReportUserRepository extends JpaRepository<ReportUser, Integer>{

}
