package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;

@Entity
@Access(AccessType.PROPERTY)
public class AgainstTheOperator extends Bet {
	
	// Constructors -----------------------------------------------------------

	public AgainstTheOperator() {
		super();
	}
				
	// Attributes -------------------------------------------------------------
	
	// Relationships ----------------------------------------------------------
	
	
}
