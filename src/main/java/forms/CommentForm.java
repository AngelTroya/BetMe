package forms;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class CommentForm {
	
	public CommentForm(){
		super();
	}
	
	private String text;
	private int idBet;
	
	@NotBlank
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	@NotNull
	public int getIdBet() {
		return idBet;
	}
	public void setIdBet(int idBet) {
		this.idBet = idBet;
	}
	
}
