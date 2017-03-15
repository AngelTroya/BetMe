package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.BetOption;

@Component
@Transactional
public class BetOptionToString implements Converter<BetOption, String> {

	@Override
	public String convert(BetOption option) {
		String result;

		if (option == null)
			result = null;
		else
			result = String.valueOf(option.getId());

		return result;
	}

}
