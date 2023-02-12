package com.example.prueba.web.controllers;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller(value = "IndexViewController")
public class IndexViewController {

	
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	// método que nos manda a la vista second (donde están los mensajes de prueba)
	@RequestMapping(value="/goToSecondView")
	public String navigateToSecondView() {
		logger.info("Navegamos a la second view");
	        	        
	    return "second";
	}
	
	
	// método que nos manda a la vista third (donde está la lista de alumnos)
	@RequestMapping(value="/goToThirdView")
	public String navigateToThirdView() {
		logger.info("Navegamos a la third view");
	        	        
	    return "third";
	} 
	
}