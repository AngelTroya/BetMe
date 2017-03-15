package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.ModeratorRepository;
import domain.Moderator;

@Component
@Transactional
public class StringToModerator implements Converter<String, Moderator> {

	@Autowired
	ModeratorRepository repository;

	@Override
	public Moderator convert(String text) {
		Moderator result;
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
