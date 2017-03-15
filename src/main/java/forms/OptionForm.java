package forms;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class OptionForm {
	
	public OptionForm(){
		super();
	}
	
	private int optionId;
	private Float rate;
	
	@NotNull
	public int getOptionId() {
		return optionId;
	}
	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}
	
	
	@Digits(integer = 6, fraction = 2)
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}

}
