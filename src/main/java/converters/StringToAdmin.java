package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.AdminRepository;
import domain.Admin;

@Component
@Transactional
public class StringToAdmin implements Converter<String, Admin> {

	@Autowired
	AdminRepository adminRepository;
	
	@Override
	public Admin convert(String admin) {
		Admin result;
		int id;
		
		try{
			id = Integer.valueOf(admin);
			result = adminRepository.findOne(id);
		}catch(Throwable oops){
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
