package com.susheel.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler{
	
	@ExceptionHandler(value = CustomException.class)
	public ResponseEntity<ExceptionResponse> hadlException( CustomException exception) {
		
		ExceptionResponse exceptionResponse = new ExceptionResponse();
		
		exceptionResponse.setDate(exception.getDate());
		exceptionResponse.setMessage(exception.getMessage());
		exceptionResponse.setStatus("FAILURE");
		exceptionResponse.setStatusCode(500);
		
		return new ResponseEntity<ExceptionResponse>(exceptionResponse, HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	

}