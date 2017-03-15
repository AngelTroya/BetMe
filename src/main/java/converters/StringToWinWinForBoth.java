package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.WinWinForBothRepository;
import domain.WinWinForBoth;

@Component
@Transactional
public class StringToWinWinForBoth implements Converter<String, WinWinForBoth> {

	@Autowired
	WinWinForBothRepository repository;

	@Override
	public WinWinForBoth convert(String text) {
		WinWinForBoth result;
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
