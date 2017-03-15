package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class ReportBet extends DomainEntity {

	// Constructors -----------------------------------------------------------

	public ReportBet() {
		super();
	}

	// Attributes -------------------------------------------------------------

	// Atributos para el tipo de reporte
	private static final Integer IRRELEVANT = 0;
	private static final Integer OLD = 1;
	private static final Integer TEDIOUS = 2;
	private static final Integer SPAM = 3;
	private static final Integer ILLEGAL = 4;
	private static final Integer DUPLICATE = 5;
	private static final Integer WRONG = 6;

	private Integer type;
	private String text;

	@NotNull
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		if(!type.equals(ReportBet.DUPLICATE) && !type.equals(ReportBet.OLD) && !type.equals(ReportBet.ILLEGAL) && !type.equals(ReportBet.IRRELEVANT) && !type.equals(ReportBet.SPAM) && !type.equals(ReportBet.TEDIOUS) && !type.equals(ReportBet.WRONG))
			throw new IllegalArgumentException("Error al asignar el  tipo de reporte");
		this.type = type;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	// Relationships ----------------------------------------------------------

	private Bet bet;

	@NotNull
	@Valid
	@ManyToOne
	public Bet getBet() {
		return bet;
	}

	public void setBet(Bet bet) {
		this.bet = bet;
	}
	
	// Métodos útiles -----------------------------------------------------------
	
	public boolean esIrrelevant(){
		return type.equals(ReportBet.IRRELEVANT);
	}
	
	public boolean esOld(){
		return type.equals(ReportBet.OLD);
	}
	
	public boolean esTedious(){
		return type.equals(ReportBet.TEDIOUS);
	}
	
	public boolean esSpam(){
		return type.equals(ReportBet.SPAM);
	}
	
	public boolean esIllegal(){
		return type.equals(ReportBet.ILLEGAL);
	}
	
	public boolean esDuplicate(){
		return type.equals(ReportBet.DUPLICATE);
	}
	
	public boolean esWrong(){
		return type.equals(ReportBet.WRONG);
	}

}
