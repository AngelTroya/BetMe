package forms;

import java.util.Collection;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.AutoPopulatingList;

import domain.BetOption;

public class EditBetForm {
	
	public EditBetForm(){
		super();
		options = new AutoPopulatingList<BetOption>(BetOption.class);
	}
	
	private String name;
	private String endingDate;
	private Integer category;
	private String description;
	private Collection<BetOption> options;
	private Integer type; // Aquí se verá el tipo (WinWin o Against..)
	private Double max;
	private Double min;
	private int betId;
	
	@NotBlank
	@Size(min=3, max=15)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public String getEndingDate() {
		return endingDate;
	}
	public void setEndingDate(String endingDate) {
		this.endingDate = endingDate;
	}
	@NotNull
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Collection<BetOption> getOptions() {
		return options;
	}
	public void setOptions(Collection<BetOption> options) {
		this.options = options;
	}
	@NotNull
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	@Digits(integer = 6, fraction = 2)
	public Double getMax() {
		return max;
	}
	public void setMax(Double max) {
		this.max = max;
	}
	
	@Digits(integer = 6, fraction = 2)
	public Double getMin() {
		return min;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	public void addOption(BetOption option){
		options.add(option);
	}
	
	public void removeOption(BetOption option){
		options.remove(option);
	}
	
	@NotNull
	public int getBetId() {
		return betId;
	}
	public void setBetId(int betId) {
		this.betId = betId;
	}

}
