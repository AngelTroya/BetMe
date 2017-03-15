package forms;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadImageForm {
	
	public UploadImageForm(){
		super();
	}
	
	private CommonsMultipartFile fileData;
	

	public CommonsMultipartFile getFileData() {
		return fileData;
	}

	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

}
