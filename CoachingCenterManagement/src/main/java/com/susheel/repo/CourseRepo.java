package com.susheel.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.susheel.model.Courses;

public interface CourseRepo extends JpaRepository<Courses, Integer>{

}
