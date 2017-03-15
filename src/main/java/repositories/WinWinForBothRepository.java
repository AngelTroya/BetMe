package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.WinWinForBoth;

@Repository
public interface WinWinForBothRepository extends JpaRepository<WinWinForBoth, Integer>{

}
