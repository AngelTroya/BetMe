package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.ReportBet;

@Component
@Transactional
public class ReportBetToString implements Converter<ReportBet, String> {

	@Override
	public String convert(ReportBet report) {
		String result;

		if (report == null)
			result = null;
		else
			result = String.valueOf(report.getId());

		return result;
	}

}
