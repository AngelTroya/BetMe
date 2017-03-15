/* ModeratorController.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NumericRangeQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import services.BetOptionService;
import services.BetService;
import services.CommentService;
import services.ReportBetService;
import services.ReportUserService;
import services.UserService;
import utilities.Page;
import domain.Bet;
import domain.BetOption;
import domain.Comment;
import domain.ReportBet;
import domain.ReportUser;
import domain.User;
import forms.OptionForm;

@Controller
@RequestMapping("/moderator")
public class ModeratorController extends AbstractController {
	
	// Logger -----------------------------------------------------------------
	
	private static final Logger log = Logger.getLogger(ModeratorController.class);
	
	// Services ---------------------------------------------------------------
	
	@Autowired
	private BetService betService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReportBetService betReportService;
	@Autowired
	private ReportUserService userReportService;
	@Autowired
	private UserService userService;
	@Autowired
	private BetOptionService optionService;

	// Constructors -----------------------------------------------------------

	public ModeratorController() {
		super();
	}

	
	// Show accepted bets ------------------------------------------------------

	@RequestMapping(value = "/accepted", method = RequestMethod.GET)
	public ModelAndView accepted() {

		log.debug("ModeratorController - accepted()");

		ModelAndView result;
		Collection<Bet> bets;

		bets = betService.findAcceptedBets();
		result = new ModelAndView("moderator/accepted");
		result.addObject("requestURI", "moderator/accepted.do");
		result.addObject("bets", bets);

		return result;
	}	
	
	// Show proposed bets ------------------------------------------------------

	@RequestMapping(value = "/proposed", method = RequestMethod.GET)
	public ModelAndView proposed() {

		log.debug("ModeratorController - proposed()");

		ModelAndView result;
		Collection<Bet> bets;

		bets = betService.findProposed();
		result = new ModelAndView("moderator/proposed");
		result.addObject("requestURI", "moderator/proposed.do");
		result.addObject("bets", bets);

		return result;
	}	
	
	// Show pending bets ------------------------------------------------------

	@RequestMapping(value = "/pending", method = RequestMethod.GET)
	public ModelAndView pending() {

		log.debug("ModeratorController - pending()");

		ModelAndView result;
		Collection<Bet> bets;

		bets = betService.findPending();
		result = new ModelAndView("moderator/pending");
		result.addObject("requestURI", "moderator/pending.do");
		result.addObject("bets", bets);

		return result;
	}	
	
	// Show rejected bets ------------------------------------------------------

	@RequestMapping(value = "/rejected", method = RequestMethod.GET)
	public ModelAndView rejected() {

		log.debug("ModeratorController - rejected()");

		ModelAndView result;
		Collection<Bet> bets;

		bets = betService.findRejected();
		result = new ModelAndView("moderator/rejected");
		result.addObject("requestURI", "moderator/rejected.do");
		result.addObject("bets", bets);

		return result;
	}	
	
	@RequestMapping(value = "/betDetails", method = RequestMethod.GET)
	public ModelAndView betDetails(@RequestParam int betId){
		
		log.debug("ModeratorController - betDetails()");

		ModelAndView result;
		Bet bet;
		bet = betService.findOne(betId);
		
		result = new ModelAndView("moderator/betDetails");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());

		return result;
		
	}
	
	// See Accepted detail ----------------------------------------------------------

	@RequestMapping(value = "/detailsAccepted", method = RequestMethod.GET)
	public ModelAndView detailsAccepted(@RequestParam int betId) {

		log.debug("ModeratorController - detailsAccepted()");

		ModelAndView result;
		Bet bet;

		bet = betService.findOne(betId);
		result = new ModelAndView("moderator/detailsAccepted");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());

		return result;
	}
	
	// See Proposed detail ----------------------------------------------------------

	@RequestMapping(value = "/detailsProposed", method = RequestMethod.GET)
	public ModelAndView detailsProposed(@RequestParam int betId) {

		log.debug("ModeratorController - detailsProposed()");

		ModelAndView result;
		Bet bet;

		bet = betService.findOne(betId);
		result = new ModelAndView("moderator/detailsProposed");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());

		return result;
	}
	
	// See Pending detail ----------------------------------------------------------

	@RequestMapping(value = "/detailsPending", method = RequestMethod.GET)
	public ModelAndView detailsPending(@RequestParam int betId) {

		log.debug("ModeratorController - detailsPending()");

		ModelAndView result;
		Bet bet;

		bet = betService.findOne(betId);
		result = new ModelAndView("moderator/detailsPending");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());

		return result;
	}
	
	// See Rejected detail ----------------------------------------------------------

	@RequestMapping(value = "/detailsRejected", method = RequestMethod.GET)
	public ModelAndView detailsRejected(@RequestParam int betId) {

		log.debug("ModeratorController - detailsRejected()");

		ModelAndView result;
		Bet bet;

		bet = betService.findOne(betId);
		result = new ModelAndView("moderator/detailsRejected");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());

		return result;
	}
	
	
	// Accept a bet  ----------------------------------------------------------
	
	@RequestMapping(value = "/accept1", method = RequestMethod.GET)
	public ModelAndView accept1(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.accept(betId);
			commitTransaction();
			changeIndex(betId, Bet.PENDING);
			result = rejected();
			result.addObject("pending", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = rejected();
			result.addObject("pending", false);			
		}
		
		return result;
	}
	
	@RequestMapping(value = "/accept2", method = RequestMethod.GET)
	public ModelAndView accept2(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.accept(betId);
			commitTransaction();
			changeIndex(betId, Bet.PENDING);
			result = proposed();
			result.addObject("pending", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = proposed();
			result.addObject("pending", false);		
		}
		
		return result;
	}
	
	@RequestMapping(value = "/accept3", method = RequestMethod.GET)
	public ModelAndView accept3(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.acceptFinal(betId);
			commitTransaction();
			changeIndex(betId, Bet.ACCEPTED);
			result = pending();
			result.addObject("accepted", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = pending();
			result.addObject("accepted", false);			
		}
		
		return result;
	}
	
	
	// Reject a bet  ----------------------------------------------------------
	
	@RequestMapping(value = "/reject1", method = RequestMethod.GET)
	public ModelAndView reject1(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.reject(betId);
			commitTransaction();
			changeIndex(betId, Bet.REJECTED);
			result = accepted();
			result.addObject("rejected", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = accepted();	
			result.addObject("rejected", false);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/reject2", method = RequestMethod.GET)
	public ModelAndView reject2(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.reject(betId);
			commitTransaction();
			changeIndex(betId, Bet.REJECTED);
			result = proposed();
			result.addObject("rejected", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = proposed();
			result.addObject("rejected", false);		
		}
		
		return result;
	}
	
	@RequestMapping(value = "/reject3", method = RequestMethod.GET)
	public ModelAndView reject3(@RequestParam int betId) {
		ModelAndView result;		
				
		try {
			beginTransaction();
			betService.reject(betId);
			commitTransaction();
			changeIndex(betId, Bet.REJECTED);
			result = pending();
			result.addObject("rejected", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = pending();
			result.addObject("rejected", false);			
		}
		
		return result;
	}
	
	
	// Delete a comment  ----------------------------------------------------------
	
	@RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
	public ModelAndView deleteComment(@RequestParam int commentId) {
		ModelAndView result;	
		
		Comment comment = commentService.findOne(commentId);
		Bet bet = comment.getBet();
		Integer status = bet.getStatus();
				
		try {
			beginTransaction();
			commentService.delete(comment);
			commitTransaction();
			if(status == 0)
				result = detailsProposed(bet.getId());
			else if(status == 1)
				result = detailsPending(bet.getId());
			else if(status == 2)
				result = detailsAccepted(bet.getId());
			else
				result = detailsRejected(bet.getId());
			result.addObject("deleteComment", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			if(status == 0)
				result = detailsProposed(bet.getId());
			else if(status == 1)
				result = detailsPending(bet.getId());
			else if(status == 2)
				result = detailsAccepted(bet.getId());
			else
				result = detailsRejected(bet.getId());
			result.addObject("deleteComment", false);			
		}
		
		return result;
	}
	
	// Delete a bet  ----------------------------------------------------------
	
	@RequestMapping(value = "/deleteBet", method = RequestMethod.GET)
	public ModelAndView deleteBet(@RequestParam int betId) {
		ModelAndView result;	
		
		Bet bet = betService.findOne(betId);
				
		try {
			beginTransaction();
			betService.deleteAll(bet);
			commitTransaction();
			result = rejected();
			result.addObject("deleteBet", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = rejected();
			result.addObject("deleteBet", false);		
		}
		
		return result;
	}
	
	
	// Show reports ------------------------------------------------------

	@RequestMapping(value = "/reports", method = RequestMethod.GET)
	public ModelAndView reports() {

		log.debug("ModeratorController - reports()");

		ModelAndView result;
		Collection<ReportBet> betReports;
		Collection<ReportUser> userReports; 

		betReports = betReportService.findAll();
		userReports = userReportService.findAll();
		
		result = new ModelAndView("moderator/reports");
		
		result.addObject("requestURI", "moderator/reports.do");
		result.addObject("betReports", betReports);
		result.addObject("userReports", userReports);

		return result;
	}	
	
	
	// Show users ------------------------------------------------------

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public ModelAndView users() {

		log.debug("ModeratorController - users()");

		ModelAndView result;
		Collection<User> users;

		users = userService.findAll();
		result = new ModelAndView("moderator/users");
		result.addObject("requestURI", "moderator/users.do");
		result.addObject("users", users);

		return result;
	}	
	
	
	// Disable user ------------------------------------------------------
	
	@RequestMapping(value = "/disableUser", method = RequestMethod.GET)
	public ModelAndView disableUser(@RequestParam int userId) {
		ModelAndView result;	
		
		User user = userService.findOne(userId);
		Assert.notNull(user);
		user.getUserAccount().setActive(false);
		user.setVersion(user.getVersion()-1);
				
		try {
			beginTransaction();
			userService.save(user);
			commitTransaction();
			result = users();
			result.addObject("disable", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = users();
			result.addObject("disable", false);		
		}
		
		return result;
	}
	
	
	// Active user ------------------------------------------------------
	
	@RequestMapping(value = "/activeUser", method = RequestMethod.GET)
	public ModelAndView activeUser(@RequestParam int userId) {
		ModelAndView result;	
		
		User user = userService.findOne(userId);
		Assert.notNull(user);
		user.getUserAccount().setActive(true);
		user.setVersion(user.getVersion()-1);
				
		try {
			beginTransaction();
			userService.save(user);
			commitTransaction();
			result = users();
			result.addObject("active", true);
		} catch (Throwable oops) {
			rollbackTransaction();
			result = users();
			result.addObject("active", false);		
		}
		
		return result;
	}
	
	@RequestMapping(value = "/bets", method = RequestMethod.GET)
	public ModelAndView showBets(){
		
		log.debug("ModeratorController - showBets()");
		
		ModelAndView result;
		
		result = new ModelAndView("moderator/show");
		result.addObject("requestURI", "moderator/bets.do");
		
		return result;
	}
	
	@RequestMapping(value = "searchAjax", method = RequestMethod.GET)
	public @ResponseBody ModelAndView search(
			@RequestParam(value = "stat", defaultValue = "") String stat,
			@RequestParam(value = "cat", defaultValue = "") String cat,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "p", defaultValue = "1") String p,
			@RequestParam(value = "ps", defaultValue = "10") String ps){
		
		log.debug("ModeratorController - searchBet()");
		
		ModelAndView result;
		
		Collection<Bet> bets = new ArrayList<Bet>();

		result = new ModelAndView("moderator/searchAjax");

		String[] fields = { "id", "name", "description", "category", "status"};
		String queryStr = search;
		Page page = null;
		Integer pag = null;
		Integer numPages = 1;
		if (!p.isEmpty()) {
			pag = Integer.valueOf(p);
			page = new Page(pag);
		} else {
			page = new Page(1);
		}
		if (!ps.isEmpty()) {
			Integer pageSize = Integer.valueOf(ps);
			page.setPageSize(pageSize);
		}
		int start = page.getStart();
		int end = page.getEnd();

		try {
			// Abre el índice guardado
			Directory index = FSDirectory.open(new File("/lucene/index/index"));
			IndexSearcher searcher = new IndexSearcher(DirectoryReader.open(index));
			// Crea el parser para la consulta y escanea la consulta del usuario
			MultiFieldQueryParser parser = new MultiFieldQueryParser(Version.LUCENE_47, fields, new StandardAnalyzer(Version.LUCENE_47));
			if (!queryStr.isEmpty()) {
				TopDocs td = null;
				BooleanQuery q = new BooleanQuery();
				Query q1 = new TermQuery(new Term("category", cat));
				Query q2 = new TermQuery(new Term("status", stat));
				Query qStr = parser.parse(queryStr+"*");
				if(!cat.isEmpty()){					
					q.add(new BooleanClause(q1, Occur.MUST));
				}
				if(!stat.isEmpty()){
					q.add(new BooleanClause(q2, Occur.MUST));
				}
				q.add(new BooleanClause(qStr, Occur.MUST));
				td = searcher.search(q, end);

				// Guarda en hits los documentos que concuerden con la búsqueda
				page.setTotalCount(td.totalHits);
				ScoreDoc[] hits = td.scoreDocs;
				if (hits != null) {
						// Recorre el array de los resultados, y añade en el
						// Collection para ir mostrarlo.
						for (int i = start; i < hits.length; i++) {
							Document doc = searcher.doc(hits[i].doc);
							Bet b = null;
							try {
								b = betService.findOne(Integer.valueOf(doc.get("id")));
							} catch (Exception e) {
								log.debug("Bet no encontrada: "	+ e.getMessage());
							}
							if (b != null) {
								bets.add(b);
							}
						}
						result.addObject("bets", bets);
				}
			} else {
				BooleanQuery q = new BooleanQuery();
				Query q1 = new TermQuery(new Term("category", cat));
				Query q2 = new TermQuery(new Term("status", stat));
				if(!cat.isEmpty() || !stat.isEmpty()){
					if (!cat.isEmpty()) {
						q.add(q1, BooleanClause.Occur.MUST);
					}
					if(!stat.isEmpty()){
						q.add(q2, BooleanClause.Occur.MUST);
					}	
					// Guarda en hits los documentos que concuerden con la búsqueda
					TopDocs td = searcher.search(q, end);
					ScoreDoc[] hits = td.scoreDocs;
					page.setTotalCount(td.totalHits);
					if (hits != null) {
						for (int i = start; i < hits.length; i++) {
							Document doc = searcher.doc(hits[i].doc);
							Bet b = null;
							try {
								b = betService.findOne(Integer.valueOf(doc.get("id")));
							} catch (Exception e) {
								log.debug("Bet no encontrada: "	+ e.getMessage());
							}
							if (b != null) {
								bets.add(b);
							}
						}
						result.addObject("bets", bets);
					}
				} else {
					bets = betService.findAll();
					result.addObject("bets", bets);
				}
			}
			index.close(); // Cierra el índice
		} catch (IOException e) {
			log.debug("BetController - search() - Error: " + e.getMessage());
		} catch (org.apache.lucene.queryparser.classic.ParseException e) {
			log.debug("BetController - search() - ParseException: " + e.getMessage());
		}

		numPages = page.getPageCount();
	
		result.addObject("page", page.getCurrentPageNo());
		result.addObject("numPages", numPages);
		
		return result;
	}
	
	
	// Edit an option
	// ---------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int optionId) {

		log.debug("ModeratorController - edit()");
		ModelAndView result;
		
		OptionForm form = new OptionForm();
		form.setOptionId(optionId);

		result = createOptionModelAndView(form);
		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView edit(@Valid OptionForm form, BindingResult binding) {

		log.debug("ModeratorController - edit()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createOptionModelAndView(form);
		} else {
			try {
				
				BetOption option = optionService.findOne(form.getOptionId());
				option.setRate(form.getRate());
				
				beginTransaction();
				optionService.save(option);
				commitTransaction();
				result = betDetails(option.getBet().getId());
				result.addObject("edited", true);
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createOptionModelAndView(form, "bet.error");
				result.addObject("edited", false);
			}
		}

		return result;
	}
	
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	public ModelAndView deposit(@RequestParam int userId) {

		log.debug("MoneyController - deposit()");
		ModelAndView result;
		User user = userService.findOne(userId);
		Assert.notNull(user);
		result = createDepositModelAndView(user);
		return result;
	}
	
	protected ModelAndView createDepositModelAndView(User user) {

		log.debug("MoneyController - createDepositModelAndView()");
		ModelAndView result;

		result = createDepositModelAndView(user, null);

		return result;
	}

	protected ModelAndView createDepositModelAndView(User user, String message) {

		log.debug("MoneyController - createDepositModelAndView(,)");
		ModelAndView result;

		result = new ModelAndView("money/deposit");
		result.addObject("user", user);
		result.addObject("message", message);

		return result;
	}
	
	@RequestMapping(value = "/deposit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveDeposit(@Valid User user, BindingResult binding) {

		log.debug("ModeratorController - saveDeposit()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createDepositModelAndView(user);
		} else {
			try {
				
				User u1 = userService.findOne(user.getId());
				Double d1 = u1.getMoney();
				Double d2 = user.getMoney();
								
				User u3 = user;
				u3.setMoney(d1 + d2);
				
				beginTransaction();
				userService.save(u3);
				commitTransaction();
				result = new ModelAndView("redirect:users.do");
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createDepositModelAndView(user, "money.error");
			}
		}

		return result;
	}
	
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	public ModelAndView withdraw(@RequestParam int userId) {

		log.debug("ModeratorController - withdraw()");
		ModelAndView result;
		User user = userService.findOne(userId);
		Assert.notNull(user);
		result = createWithdrawModelAndView(user);
		return result;
	}

	@RequestMapping(value = "/withdraw", method = RequestMethod.POST, params = "save")
	public ModelAndView saveWithdraw(@Valid User user, BindingResult binding) {

		log.debug("ModeratorController - saveWithdraw()");
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createWithdrawModelAndView(user);
		} else {
			try {
				log.debug("ModeratorController - savewithdraw(1)");
				User u1 = userService.findOne(user.getId());
				log.debug("ModeratorController - savewithdraw(2)");
				Double d1 = u1.getMoney();
				log.debug("ModeratorController - savewithdraw(3)");
				Double d2 = user.getMoney();
				log.debug("ModeratorController - savewithdraw(4)");
				
				User u3 = user;
				u3.setMoney(d1 - d2);
				if (u3.getMoney() >= 0) {
					beginTransaction();
					userService.save(u3);
					commitTransaction();
					result = new ModelAndView("redirect:users.do");
				} else {
					result = createWithdrawModelAndView(user, "money.error");
				}
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createWithdrawModelAndView(user, "money.error");
			}
		}

		return result;
	}
	// Ancillary methods ------------------------------------------------------
	
	protected ModelAndView createWithdrawModelAndView(User user) {

		log.debug("ModeratorController - createWithdrawModelAndView()");
		ModelAndView result;

		result = createWithdrawModelAndView(user, null);

		return result;
	}

	protected ModelAndView createWithdrawModelAndView(User user, String message) {

		log.debug("ModeratorController - createWithdrawModelAndView(,)");
		ModelAndView result;

		result = new ModelAndView("money/withdraw");
		result.addObject("user", user);
		result.addObject("message", message);

		return result;
	}
	
	protected void changeIndex(Integer betId, Integer status) throws Exception{
		
		log.debug("ModeratorController - changeIndex()");
	
		// Abrimos el índice
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_47);
		Directory indexDir = FSDirectory.open(new File("/lucene/index/index"));
		// Buscamos el documento
		IndexSearcher searcher = new IndexSearcher(DirectoryReader.open(indexDir));	
		Query q = NumericRangeQuery.newIntRange("id", betId, betId, true, true);
		ScoreDoc[] hits = searcher.search(q, 10).scoreDocs;
		Document d = null;
		Document doc = null;
		if(hits != null && hits.length == 1){
			doc = searcher.doc(hits[0].doc);
			d = new Document();
			d.add(new IntField("id", betId, Field.Store.YES));
			d.add(new TextField("name", doc.get("name"), Field.Store.YES));
			d.add(new TextField("description", doc.get("description"), Field.Store.YES));
			d.add(new TextField("category", doc.get("category"), Field.Store.YES));
			d.add(new TextField("status", status.toString(), Field.Store.YES));
		}
		// Sobreescribimos el documento en el índice con el status cambiado
		if(d != null){
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47,	analyzer);
			IndexWriter index = new IndexWriter(indexDir, config);
			index.deleteDocuments(q);
			index.addDocument(d);
			index.close();
		}			
		indexDir.close();
	}
	
	
		protected ModelAndView createOptionModelAndView(OptionForm form) {

			log.debug("MoneyController - createOptionModelAndView()");
			ModelAndView result;

			result = createOptionModelAndView(form, null);

			return result;
		}

		protected ModelAndView createOptionModelAndView(OptionForm form, String message) {

			log.debug("MoneyController - createOptionModelAndView(,)");
			ModelAndView result;

			result = new ModelAndView("moderator/edit");
			result.addObject("form", form);
			result.addObject("message", message);

			return result;
		}
}
