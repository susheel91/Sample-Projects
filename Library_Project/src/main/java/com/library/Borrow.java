package com.library;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Borrow {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int borrowID;
	
	String bname;
	
	String bauthor;
	
	String bpublication;
	
	String blanguage;
	
	Double cost;
	
	Date borrowDate;
	
	String borrower;

	public Borrow() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public Borrow(String bname, String bauthor, String bpublication, String blanguage, Double cost, Date borrowDate) {
		super();
		this.bname = bname;
		this.bauthor = bauthor;
		this.bpublication = bpublication;
		this.blanguage = blanguage;
		this.cost = cost;
		this.borrowDate = borrowDate;
	}



	public int getBorrowID() {
		return borrowID;
	}

	public void setBorrowID(int borrowID) {
		this.borrowID = borrowID;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBauthor() {
		return bauthor;
	}

	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}

	public String getBpublication() {
		return bpublication;
	}

	public void setBpublication(String bpublication) {
		this.bpublication = bpublication;
	}

	public String getBlanguage() {
		return blanguage;
	}

	public void setBlanguage(String blanguage) {
		this.blanguage = blanguage;
	}

	public Date getBorrowDate() {
		return borrowDate;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}



	public Double getCost() {
		return cost;
	}



	public void setCost(Double cost) {
		this.cost = cost;
	}



	public String getBorrower() {
		return borrower;
	}



	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}
	
	
	
	
	

}
