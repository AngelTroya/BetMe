package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.AgainstTheOperator;

@Component
@Transactional
public class AgainstTheOperatorToString implements Converter<AgainstTheOperator, String> {

	@Override
	public String convert(AgainstTheOperator againstTheOperator) {
		String result;

		if (againstTheOperator == null)
			result = null;
		else
			result = String.valueOf(againstTheOperator.getId());

		return result;
	}

}
