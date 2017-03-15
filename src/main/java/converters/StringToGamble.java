package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.GambleRepository;
import domain.Gamble;

@Component
@Transactional
public class StringToGamble implements Converter<String, Gamble> {

	@Autowired
	GambleRepository repository;

	@Override
	public Gamble convert(String text) {
		Gamble result;
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
