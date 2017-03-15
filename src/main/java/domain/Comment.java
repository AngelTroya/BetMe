package domain;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Comment extends DomainEntity {
	
	// Constructors -----------------------------------------------------------

	public Comment() {
		super();
		userVotes = new ArrayList<UserVote>();
	}
		
	
	// Attributes -------------------------------------------------------------
	
	private Integer positiveVotes;
	private Integer negativeVotes;
	private String text;
	private Boolean isReported;
	
	@NotNull
	@Min(0)
	public Integer getPositiveVotes() {
		return positiveVotes;
	}

	public void setPositiveVotes(Integer positiveVotes) {
		this.positiveVotes = positiveVotes;
	}

	@NotNull
	@Min(0)
	public Integer getNegativeVotes() {
		return negativeVotes;
	}

	public void setNegativeVotes(Integer negativeVotes) {
		this.negativeVotes = negativeVotes;
	}

	@NotBlank
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public Boolean getIsReported() {
		return isReported;
	}

	public void setIsReported(Boolean isReported) {
		this.isReported = isReported;
	}
	
	
	// Relationships ----------------------------------------------------------

	private User user;
	private Bet bet;
	private Collection<UserVote> userVotes;

	@NotNull
	@Valid
	@ManyToOne
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@NotNull
	@Valid
	@ManyToOne
	public Bet getBet() {
		return bet;
	}

	public void setBet(Bet bet) {
		this.bet = bet;
	}
	
	@ManyToMany(mappedBy = "comments")
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
	
	// Métodos útiles ----------------------------------------------------------
	
	public void votePositive(){
		this.positiveVotes++;
	}
	
	public void voteNegative(){
		this.negativeVotes++;
	}
	
}
