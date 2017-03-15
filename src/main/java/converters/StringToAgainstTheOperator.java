package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.AgainstTheOperatorRepository;
import domain.AgainstTheOperator;

@Component
@Transactional
public class StringToAgainstTheOperator implements Converter<String, AgainstTheOperator> {

	@Autowired
	AgainstTheOperatorRepository repository;

	@Override
	public AgainstTheOperator convert(String text) {
		AgainstTheOperator result;
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
