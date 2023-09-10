package com.susheel.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "course")//table name
@Data  // for setter,getter,to string
@NoArgsConstructor
@AllArgsConstructor
public class Courses {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String name;
	private int duration;
	private double fees;
	private String description;
	//non-id constructor( because id auto increment)
	public Courses(String name, int duration, double fees, String description) {
		super();
		this.name = name;
		this.duration = duration;
		this.fees = fees;
		this.description = description;
	}
	
	

}
