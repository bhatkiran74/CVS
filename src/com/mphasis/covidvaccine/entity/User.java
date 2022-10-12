package com.mphasis.covidvaccine.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity(name="User")
@Table(name= "User")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="userId")
	private int userId;

	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="mobileNo")
	private int mobileNo;
	
	@Column(name="age")
	private int age;
	
	@Column(name="gender")
	private String gender;
	

	@Column(name="govtId")
	private String govtId;
	
	@Column(name="idNo")
	private int idNo;
	
	@Column(name="vaccineName")
	private String vaccineName;
	
	// @DateTimeFormat(pattern = "MM-dd-yyyy")
	@Column(name="firstVaccineDate")
	private Date firstVaccineDate;
	
	@Column(name="secondVaccineDate")
	private Date secondVaccineDate;
	
	@Column(name="totalVaccine")
	private int totalVaccine;
	
	@Column(name="vaccinePlace")
	private String vaccinePlace;

	public User() {
		
		
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(int mobileNo) {
		this.mobileNo = mobileNo;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGovtId() {
		return govtId;
	}

	public void setGovtId(String govtId) {
		this.govtId = govtId;
	}

	public int getIdNo() {
		return idNo;
	}

	public void setIdNo(int idNo) {
		this.idNo = idNo;
	}

	public String getVaccineName() {
		return vaccineName;
	}

	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}

	public Date getFirstVaccineDate() {
		return firstVaccineDate;
	}

	public void setFirstVaccineDate(Date firstVaccineDate) {
		this.firstVaccineDate = firstVaccineDate;
	}

	public Date getSecondVaccineDate() {
		return secondVaccineDate;
	}

	public void setSecondVaccineDate(Date secondVaccineDate) {
		this.secondVaccineDate = secondVaccineDate;
	}

	public int getTotalVaccine() {
		return totalVaccine;
	}

	public void setTotalVaccine(int totalVaccine) {
		this.totalVaccine = totalVaccine;
	}

	public String getVaccinePlace() {
		return vaccinePlace;
	}

	public void setVaccinePlace(String vaccinePlace) {
		this.vaccinePlace = vaccinePlace;
	}
	
	
	/*@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", mobileNo=" + mobileNo +", age=" +  age + ",gender=" + gender + ",govtId=" + govtId + ",idNo=" + idNo + ",vaccineName=" + vaccineName + ",firstVaccineDate=" + firstVaccineDate + ",secondVaccineDate=" + secondVaccineDate + ",totalVaccine=" + totalVaccine + ",vaccinePlace=" +vaccinePlace + "]";
	}*/
	

}

