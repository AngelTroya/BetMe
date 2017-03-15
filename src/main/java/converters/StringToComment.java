package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.CommentRepository;
import domain.Comment;

@Component
@Transactional
public class StringToComment implements Converter<String, Comment> {

	@Autowired
	CommentRepository repository;

	@Override
	public Comment convert(String text) {
		Comment result;
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
