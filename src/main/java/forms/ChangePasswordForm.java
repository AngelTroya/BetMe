package forms;

import org.hibernate.validator.constraints.NotBlank;

public class ChangePasswordForm {
	
	public ChangePasswordForm(){
		super();
	}
	
	private String oldPass;
	private String newPass1;
	private String newPass2;
	
	@NotBlank
	public String getOldPass() {
		return oldPass;
	}
	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}
	@NotBlank
	public String getNewPass1() {
		return newPass1;
	}
	public void setNewPass1(String newPass1) {
		this.newPass1 = newPass1;
	}
	@NotBlank
	public String getNewPass2() {
		return newPass2;
	}
	public void setNewPass2(String newPass2) {
		this.newPass2 = newPass2;
	}
}
