package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.ReportUserRepository;
import domain.ReportUser;

@Component
@Transactional
public class StringToReportUser implements Converter<String, ReportUser>{

	@Autowired
	ReportUserRepository repository;

	@Override
	public ReportUser convert(String text) {
		ReportUser result;
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
