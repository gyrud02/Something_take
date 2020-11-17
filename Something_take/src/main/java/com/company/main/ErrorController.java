package com.company.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/error/*")
public class ErrorController {

	private static final Logger logger = 
			LoggerFactory.getLogger(ErrorController.class);
	
	/////////////////////////////////////////////////////////
	
	/* 404 Error */
	@RequestMapping(value = "/404.tiles", method = RequestMethod.GET)
	public String err_404() {

		logger.info("-- 404 ERROR !! ");
		
		return "error_404";
	} // no_write()
	
	/////////////////////////////////////////////////////////
	
	/* 500 Error */
	@RequestMapping(value = "/500.tiles", method = RequestMethod.GET)
	public String err_500() {
		
		logger.info("-- 500 ERROR !! ");

		return "error_500";
	} // no_write()

	/////////////////////////////////////////////////////////

}