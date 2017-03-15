package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.ReportUser;

@Component
@Transactional

public class ReportUserToString implements Converter<ReportUser, String>{
	
	@Override
	public String convert(ReportUser report) {
		String result;

		if (report == null)
			result = null;
		else
			result = String.valueOf(report.getId());

		return result;
	}
}
