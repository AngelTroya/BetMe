package forms;

import javax.validation.constraints.NotNull;

public class GambleForm {
	
	public GambleForm(){
		super();
	}
	
	private Integer betId;
	private Integer betOptionId;
	private Double amount;
	
	@NotNull
	public Integer getBetId() {
		return betId;
	}
	public void setBetId(Integer betId) {
		this.betId = betId;
	}
	
	@NotNull
	public Integer getBetOptionId() {
		return betOptionId;
	}
	public void setBetOptionId(Integer betOptionId) {
		this.betOptionId = betOptionId;
	}
	
	@NotNull
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}

}
