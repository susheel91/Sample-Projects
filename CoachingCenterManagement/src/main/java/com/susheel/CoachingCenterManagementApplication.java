package com.susheel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.susheel.repo")//add extra for my pc
public class CoachingCenterManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoachingCenterManagementApplication.class, args);
	}

}
