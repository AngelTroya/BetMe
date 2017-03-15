package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.ReportBetRepository;
import domain.ReportBet;

@Component
@Transactional
public class StringToReportBet implements Converter<String, ReportBet> {

	@Autowired
	ReportBetRepository repository;

	@Override
	public ReportBet convert(String text) {
		ReportBet result;
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
