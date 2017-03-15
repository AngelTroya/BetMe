package forms;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class EditBetFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return EditBetForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		EditBetForm form = (EditBetForm) target;
		
		if(validateEnding(form.getEndingDate())){
			errors.rejectValue("endingDate", "bet.NotValidEnding");
		}
		
		if(form.getOptions().size() < 2){
			errors.rejectValue("options", "bet.notValidOptions");
		}
		
	}
	
	protected boolean validateEnding(String endingDate){
		DateTimeFormatter format = DateTimeFormat.forPattern("dd/MM/yyyy");
		DateTime current = new DateTime();
		DateTime ending = null;
		ending = format.parseDateTime(endingDate);
		if(ending.isBefore(current))
			return true;
		else
			return false;
	}
}
