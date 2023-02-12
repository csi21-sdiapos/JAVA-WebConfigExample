package com.example.prueba.web.controllers;

import java.util.Calendar;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.prueba.entities.Alumno;
import com.example.prueba.repositories.implementations.AlumnoRepositoryImpl;
import com.example.prueba.repositories.interfaces.IAlumnoRepository;


@Controller(value = "FormViewController")
public class FormViewController {

	
	protected final Log logger = LogFactory.getLog(getClass());
	
	IAlumnoRepository alumnoRepository = new AlumnoRepositoryImpl();
		
	
	@RequestMapping(value="/formCreateAlumno", method = RequestMethod.POST)
    public String createAlumno(@ModelAttribute("alumnoModel") Alumno alumnoModel) throws Exception{
    	logger.info("Navegamos al formulario de registro de alumnos");
    	
    	alumnoModel.setAlumno_uuid(UUID.randomUUID());
    	alumnoModel.setAlumno_date(Calendar.getInstance());
    	
    	alumnoRepository.insertAlumno(alumnoModel);  
    	
        return "third";
    }
}