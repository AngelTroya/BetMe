package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.ConfigurationRepository;
import domain.Configuration;

@Component
@Transactional
public class StringToConfiguration implements Converter<String, Configuration> {

	@Autowired
	ConfigurationRepository repository;

	@Override
	public Configuration convert(String text) {
		Configuration result;
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
