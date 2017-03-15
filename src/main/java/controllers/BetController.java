package controllers;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

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
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import services.AgainstTheOperatorService;
import services.BetOptionService;
import services.BetService;
import services.CommentService;
import services.ReportBetService;
import services.UserService;
import services.WinWinForBothService;
import utilities.Page;
import domain.AgainstTheOperator;
import domain.Bet;
import domain.BetOption;
import domain.Comment;
import domain.ReportBet;
import domain.User;
import domain.WinWinForBoth;
import forms.CommentForm;
import forms.EditBetForm;
import forms.EditBetFormValidator;
import forms.GambleForm;
import forms.ProposeBetForm;
import forms.ProposeBetFormValidator;
import forms.ReportForm;

@Controller
@Transactional
@RequestMapping("/bet")
public class BetController extends AbstractController {

	// Logger -----------------------------------------------------------------

	private static final Logger log = Logger.getLogger(BetController.class);

	// Services ---------------------------------------------------------------

	@Autowired
	private BetService betService;
	@Autowired
	private AgainstTheOperatorService againstTheOperatorService;
	@Autowired
	private WinWinForBothService winwinForBothService;
	@Autowired
	private BetOptionService optionService;
	@Autowired
	private UserService userService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReportBetService reportService;

	// Constructors -----------------------------------------------------------

	public BetController() {
		super();
	}

	// Show all bets -----------------------------------------------------------

	@RequestMapping(value = "/showBets", method = RequestMethod.GET)
	public ModelAndView showBets(@RequestParam(value="menuCat", defaultValue="") String cat,
								 @RequestParam(value="search", defaultValue="") String search) {

		log.debug("BetController - showBets()");

		ModelAndView result;
		
		result = new ModelAndView("bet/show");
		result.addObject("requestURI", "bet/showBets.do");
		result.addObject("cat", cat);
		result.addObject("search", search);

		return result;
	}

	// Show accepted bets ------------------------------------------------------

	@RequestMapping(value = "/showAcceptedBets", method = RequestMethod.GET)
	public ModelAndView showAcceptedBets() {

		log.debug("BetController - showAcceptedBets()");

		ModelAndView result;
		Collection<Bet> bets;

		bets = betService.findAcceptedBets();
		result = new ModelAndView("bet/show");
		result.addObject("requestURI", "bet/showAcceptedBets.do");
		result.addObject("bets", bets);

		return result;
	}

	// Show proposed bets ------------------------------------------------------

	@RequestMapping(value = "/showProposedBets", method = RequestMethod.GET)
	public ModelAndView showProposedBets() {

		log.debug("BetController - showProposedBets()");

		ModelAndView result;
		Collection<Bet> bets;
		User user = userService.findByPrincipal();

		bets = betService.findProposedBets();
		result = new ModelAndView("bet/show");
		result.addObject("requestURI", "bet/showProposedBets.do");
		result.addObject("bets", bets);
		result.addObject("userid", user.getId());

		return result;
	}
	
	@RequestMapping(value = "/myProposedBets", method = RequestMethod.GET)
	public ModelAndView myProposedBets(){
		
		log.debug("BetController - myProposedBets()");
		
		ModelAndView result;
		
		result = new ModelAndView("bet/show");
		result.addObject("requestURI", "bet/showBets.do");
		result.addObject("proposedByUser", "true");

		return result;
	}

	// See bet detail ----------------------------------------------------------

	@RequestMapping(value = "/seeDetails", method = RequestMethod.GET)
	public ModelAndView seeDetails(@RequestParam int betId) {

		log.debug("BetController - seeDetails()");

		ModelAndView result;
		Bet bet;
		GambleForm form = new GambleForm();
		User user = userService.findByPrincipal();

		bet = betService.findOne(betId);
		result = new ModelAndView("bet/details");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());
		result.addObject("user", user);
		result.addObject("userid", user.getId());
		result.addObject("form", form);
		result.addObject("votedBet", userService.betWasVoted(user, betId));

