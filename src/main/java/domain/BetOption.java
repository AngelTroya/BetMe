package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class BetOption extends DomainEntity {
	
	// Constructors -----------------------------------------------------------

	public BetOption() {
		super();
	}
		
	
	// Attributes -------------------------------------------------------------
	
	private String name;
	private Float rate;
	private Boolean correct;
	private Integer nGambles;
	
	@NotBlank
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull
	@Min(1)
	public Float getRate() {
		return rate;
	}
	
	public void setRate(Float rate) {
		this.rate = rate;
	}
	
	@NotNull
	public Boolean getCorrect() {
		return correct;
	}
	
	public void setCorrect(Boolean correct) {
		this.correct = correct;
	}
	
	@NotNull
	@Min(0)
	public Integer getnGambles() {
		return nGambles;
	}

	public void setnGambles(Integer nGambles) {
		this.nGambles = nGambles;
	}	
	
	// Relationships ----------------------------------------------------------

	private Bet bet;

	@ManyToOne
	public Bet getBet() {
		return bet;
	}

	public void setBet(Bet bet) {
		this.bet = bet;
	}
	
	// Método útil para Gamble
	
	public void gamble(){
		nGambles++;
	}
	
}