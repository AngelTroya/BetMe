package domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public abstract class Bet extends DomainEntity {

	// Constructors -----------------------------------------------------------

	public Bet() {
		super();
		comments = new ArrayList<Comment>();
		gambles = new ArrayList<Gamble>();
		reports = new ArrayList<ReportBet>();
		options = new ArrayList<BetOption>();
		userVotes = new ArrayList<UserVote>();
	}

	// Attributes -------------------------------------------------------------

	// Atributos del estado de la apuesta
	public static final Integer PROPOSED = 0;
	public static final Integer PENDING = 1;
	public static final Integer ACCEPTED = 2;
	public static final Integer REJECTED = 3;

	// Atributos de la categoría de la apuesta
	public static final Integer SPORT = 0;
	public static final Integer CHANCE = 1;
	public static final Integer CONTEST = 2;
	public static final Integer EGAMES = 3;
	public static final Integer OTHERS = 4;

	private String name;
	private Date endingDate;
	private Date startDate;
	private Integer positiveVotes;
	private Integer negativeVotes;
	private Integer category;
	private Integer status;
	private Integer totalGambles;
	private String description;
	private Boolean isReported;

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getEndingDate() {
		return endingDate;
	}

	public void setEndingDate(Date endingDate) {
		this.endingDate = endingDate;
	}

	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	@NotNull
	@Min(0)
	public Integer getPositiveVotes() {
		return positiveVotes;
	}

	public void setPositiveVotes(Integer votes) {
		this.positiveVotes = votes;
	}
	
	@NotNull
	@Min(0)
	public Integer getNegativeVotes() {
		return negativeVotes;
	}

	public void setNegativeVotes(Integer votes) {
		this.negativeVotes = votes;
	}

	@NotNull
	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		if(!category.equals(Bet.CHANCE) && !category.equals(Bet.CONTEST) && !category.equals(Bet.EGAMES) && !category.equals(Bet.OTHERS) && !category.equals(Bet.SPORT))
			throw new IllegalArgumentException("Error al actualizar la categoría");
		this.category = category;
	}

	@NotNull
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		if(!status.equals(Bet.ACCEPTED) && !status.equals(Bet.PENDING) && !status.equals(Bet.PROPOSED) && !status.equals(Bet.REJECTED))
			throw new IllegalArgumentException("Fallo al actualizar el estado");
		this.status = status;
	}
	
	@NotNull
	@Min(0)
	public Integer getTotalGambles() {
		return totalGambles;
	}

	public void setTotalGambles(Integer totalGambles) {
		this.totalGambles = totalGambles;
	}	

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}	
	
	public Boolean getIsReported() {
		return isReported;
	}

	public void setIsReported(Boolean isReported) {
		this.isReported = isReported;
	}

	// Relationships ----------------------------------------------------------

	private Collection<Comment> comments;
	private Collection<Gamble> gambles;
	private Configuration configuration;
	private Collection<ReportBet> reports;
	private Moderator moderator;
	private Collection<BetOption> options;
	private User user;
	private Collection<UserVote> userVotes;

	@NotNull
	@OneToMany(mappedBy = "bet")
	public Collection<Comment> getComments() {
		return comments;
	}

	public void setComments(Collection<Comment> comments) {
		this.comments = comments;
	}

	public void addComment(Comment comment) {
		comments.add(comment);
	}

	public void removeComment(Comment comment) {
		comments.remove(comment);
	}

	@NotNull
	@OneToMany(mappedBy = "bet")
	public Collection<Gamble> getGambles() {
		return gambles;
	}

	public void setGambles(Collection<Gamble> gambles) {
		this.gambles = gambles;
	}

	public void addGamble(Gamble gamble) {
		gambles.add(gamble);
		gamble.setBet(this);
	}

	public void removeGamble(Gamble gamble) {
		gambles.remove(gamble);
		gamble.setBet(null);
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Configuration getConfiguration() {
		return configuration;
	}

	public void setConfiguration(Configuration configuration) {
		this.configuration = configuration;
	}

	@NotNull
	@OneToMany(mappedBy = "bet")
	public Collection<ReportBet> getReports() {
		return reports;
	}

	public void setReports(Collection<ReportBet> reports) {
		this.reports = reports;
	}

	public void addReport(ReportBet report) {
		reports.add(report);
		report.setBet(this);
	}

	public void removeReport(ReportBet report) {
		reports.remove(report);
		report.setBet(null);
	}

	@NotNull
	@Valid
	@ManyToOne(optional = false)
	public Moderator getModerator() {
		return moderator;
	}

	public void setModerator(Moderator moderator) {
		this.moderator = moderator;
	}

	@NotNull
	@Valid
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "bet")
	public Collection<BetOption> getOptions() {
		return options;
	}

	public void setOptions(Collection<BetOption> options) {
		this.options = options;
	}

	public void addOption(BetOption option) {
		options.add(option);
	}

	public void removeOption(BetOption option) {
		options.remove(option);
	}

	@NotNull
	@ManyToOne(optional = false)
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToMany(mappedBy = "bets")
	public Collection<UserVote> getUserVotes() {
		return userVotes;
	}

	public void setUserVotes(Collection<UserVote> userVotes) {
		this.userVotes = userVotes;
	}
	
	public void addUserVote(UserVote vote){
		this.userVotes.add(vote);
	}
	public void removeUserVote(UserVote vote){
		this.userVotes.remove(vote);
	}
	
	// Métodos útiles ------------------------------------------------------------
	
	public void gamble(){
		totalGambles++;
	}
	
	public void votePositive(){
		this.positiveVotes++;
		if(this.positiveVotes == 20) {
			this.status = 2;
		}
	}
	
	public void voteNegative(){
		this.negativeVotes++;
	}
	
	public boolean esProposed(){
		return category.equals(Bet.PROPOSED);
	}
	
	public boolean esPending(){
		return category.equals(Bet.PENDING);
	}
	
	public boolean esAccepted(){
		return category.equals(Bet.ACCEPTED);
	}
	
	public boolean esRejected(){
		return category.equals(Bet.REJECTED);
	}
	
	public boolean esSportType(){
		return category.equals(Bet.SPORT);
	}
	
	public boolean esChanceType(){
		return category.equals(Bet.CHANCE);
	}
	
	public boolean esContestType(){
		return category.equals(Bet.CONTEST);
	}
	
	public boolean esEGamesType(){
		return category.equals(Bet.EGAMES);
	}

	public boolean esOthersType(){
		return category.equals(Bet.OTHERS);
	}

}
