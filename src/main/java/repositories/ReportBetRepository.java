package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.ReportBet;

@Repository
public interface ReportBetRepository extends JpaRepository<ReportBet, Integer>{

}
