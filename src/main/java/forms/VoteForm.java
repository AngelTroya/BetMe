package forms;

import javax.validation.constraints.NotNull;

public class VoteForm {
	
	public VoteForm(){
		super();
	}
	
	private Integer objectId;

	@NotNull
	public Integer getObjectId() {
		return objectId;
	}

	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}

}
