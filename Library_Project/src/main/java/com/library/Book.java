package com.library;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int bookID;
	
	private String name;
	
	
	private String author;
	
	
	private String publication;
	
	private double cost;
	
	
	private Date addDate;
	
	
	private String language;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Book(String name, String author, String publication, double cost, Date addDate, String language) {
		super();
		this.name = name;
		this.author = author;
		this.publication = publication;
		this.cost = cost;
		this.addDate = addDate;
		this.language = language;
	}



	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublication() {
		return publication;
	}
	public void setPublication(String publication) {
		this.publication = publication;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	@Override
	public String toString() {
		return "Book [bookID=" + bookID + ", name=" + name + ", author=" + author + ", publication=" + publication
				+ ", cost=" + cost + ", addDate=" + addDate + ", language=" + language + "]";
	}



	public Book(int bookID, String name, String author, String publication, double cost, Date addDate,
			String language) {
		super();
		this.bookID = bookID;
		this.name = name;
		this.author = author;
		this.publication = publication;
		this.cost = cost;
		this.addDate = addDate;
		this.language = language;
	}
	
	
	
	
	

}
