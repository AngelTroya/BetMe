package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Gamble;

@Component
@Transactional
public class GambleToString implements Converter<Gamble, String> {

	@Override
	public String convert(Gamble gamble) {
		String result;

		if (gamble == null)
			result = null;
		else
			result = String.valueOf(gamble.getId());

		return result;
	}

}
