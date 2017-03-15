package forms;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class ReportForm {
	
	public ReportForm(){
		super();
	}
	
	private String text;
	private Integer type;
	private int userId;
	private int betId;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@NotNull
	public int getBetId() {
		return betId;
	}
	public void setBetId(int betId) {
		this.betId = betId;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	@NotNull
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
}
