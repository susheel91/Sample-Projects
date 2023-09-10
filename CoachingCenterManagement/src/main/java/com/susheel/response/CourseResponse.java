package com.susheel.response;
//for manual status
import java.util.Date;
import java.util.List;

import com.susheel.model.Courses;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseResponse {
	
	private int status;
	private String message;
	private Date date;
	private Courses courses;
	private List<Courses> listCourses;
	//constructor without list
	public CourseResponse(int status, String message, Date date, Courses courses) {
		super();
		this.status = status;
		this.message = message;
		this.date = date;
		this.courses = courses;
	}
	// constructor without course
	public CourseResponse(int status, String message, Date date, List<Courses> listCourses) {
		super();
		this.status = status;
		this.message = message;
		this.date = date;
		this.listCourses = listCourses;
	}
	// constructor without list and courses
	public CourseResponse(int status, String message, Date date) {
		super();
		this.status = status;
		this.message = message;
		this.date = date;
	}
	
	

}
