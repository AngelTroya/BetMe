package domain;


import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import security.UserAccount;

@Entity
@Access(AccessType.PROPERTY)
public abstract class Actor extends DomainEntity {

	// Constructors -----------------------------------------------------------

	public Actor() {
		super();
	}

	// Attributes -------------------------------------------------------------
	
	public static final Integer MALE = 0;
	public static final Integer FEMALE = 1;

	private String name;
	private String surname;
	private String email;
	private String phone;
	private String address;
	private String city;
	private Date dateOfBirth;
	private Integer zipCode;
	private String dni;
	private Integer sex;
	private String province;
	

	@NotBlank
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotBlank
	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	@Email
	@NotBlank
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Pattern(regexp = "^([+-]\\d+\\s+)?(\\([0-9]+\\)\\s+)?([\\d\\w\\s-]+)$")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@NotBlank
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@NotNull
	public Integer getZipCode() {
		return zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	@NotBlank
	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public Integer getSex() {
		return sex;
	}
	
	public void setSex(Integer sex) {
		if(!sex.equals(Actor.MALE) && !sex.equals(Actor.FEMALE))
			throw new IllegalArgumentException("Sexo no válido");
		this.sex = sex;
	}

	@NotBlank
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	

	// Relationships ----------------------------------------------------------

	private UserAccount userAccount;

	@NotNull
	@Valid	
	@OneToOne(cascade = CascadeType.ALL, optional = false)
	public UserAccount getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(UserAccount userAccount) {
		this.userAccount = userAccount;
	}

}