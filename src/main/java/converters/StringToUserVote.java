package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.UserVoteRepository;
import domain.UserVote;

@Component
@Transactional
public class StringToUserVote implements Converter<String, UserVote>{
	
	@Autowired
	private UserVoteRepository repository;

	@Override
	public UserVote convert(String string) {
		
		UserVote vote;
		int id;
		
		try{
			id = Integer.valueOf(string);
			vote = repository.findOne(id);
		}catch(Throwable oops){
			throw new IllegalArgumentException(oops);
		}
		
		return vote;
	}

}
