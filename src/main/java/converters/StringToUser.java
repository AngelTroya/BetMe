package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.UserRepository;
import domain.User;

@Component
@Transactional
public class StringToUser implements Converter<String, User> {

	@Autowired
	UserRepository repository;

	@Override
	public User convert(String text) {
		User result;
		int id;

		try {
			id = Integer.valueOf(text);
			result = repository.findOne(id);
		} catch (Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}

}
