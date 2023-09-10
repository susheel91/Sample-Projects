package com.library;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
public class Authors{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int aid;
	private String name;
	private String genere;
	private String origin;
	
	
	public Authors() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Authors(String name, String genere, String origin) {
		super();
		this.name = name;
		this.genere = genere;
		this.origin = origin;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGenere() {
		return genere;
	}
	public void setGenere(String genere) {
		this.genere = genere;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	@Override
	public String toString() {
		return "Authors [aid=" + aid + ", name=" + name + ", genere=" + genere + ", origin=" + origin + "]";
	}
	public Authors(String genere, String origin) {
		super();
		this.genere = genere;
		this.origin = origin;
	}
	
	
	
	
	

}
