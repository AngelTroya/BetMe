package domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Moderator extends Actor {
	
	// Constructors -----------------------------------------------------------

	public Moderator() {
		super();
		bets = new ArrayList<Bet>();
	}
				
	// Attributes -------------------------------------------------------------
	
	// Relationships ----------------------------------------------------------
	
	private Collection<Bet> bets;

	@NotNull	
	@OneToMany(mappedBy = "moderator")
	public Collection<Bet> getBets() {
		return bets;
	}

	public void setBets(Collection<Bet> bets) {
		this.bets = bets;
	}
	
	public void addBet(Bet bet) {		
		bets.add(bet);
		bet.setModerator(this);
	}

	public void removeBet(Bet bet) {		
		bets.remove(bet);
		bet.setModerator(null);
	}
	
}
