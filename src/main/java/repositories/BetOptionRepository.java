package repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import domain.BetOption;

public interface BetOptionRepository extends JpaRepository<BetOption, Integer> {

}
