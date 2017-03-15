/* PopulateDatabase.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package utilities;

import java.util.Map.Entry;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PopulateDatabase {

	public static void main(String[] args) {

		ApplicationContext ctx;
		EntityManagerFactory emf;
		EntityManager em;
		EntityTransaction et;

		ctx = new ClassPathXmlApplicationContext("utilities/PopulateDatabase.xml");

		emf = Persistence.createEntityManagerFactory("BetMe");		
		em = emf.createEntityManager();		
		et = em.getTransaction();

		et.begin();
		try {
			for (Entry<String, Object> entry : ctx.getBeansWithAnnotation(
					Entity.class).entrySet()) {
				em.persist(entry.getValue());
				System.out.println(String.format("Persisting (%s, %s@%d)",
						entry.getKey(), entry.getValue().getClass().getName(),
						entry.getValue().hashCode()));
			}
			et.commit();
		} catch (Exception oops) {
			oops.printStackTrace();
			et.rollback();
			oops.printStackTrace();
		} finally {
			if (em.isOpen())
				em.close();
			if (emf.isOpen())
				emf.close();
		}
	}
}
