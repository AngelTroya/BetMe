package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class WinWinForBoth extends Bet {
	
	// Constructors -----------------------------------------------------------

	public WinWinForBoth() {
		super();
	}
		
	
	// Attributes -------------------------------------------------------------
	
	private Double betmin;
	private Double betmax;
	
	@NotNull
	@Digits(integer = 6, fraction = 2)
	public Double getBetmin() {
		return betmin;
	}
	
	public void setBetmin(Double betmin) {
		this.betmin = betmin;
	}
	
	@NotNull
	@Digits(integer = 6, fraction = 2)
	public Double getBetmax() {
		return betmax;
	}
	
	public void setBetmax(Double betmax) {
		this.betmax = betmax;
	}
	
	
	// Relationships ----------------------------------------------------------
	
	
}
