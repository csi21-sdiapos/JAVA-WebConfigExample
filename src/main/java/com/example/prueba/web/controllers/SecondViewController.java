package com.example.prueba.web.controllers;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SecondViewController {

	
	protected final Log logger = LogFactory.getLog(getClass());
	
	
	@RequestMapping(value = "/second")
    public ModelAndView requestSecondViewManager() {
        
		logger.info("Navegamos a la SecondView");
        
		Map<String, Object> secondViewModel = new HashMap<String, Object>();
        
		secondViewModel.put("message1", "esto es la Second View");
        secondViewModel.put("message2", "el request mapping funciona!");
        secondViewModel.put("message3", "este mensaje está dentro de un HashMap");
        
        return new ModelAndView("second", "secondViewModel", secondViewModel);
    } 
	
}