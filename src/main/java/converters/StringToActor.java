package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.ActorRepository;
import domain.Actor;

@Component
@Transactional
public class StringToActor implements Converter<String, Actor> {

	@Autowired
	ActorRepository actorRepository;

	@Override
	public Actor convert(String text) {
		Actor result;
		int id;

		try {
			id = Integer.valueOf(text);
			result = actorRepository.findOne(id);
		} catch (Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}

}
