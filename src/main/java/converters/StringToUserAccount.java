package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import security.UserAccount;
import security.UserAccountRepository;

@Component
@Transactional
public class StringToUserAccount implements Converter<String, UserAccount>{

	@Autowired
	UserAccountRepository userAccountRepository;
	
	@Override
	public UserAccount convert(String string) {
		UserAccount userAccount;
		int id;
		
		try{
			id = Integer.valueOf(string);
			userAccount = userAccountRepository.findOne(id);
		}catch(Throwable oops){
			throw new IllegalArgumentException(oops);
		}
		
		return userAccount;
	}

}
