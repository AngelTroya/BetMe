package domain;

import java.util.Collection;
import java.util.HashSet;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Entity
@Access(AccessType.PROPERTY)
public class UserVote extends DomainEntity {
	
	// Constructors -----------------------------------------------------------
	
	public UserVote(){
		super();
		bets = new HashSet<Bet>();
		comments = new HashSet<Comment>();
	}
	
	// Attributes -------------------------------------------------------------
	
	private Integer numVotes;
	
	@NotNull
	@Min(0)
	public Integer getNumVotes() {
		return numVotes;
	}
	public void setNumVotes(Integer numVotes) {
		this.numVotes = numVotes;
	}
	
	public void addVote(){
		this.numVotes++;
	}
	
	// Relationships ----------------------------------------------------------

	private User user;
	private Collection<Bet> bets;
	private Collection<Comment> comments;
	
	@Valid
	@OneToOne
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@ManyToMany
	public Collection<Bet> getBets() {
		return bets;
	}
	public void setBets(Collection<Bet> bets) {
		this.bets = bets;
	}	
	public void  addBet(Bet bet){
		this.bets.add(bet);
	}	
	public void removeBet(Bet bet){
		this.bets.remove(bet);
	}
	
	@ManyToMany
	public Collection<Comment> getComments() {
		return comments;
	}
	public void setComments(Collection<Comment> comments) {
		this.comments = comments;
	}
	public void addComment(Comment comment){
		this.comments.add(comment);
	}
	public void removeComment(Comment comment){
		this.comments.remove(comment);
	}

}
