package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Bet;

@Component
@Transactional
public class BetToString implements Converter<Bet, String> {

	@Override
	public String convert(Bet bet) {
		String result;

		if (bet == null)
			result = null;
		else
			result = String.valueOf(bet.getId());

		return result;
	}

}
