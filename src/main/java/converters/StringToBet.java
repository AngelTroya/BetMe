package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.BetRepository;
import domain.Bet;

@Component
@Transactional
public class StringToBet implements Converter<String, Bet> {

	@Autowired
	BetRepository repository;

	@Override
	public Bet convert(String text) {
		Bet result;
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
