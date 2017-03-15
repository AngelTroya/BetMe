package forms;

import java.text.SimpleDateFormat;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class SignUpFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return SignUpForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		SignUpForm form = (SignUpForm) target;
		boolean formatError = false;
		
		if(!form.getPassword1().equals(form.getPassword2())){
			errors.rejectValue("password2", "user.PasswordsNotEqual");
		}
		if(!form.getEmail1().equals(form.getEmail2())){
			errors.rejectValue("email2", "user.EmailNotEqual");
		}
		if(!validateDNI(form.getDni())){
			errors.rejectValue("dni", "user.DNIError");
		}
		try{
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			format.parse(form.getBirthDate());
		}catch(Exception e){
			errors.rejectValue("birthDate", "user.dateError");
			formatError = true;
		}
		if(!formatError){
			if(!validateAge(form.getBirthDate())){
				errors.rejectValue("birthDate", "user.BirthError");
			}
		}		
	}
	
	protected boolean validateDNI(String dni){
		if(dni.length() != 9){
			return false;
		}
		String[] tabla = {"T","R","W","A","G","M","Y","F","P","D","X","B","N","J","Z","S","Q","V","H","L","C","K","E"};
		Integer num = Integer.valueOf(dni.substring(0, 8));
		String letra = dni.substring(dni.length()-1);
		Integer modulo = num%23;
		
		if(!letra.equals(tabla[modulo])){
			return false;
		}else{
			return true;
		}
	}

	protected boolean validateAge(String birth){
		DateTimeFormatter format = DateTimeFormat.forPattern("dd/MM/yyyy");
		DateTime current = new DateTime();
		DateTime birthDate = null;
		birthDate = format.parseDateTime(birth);
		Days d = Days.daysBetween(birthDate.toLocalDate(), current.toLocalDate());
		Days d18 = Days.days(6570);
		if(d.isGreaterThan(d18))
			return true;
		else
			return false;
	}
}
