package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class Gamble extends DomainEntity {
	
	// Constructors -----------------------------------------------------------

	public Gamble() {
		super();
	}
		
	
	// Attributes -------------------------------------------------------------
	
	private Double amount;
	private Float rate;
	
	@NotNull
	@Digits(integer = 6, fraction = 2)
	public Double getAmount() {
		return amount;
	}
	
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	@NotNull
	public Float getRate() {
		return rate;
	}

	public void setRate(Float rate) {
		this.rate = rate;
	}
	
	
	// Relationships ----------------------------------------------------------

	private User user;
	private Bet bet;
	private BetOption betOption;
	

	@NotNull
	@Valid
	@ManyToOne
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@NotNull
	@Valid
	@ManyToOne
	public Bet getBet() {
		return bet;
	}

	public void setBet(Bet bet) {
		this.bet = bet;
	}
	
	@ManyToOne
	public BetOption getBetOption() {
		return betOption;
	}
	
	public void setBetOption(BetOption betOption) {
		this.betOption = betOption;
	}

	public String validate() {
		String error = "";
		Date date = new Date();
		if(bet.getConfiguration().getGlobalmax().compareTo(amount) < 0){
			error = "gamble.amountExceded";
		}
		if(bet.getConfiguration().getGlobalmin().compareTo(amount) > 0){
			error = "gamble.notEnoughAmount";
		}
		if(bet.getEndingDate().before(date)){
			error = "gamble.pastBet";
		}
		if(!bet.getStatus().equals(Bet.ACCEPTED))
			error = "gamble.notAccepted";
		
		return error;
	}
	
}