		return result;
	}
	
	// See public bet details --------------------------------------------------
	
	@RequestMapping(value="/seePublicDetails", method = RequestMethod.GET)
	public ModelAndView seeDetailsPublic(@RequestParam int betId){
		
		log.debug("BetController - seeDetails()");

		ModelAndView result;
		Bet bet;
		GambleForm form = new GambleForm();

		bet = betService.findOne(betId);
		result = new ModelAndView("bet/details");
		result.addObject("bet", bet);
		result.addObject("options", bet.getOptions());
		result.addObject("comments", bet.getComments());
		result.addObject("form", form);		
		
		return result;
	}

	// Search bets -------------------------------------------------------------

	@RequestMapping(value = "/searchAjax", method = RequestMethod.GET)
	public @ResponseBody ModelAndView searchBet(
			@RequestParam(value = "cat", defaultValue = "") String cat,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "p", defaultValue = "1") String p,
			@RequestParam(value = "ps", defaultValue = "10") String ps,
			@RequestParam(value = "proposedByUser", defaultValue = "") String proposedByUser) {

		log.debug("BetController - search()");

		ModelAndView result;
		Collection<Bet> bets = new ArrayList<Bet>();
		User user = null;
		
		result = new ModelAndView("bet/searchAjax");
		
		if(proposedByUser.equals("true")){
			user = userService.findByPrincipal();
		}		

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
				Query q2 = new TermQuery(new Term("status", "2"));
				Query qStr = parser.parse(queryStr+"*");
				if(!cat.isEmpty()){					
					q.add(new BooleanClause(q1, Occur.MUST));
				}
				q.add(new BooleanClause(q2, Occur.MUST));
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
								if(user != null){
									if(b.getUser().equals(user)){
										bets.add(b);
									}
								}else{
									bets.add(b);
								}
							}
						}
						result.addObject("bets", bets);
				}
			} else {
				BooleanQuery q = new BooleanQuery();
				Query q1 = new TermQuery(new Term("category", cat));
				Query q2 = new TermQuery(new Term("status", "2"));
				if(!cat.isEmpty()){
					if (!cat.isEmpty()) {
						q.add(q1, BooleanClause.Occur.MUST);
					}
					q.add(q2, BooleanClause.Occur.MUST);
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
								if(user != null){
									if(b.getUser().equals(user)){
										bets.add(b);
									}
								}else{
									bets.add(b);
								}
							}
						}
						result.addObject("bets", bets);
					}
				} else {
					if(user ==  null){
						bets = betService.findAcceptedBets();
					}else{
						bets = betService.findProposedBetsByUser(user.getId());
						if(bets.isEmpty()){
							result.addObject("noProposed", true);
						}
					}
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

	// Propose a bet
	// ---------------------------------------------------------------

	@RequestMapping(value = "/propose", method = RequestMethod.GET)
	public ModelAndView propose() {

		log.debug("BetController - propose()");

		ModelAndView result;
		ProposeBetForm form = new ProposeBetForm();

		result = createBetModelAndView(form);

		return result;
	}

	@RequestMapping(value = "/propose", method = RequestMethod.POST)
	public ModelAndView proposeBet(@Valid ProposeBetForm form,
			BindingResult binding) {

		log.debug("BetController - proposeBet()");

		ProposeBetFormValidator validator = new ProposeBetFormValidator();
		validator.validate(form, binding);
		ModelAndView result;

		if (binding.hasErrors()) {
			result = createBetModelAndView(form);
		} else {
			// Against the operator
			if (form.getType().equals(0)) {

				log.debug("BetController - ProposeBet() - AgainstTheOperator");

				AgainstTheOperator against = againstTheOperatorService.create();

				against.setName(form.getName());
				against.setDescription(form.getDescription());

				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date current = new Date();
				Date ending = new Date();
				try {
					ending = format.parse(form.getEndingDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				against.setStartDate(current);
				against.setEndingDate(ending);

				against.setCategory(form.getCategory());

				Collection<BetOption> options = form.getOptions();
				for (BetOption option : options) {
					option.setBet(against);
				}

				against.setOptions(options);

				try {
					beginTransaction();
					against = againstTheOperatorService.save(against);
					commitTransaction();
					addToIndex(against);
					log.debug("Propose a bet con éxito");
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=true");
				} catch (Throwable oops) {
					rollbackTransaction();
					log.debug("Error en save: " + oops.getMessage());
					result = new ModelAndView(
							"redirect:../welcome/index.do?showPropose=false");
				}
			}

			// WinwinForBoth
			else if (form.getType().equals(1)) {

				log.debug("BetController - ProposeBet() - WinWinForBoth");

				WinWinForBoth winwin = winwinForBothService.create();

				winwin.setName(form.getName());
				winwin.setDescription(form.getDescription());

				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date current = new Date();
				Date ending = new Date();
				try {
					ending = format.parse(form.getEndingDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				winwin.setStartDate(current);
				winwin.setEndingDate(ending);

				winwin.setCategory(form.getCategory());

				if (form.getMax() != null)
					winwin.setBetmax(form.getMax());
				if (form.getMin() != null)
					winwin.setBetmin(form.getMin());

				Collection<BetOption> options = form.getOptions();
				for (BetOption option : options) {
					option.setBet(winwin);
				}

				winwin.setOptions(options);

				try {
					beginTransaction();
					winwin = winwinForBothService.save(winwin);
					commitTransaction();
					addToIndex(winwin);
					log.debug("Propose a bet con éxito");
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=true");
				} catch (Throwable oops) {
					rollbackTransaction();
					log.debug("Error en save: " + oops.getMessage());
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=false");
				}

			} else { // No ha elegido categoría. Salta error
				result = new ModelAndView(
						"redirect:showProposedBets.do?showPropose=false");
			}

		}

		return result;
	}

	// Edit a bet
	// ---------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int betId) {

		log.debug("BetController - edit()");

		ModelAndView result;
		
		Bet bet = betService.findOne(betId);
		EditBetForm form = new EditBetForm();
		
		form.setCategory(bet.getCategory());
		form.setDescription(bet.getDescription());
		form.setEndingDate(bet.getEndingDate().toString());
		form.setName(bet.getName());
		form.setBetId(betId);
		for(BetOption option : bet.getOptions()){
			form.getOptions().add(option);
		}

		result = createEditModelAndView(form);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView edit(@Valid EditBetForm form, BindingResult binding) {

		log.debug("BetController - edit()");

		ModelAndView result;
		EditBetFormValidator validator = new EditBetFormValidator();
		validator.validate(form, binding);

		if (binding.hasErrors()) {
			result = createEditModelAndView(form);
		} else {

			Bet bet = betService.findOne(form.getBetId());

			// Against the operator
			if (form.getType().equals(0)) {

				log.debug("BetController - ProposeBet() - AgainstTheOperator");

				AgainstTheOperator against = againstTheOperatorService.create();

				against.setName(form.getName());
				against.setDescription(form.getDescription());

				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date current = new Date();
				Date ending = new Date();
				try {
					ending = format.parse(form.getEndingDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				against.setStartDate(current);
				against.setEndingDate(ending);

				against.setCategory(form.getCategory());

				Collection<BetOption> options = form.getOptions();
				for (BetOption option : options) {
					option.setBet(against);
				}

				against.setOptions(options);

				against.setComments(bet.getComments());
				betService.deleteEdit(bet);

				try {
					beginTransaction();
					againstTheOperatorService.save(against);
					commitTransaction();
					log.debug("Propose a bet con éxito");
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=true");
				} catch (Throwable oops) {
					rollbackTransaction();
					log.debug("Error en save: " + oops.getMessage());
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=false");
				}
			}

			// WinwinForBoth
			else if (form.getType().equals(1)) {

				log.debug("BetController - ProposeBet() - WinWinForBoth");

				WinWinForBoth winwin = winwinForBothService.create();

				winwin.setName(form.getName());
				winwin.setDescription(form.getDescription());

				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
				Date current = new Date();
				Date ending = new Date();
				try {
					ending = format.parse(form.getEndingDate());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				winwin.setStartDate(current);
				winwin.setEndingDate(ending);

				winwin.setCategory(form.getCategory());

				if (form.getMax() != null)
					winwin.setBetmax(form.getMax());
				if (form.getMin() != null)
					winwin.setBetmin(form.getMin());

				Collection<BetOption> options = form.getOptions();
				for (BetOption option : options) {
					option.setBet(winwin);
				}

				winwin.setOptions(options);

				winwin.setComments(bet.getComments());
				betService.deleteEdit(bet);

				try {
					beginTransaction();
					winwinForBothService.save(winwin);
					commitTransaction();
					log.debug("Propose a bet con éxito");
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=true");
				} catch (Throwable oops) {
					rollbackTransaction();
					log.debug("Error en save: " + oops.getMessage());
					result = new ModelAndView(
							"redirect:showProposedBets.do?showPropose=false");
				}

			} else { // No ha elegido categoría. Salta error
				result = new ModelAndView(
						"redirect:showProposedBets.do?showPropose=false");
			}

		}

		return result;
	}

	// New Comment
	// ---------------------------------------------------------------

	@RequestMapping(value = "/newComment", method = RequestMethod.GET)
	public ModelAndView newComment(@RequestParam int betId) {

		log.debug("BetController - newComment()");
		ModelAndView result;

		CommentForm form = new CommentForm();

		form.setIdBet(betId);

		result = createCommentModelAndView(form);
		return result;
	}

	@RequestMapping(value = "/newComment", method = RequestMethod.POST, params = "save")
	public ModelAndView saveNewComment(@Valid CommentForm form,
			BindingResult binding) {

		log.debug("BetController - saveNewComment()");
		ModelAndView result;

		Comment comment = commentService.create(form.getIdBet());
		comment.setText(form.getText());

		if (binding.hasErrors()) {
			result = createCommentModelAndView(form);
		} else {
			try {

				beginTransaction();
				commentService.save(comment);
				commitTransaction();
				result = seeDetails(form.getIdBet());
			} catch (Throwable oops) {
				rollbackTransaction();
				log.debug("Error en save: " + oops.getMessage());
				result = createCommentModelAndView(form, "bet.error");
			}
		}

		return result;
	}

	// Delete a comment
	// ----------------------------------------------------------

	@RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
	public ModelAndView deleteComment(@RequestParam int commentId) {
		ModelAndView result;

		Comment comment = commentService.findOne(commentId);
		Bet bet = comment.getBet();
		User user = userService.findByPrincipal();

		if (comment.getUser().equals(user)) {
			try {
				beginTransaction();
				commentService.delete(comment);
				commitTransaction();
				result = seeDetails(bet.getId());
				result.addObject("deleteError", true);
			} catch (Throwable oops) {
				rollbackTransaction();
				result = seeDetails(bet.getId());
				result.addObject("deleteError", false);
			}
		} else {
			result = seeDetails(bet.getId());
			result.addObject("deleteError", "userError");
		}

		return result;
	}

	// Report a bet
	// ---------------------------------------------------------------

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public ModelAndView report(@RequestParam int betId) {

		log.debug("BetController - report()");
		ModelAndView result;

		ReportForm form = new ReportForm();

		form.setBetId(betId);

		result = createReportModelAndView(form);
		return result;
	}

	@RequestMapping(value = "/report", method = RequestMethod.POST, params = "save")
	public ModelAndView report(@Valid ReportForm form, BindingResult binding) {

		log.debug("BetController - report()");
		ModelAndView result;

		ReportBet report = reportService.create(form.getBetId());
		report.setText(form.getText());
		report.setType(form.getType());

		if (binding.hasErrors()) {
			result = createReportModelAndView(form);
		} else {
			try {
				beginTransaction();
				reportService.save(report);
				commitTransaction();
				result = seeDetails(form.getBetId());
				result.addObject("reported", true);
			} catch (Throwable oops) {
				rollbackTransaction();
				result = seeDetails(form.getBetId());
				result.addObject("reported", false);
			}
		}

		return result;
	}

	// Ancillary methods ------------------------------------------------------
	
	protected void addToIndex(Bet bet) throws Exception {

		log.debug("BetController - addToIndex()");
		log.debug("Bet: id=> "+bet.getId()+", name=> "+bet.getName()+", description=> "+bet.getDescription()+", category=> "+bet.getCategory().toString()+", status=> "+bet.getStatus().toString());
		// Abrimos el índice
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_47);
		IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47, analyzer);
		log.debug("Se va a abrir el indice");
		Directory indexDir = FSDirectory.open(new File("/lucene/index/index"));
		log.debug("Directorio abierto");
		IndexWriter index = new IndexWriter(indexDir, config);
		log.debug("Indice abierto");
		// Se añade la apuesta a un documento
		Document doc = new Document();
		doc.add(new IntField("id", bet.getId(), Field.Store.YES));
		doc.add(new TextField("name", bet.getName(), Field.Store.YES));
		doc.add(new TextField("description", bet.getDescription(), Field.Store.YES));
		doc.add(new TextField("category", bet.getCategory().toString(), Field.Store.YES));
		doc.add(new TextField("status", bet.getStatus().toString(), Field.Store.YES));

		// Se añade el documento al índice
		index.addDocument(doc);
		log.debug("Apuesta añadida al índice: " + bet.getName());

		// Cerramos el índice
		index.close();
		indexDir.close();

	}

	protected ModelAndView createBetModelAndView(ProposeBetForm form) {

		log.debug("BetController - createBetModelAndView()");
		ModelAndView result;

		result = createBetModelAndView(form, null);

		return result;
	}

	protected ModelAndView createBetModelAndView(ProposeBetForm form,
			String message) {

		log.debug("BetController - createBetModelAndView(,)");

		assert form != null;
		ModelAndView result;

		result = new ModelAndView("bet/propose");
		result.addObject("form", form);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView createCommentModelAndView(CommentForm form) {

		log.debug("BetController - createCommentModelAndView()");
		ModelAndView result;

		result = createCommentModelAndView(form, null);

		return result;
	}

	protected ModelAndView createCommentModelAndView(CommentForm form,
			String message) {

		log.debug("BetController - createCommentModelAndView(,)");

		assert form != null;
		ModelAndView result;

		result = new ModelAndView("bet/newComment");
		result.addObject("form", form);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView createEditModelAndView(EditBetForm form) {

		log.debug("BetController - createEditModelAndView()");
		ModelAndView result;

		result = createEditModelAndView(form, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(EditBetForm form,
			String message) {

		log.debug("BetController - createEditModelAndView(,)");

		assert form != null;
		ModelAndView result;

		result = new ModelAndView("bet/edit");
		result.addObject("form", form);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView createReportModelAndView(ReportForm form) {

		log.debug("BetController - createReportModelAndView()");
		ModelAndView result;

		result = createReportModelAndView(form, null);

		return result;
	}

	protected ModelAndView createReportModelAndView(ReportForm form,
			String message) {

		log.debug("BetController - createReportModelAndView(,)");

		assert form != null;
		ModelAndView result;

		result = new ModelAndView("bet/report");
		result.addObject("form", form);
		result.addObject("message", message);

		return result;
	}

}
