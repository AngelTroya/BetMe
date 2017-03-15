package domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class User extends Actor {
	
	// Constructors -----------------------------------------------------------

	public User() {
		super();
		comments = new ArrayList<Comment>();
		gambles = new ArrayList<Gamble>();
		reports = new ArrayList<ReportUser>();
	}
			
	// Attributes -------------------------------------------------------------
	
	private Double karma;
	private Double money;
	private byte[] image;
	private Boolean isReported;
	
	@Min(0)
	@Max(20)
	@NotNull
	public Double getKarma() {
		return karma;
	}
	
	public void setKarma(Double karma) {
		this.karma = karma;
	}
	
	@Min(0)
	@Digits(integer = 20, fraction = 2)
	public Double getMoney() {
		return money;
	}
	
	public void setMoney(Double money) {
		this.money = money;
	}
	
	@Lob
	public byte[] getImage() {
		return image;
	}
	
	public void setImage(byte[] image) {
		this.image = image;
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
	private UserVote votes;
	private Collection<ReportUser> reports;

	@OneToMany(mappedBy = "user")
	public Collection<Comment> getComments() {
		return comments;
	}

	public void setComments(Collection<Comment> comments) {
		this.comments = comments;
	}

	public void addComment(Comment comment) {		
		comments.add(comment);
		comment.setUser(this);
	}

	public void removeComment(Comment comment) {		
		comments.remove(comment);
		comment.setUser(null);
	}
		
	@OneToMany(mappedBy = "user")
	public Collection<Gamble> getGambles() {
		return gambles;
	}

	public void setGambles(Collection<Gamble> gambles) {
		this.gambles = gambles;
	}
	
	public void addGamble(Gamble gamble) {		
		gambles.add(gamble);
		gamble.setUser(this);
	}

	public void removeGamble(Gamble gamble) {		
		gambles.remove(gamble);
		gamble.setUser(null);
	}
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
	public UserVote getVotes() {
		return votes;
	}

	public void setVotes(UserVote votes) {
		this.votes = votes;
	}
	
	@OneToMany(mappedBy = "user")
	public Collection<ReportUser> getReports() {
		return reports;
	}

	public void setReports(Collection<ReportUser> reports) {
		this.reports = reports;
	}
	
	public void addReport(ReportUser report){
		this.reports.add(report);
		report.setUser(this);
	}
	
	public void removeReport(ReportUser report){
		this.reports.remove(report);
		report.setUser(this);
	}

	
	// Métodos útiles ------------------------------------------------------------------

	public boolean gamble(Double amount) {
		if(this.money.compareTo(amount) < 0){
			return false;
		}else{
			setMoney(getMoney() - amount);
			return true;
		}
	}
	
	public void incrementKarma(Bet bet){
		int status = bet.getStatus();
		Double inc = 0.0;
		
		if(status == Bet.PROPOSED) { // Proposed
			inc = 0.2;
		}
		if(status == Bet.PENDING) { // Pending
			inc = 0.2;
		}
		if(status == Bet.ACCEPTED) { // Accepted
			inc = 0.3;
		}
		if(status == Bet.REJECTED) { // Rejected
			inc = 0.1;
		}
		
		if((this.karma + inc) > 20.0) {
			this.karma = 20.0;
		} else {
			this.karma += inc;
		}
	}
	
	public void decrementKarma(Bet bet){
		int status = bet.getStatus();
		Double dec = 0.0;
		
		if(status == Bet.PROPOSED) { // Proposed
			dec = 0.1;
		}
		if(status == Bet.PENDING) { // Pending
			dec = 0.1;
		}
		if(status == Bet.ACCEPTED) { // Accepted
			dec = 0.1;
		}
		if(status == Bet.REJECTED) { // Rejected
			dec = 0.2;
		}
		
		if((this.karma - dec) < 0.0) {
			this.karma = 0.0;
		} else {
			this.karma -= dec;
		}
	}
	
	public void incrementKarma(double inc){
		if((this.karma + inc) > 20.0) {
			this.karma = 20.0;
		} else {
			this.karma += inc;
		}
	}
	
	public void decrementKarma(double dec){
		if((this.karma - dec) < 0.0) {
			this.karma = 0.0;
		} else {
			this.karma -= dec;
		}
	}
	
}