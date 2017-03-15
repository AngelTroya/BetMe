package domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Configuration extends DomainEntity {
	
	// Constructors -----------------------------------------------------------

	public Configuration() {
		super();
		bets = new ArrayList<Bet>();
	}
		
	
	// Attributes -------------------------------------------------------------
	
	private Double globalmin;
	private Double globalmax;
	private Date date;
	
	@Digits(integer = 6, fraction = 2)
	public Double getGlobalmin() {
		return globalmin;
	}
	
	public void setGlobalmin(Double globalmin) {
		this.globalmin = globalmin;
	}
	
	@Digits(integer = 6, fraction = 2)
	public Double getGlobalmax() {
		return globalmax;
	}
	
	public void setGlobalmax(Double globalmax) {
		this.globalmax = globalmax;
	}
	
	@NotNull
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}	
	
	// Relationships ----------------------------------------------------------

	private Collection<Bet> bets;

	@NotNull	
	@OneToMany(mappedBy = "configuration")
	public Collection<Bet> getBets() {
		return bets;
	}

	public void setBets(Collection<Bet> bets) {
		this.bets = bets;
	}
	
	public void addBet(Bet bet) {		
		bets.add(bet);
		bet.setConfiguration(this);
	}

	public void removeBet(Bet bet) {		
		bets.remove(bet);
		bet.setConfiguration(null);
	}
	
	
}
