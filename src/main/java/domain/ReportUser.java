package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class ReportUser extends DomainEntity {

	// Constructors -----------------------------------------------------------
	
	public ReportUser(){
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
			if(!type.equals(ReportUser.DUPLICATE) && !type.equals(ReportUser.OLD) && !type.equals(ReportUser.ILLEGAL) && !type.equals(ReportUser.IRRELEVANT) && !type.equals(ReportUser.SPAM) && !type.equals(ReportUser.TEDIOUS) && !type.equals(ReportUser.WRONG))
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

		private User user;
		
		@Valid
		@NotNull
		@ManyToOne
		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		
		// Métodos útiles -----------------------------------------------------------
		
		public boolean esIrrelevant(){
			return type.equals(ReportUser.IRRELEVANT);
		}
		
		public boolean esOld(){
			return type.equals(ReportUser.OLD);
		}
		
		public boolean esTedious(){
			return type.equals(ReportUser.TEDIOUS);
		}
		
		public boolean esSpam(){
			return type.equals(ReportUser.SPAM);
		}
		
		public boolean esIllegal(){
			return type.equals(ReportUser.ILLEGAL);
		}
		
		public boolean esDuplicate(){
			return type.equals(ReportUser.DUPLICATE);
		}
		
		public boolean esWrong(){
			return type.equals(ReportUser.WRONG);
		}

	
}
