package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.UserVote;

@Component
@Transactional
public class UserVoteToString implements Converter<UserVote, String>{

	@Override
	public String convert(UserVote vote) {
		String result;
		
		if(vote == null)
			result = null;
		else
			result = String.valueOf(vote.getId());
		
		return result;
	}

}
