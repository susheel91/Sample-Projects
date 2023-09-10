package com.susheel.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.susheel.model.Courses;
import com.susheel.response.CourseResponse;
import com.susheel.service.CourseService;

@RestController
@RequestMapping("/course")
public class CourseController {
	
	@Autowired
	private CourseService service;
	
	//to save the course in db
	@PostMapping("/save")
	public CourseResponse saveCourse(@RequestBody Courses courses) {
		
		Courses saveCourse = service.saveCourse(courses);
		
		CourseResponse courseResponse = new CourseResponse(HttpStatus.OK.value(), "Data successfully saved", new Date(), saveCourse);
		
		return courseResponse; 
		
	}
	
	//get all the courses
	@GetMapping("/getall")
	public CourseResponse getAllCourses(){
		List<Courses> allCourses = service.getAllCourses();
		
		CourseResponse courseResponse = new CourseResponse(HttpStatus.OK.value(), "List of all Courses", new Date(), allCourses);
		
		return courseResponse;
	}
	// delete by id
	@DeleteMapping("/delete/{id}")
	public CourseResponse deleteCourse(@PathVariable int id) {
		
		service.deleteCourse(id);
		
		return new CourseResponse(HttpStatus.OK.value(), "Course deleted successfully", new Date());
		
	}
	// update in course
	@PutMapping("/update/{id}")
	public CourseResponse courseUpdate(@RequestBody Courses courses, @PathVariable Integer id) {
		Courses updateCourses = service.updateCourses(courses, id);
		return new CourseResponse(HttpStatus.OK.value(),"courses update", new Date(), updateCourses);
	}
	// find course by id
	@GetMapping("/get/{id}")
	public CourseResponse findidCourse(@PathVariable int id)
	{
		Courses findidCourse = service.findidCourse(id);
		return new CourseResponse(HttpStatus.FOUND.value(),"value found", new Date(), findidCourse);
		
	}
	
	//find a course between price ranges
	@GetMapping("/range")
	public CourseResponse findMyCourse(@RequestParam double minFees, @RequestParam double maxFees) {
		
		List<Courses> findMyCourse = service.findMyCourse(minFees, maxFees);
		return new CourseResponse(HttpStatus.FOUND.value(), "Required courses have been found", new Date(), findMyCourse);
	}
	
	//get courses and their fees only
	@GetMapping("/map")
	public HashMap<String, Double> getCourseAndFees() {
		
		HashMap<String,Double> courseAndFees = service.getCourseAndFees();
		
		return courseAndFees;
	}
	
	//get map of name and fees between range
	
	@GetMapping("/sortedmap")
	public HashMap<String, Double> getMapInRange(@RequestParam double min, @RequestParam double max){
		
		HashMap<String,Double> mapInRange = service.getMapInRange(min, max);
		
		return mapInRange;
	}
}
