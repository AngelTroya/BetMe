/* AbstractController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.Assert;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AbstractController {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(AbstractController.class);
	
	// Panic handler ----------------------------------------------------------
	
	@ExceptionHandler(Throwable.class)
	public ModelAndView panic(Throwable oops) {
		
		log.debug("AbstractController - panic()");
		
		Assert.notNull(oops);
		
		ModelAndView result;

		result = new ModelAndView("misc/panic");
		result.addObject("name", ClassUtils.getShortName(oops.getClass()));
		result.addObject("message", oops.getMessage());
		result.addObject("stackTrace", ExceptionUtils.getStackTrace(oops));

		return result;
	}
	
	// Transaction management -------------------------------------------------
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	private TransactionStatus txStatus;
	
	protected void beginTransaction() {
		Assert.isNull(txStatus);
				
		beginTransaction(false);
	}
	
	protected void beginTransaction(boolean readOnly) {
		Assert.isNull(txStatus);
		
		DefaultTransactionDefinition definition; 
			
		definition = new DefaultTransactionDefinition();
		definition.setIsolationLevel(DefaultTransactionDefinition.ISOLATION_DEFAULT);
		definition.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRES_NEW);
		definition.setReadOnly(readOnly);		
		txStatus = transactionManager.getTransaction(definition);		
	}		
	
	protected void commitTransaction() {
		Assert.notNull(txStatus);
		
		try {
			transactionManager.commit(txStatus);
			txStatus = null;
		} catch (Throwable oops) {
			throw oops;
		}		
	}
	
	protected void rollbackTransaction() {
		Assert.notNull(txStatus);
		
		try {
			if (!txStatus.isCompleted())
				transactionManager.rollback(txStatus);
			txStatus = null;
		} catch (Throwable oops) {
			throw oops;
		} 
	}

}
