package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.WinWinForBoth;

@Component
@Transactional
public class WinWinForBothToString implements Converter<WinWinForBoth, String> {

	@Override
	public String convert(WinWinForBoth win) {
		String result;

		if (win == null)
			result = null;
		else
			result = String.valueOf(win.getId());

		return result;
	}

}
