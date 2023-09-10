package com.susheel.service;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.susheel.exception.CustomException;
import com.susheel.model.Courses;
import com.susheel.repo.CourseRepo;

@Service
@Transactional
public class CourseService {
	
	@Autowired
	private CourseRepo repo;
	
	public Courses saveCourse(Courses courses) {
		
		Courses save = repo.save(courses);
		
		return save;
		
	}
	// get all 
	public List<Courses> getAllCourses(){
		
		List<Courses> allCourses = repo.findAll();
		
		if(allCourses.isEmpty()) {
			throw new CustomException(new Date(), "No courses to display");
		}
		
		return allCourses;
		
	}
	// delete 
	public void deleteCourse(int id) {
		
		Courses courses = repo.findById(id).orElseThrow(()->new CustomException(new Date(), "No such course found to be deleted"));
		
		repo.delete(courses);
		
	}
	// update
	public Courses updateCourses(Courses courses, Integer id) {
		
		Courses oldCourses = repo.findById(id).orElseThrow(()-> new CustomException(new Date(), "No Course with ID - "+id+" found for update"));
		
		oldCourses.setDescription(courses.getDescription());
		oldCourses.setDuration(courses.getDuration());
		oldCourses.setFees(courses.getFees());
		oldCourses.setName(courses.getName());
		
		Courses save = repo.save(oldCourses);
		
		return save;
	}
	// find by id
	public Courses findidCourse(int id) {
		Optional<Courses> findById = repo.findById(id);
		Courses courses = findById.orElseThrow(()->new CustomException(new Date(), "No course found with ID - "+id));
		return courses;
	}
	
	//find courses between selected fees range
	
	public List<Courses> findMyCourse(double min, double max){
		
		List<Courses> findAll = repo.findAll();
		
		List<Courses> collect = findAll.stream().filter(a-> a.getFees() >= min && a.getFees() <= max).collect(Collectors.toList());
		
		if(collect.isEmpty()) {
			throw new CustomException(new Date(), "No courses found between the specified range");
		}
		
		return collect;
	}
	
	public HashMap<String, Double> getCourseAndFees(){
		
		List<Courses> findAll = repo.findAll();
		
		HashMap<String, Double> map = new HashMap<>();
		
		for(Courses courses : findAll) {
			
			map.put(courses.getName(), courses.getFees());
			
		}
		
		LinkedHashMap<String,Double> collect = map.entrySet().stream().sorted(Map.Entry.comparingByKey()).collect(Collectors.toMap(a->a.getKey(), a->a.getValue(), (oldMap, newMap)->newMap, LinkedHashMap::new));
		
		if(collect.isEmpty()) {
			throw new CustomException(new Date(), "No courses to display");
		}
		
		return collect;
	}
	
	public HashMap<String, Double> getMapInRange(double min, double max){
		
		HashMap<String,Double> courseAndFees = this.getCourseAndFees();
		
		Map<String, Double> collect = courseAndFees.entrySet().stream().filter(a-> a.getValue() >= min && a.getValue() <= max).collect(Collectors.toMap(a->a.getKey(), a->a.getValue()));
		
		Map<String, Double> collect2 = collect.entrySet().stream().sorted(Map.Entry.comparingByValue()).collect(Collectors.toMap(a->a.getKey(), a->a.getValue(), (oldMap, newMap)->newMap, LinkedHashMap::new));
		
		if(collect2.isEmpty()) {
			throw new CustomException(new Date(), "No courses found for the specified range");
		}
		
		return (HashMap<String, Double>) collect2;
	}


}
