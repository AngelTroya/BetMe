package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.BetOptionRepository;
import domain.BetOption;

@Component
@Transactional
public class StringToBetOption implements Converter<String, BetOption> {

	@Autowired
	BetOptionRepository repository;

	@Override
	public BetOption convert(String text) {
		BetOption result;
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
