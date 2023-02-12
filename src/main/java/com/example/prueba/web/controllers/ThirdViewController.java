package com.example.prueba.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.prueba.entities.Alumno;
import com.example.prueba.repositories.implementations.AlumnoRepositoryImpl;
import com.example.prueba.repositories.interfaces.IAlumnoRepository;


@Controller(value = "ThirdViewController")
public class ThirdViewController {

	
	protected final Log logger = LogFactory.getLog(getClass());
	
	IAlumnoRepository alumnoRepository = new AlumnoRepositoryImpl();
	
	
	// método que nos manda al formulario de registro de alumnos
	@RequestMapping(value="/goToFormCreateAlumno")
    public String navigateToForm(Model model) {
        logger.info("Navegamos al formulario");
        
        Alumno alumnoModel = new Alumno();
        model.addAttribute("alumnoModel", alumnoModel);
        
        return "Form";
    } 
	
	
	// método que obtiene los alumnos de la BBDD y envía una lista de alumnos a la vista
	@RequestMapping(value = "/third")
    public ModelAndView requestThirdViewManager() throws Exception {
        
		logger.info("Entrando en el metodo --> requestThirdViewManager() --> ThirdViewController");
        
		List<Alumno> listaAlumnos = alumnoRepository.listAlumnos();
		Map<String, Object> thirdViewModel = new HashMap<>();
        thirdViewModel.put("alumnos", listaAlumnos);
        
        logger.info("La listaAlumnos contiene " + listaAlumnos.size() + " alumnos");
        
        return new ModelAndView("third", "thirdViewModel", thirdViewModel);
    } 
	
}