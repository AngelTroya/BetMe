package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.BetOption;

@Repository
public interface OptionBetRepository extends JpaRepository<BetOption, Integer>{

}
