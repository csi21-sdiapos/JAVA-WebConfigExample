package com.example.prueba.repositories.interfaces;

import java.util.List;

import com.example.prueba.entities.Alumno;

public interface IAlumnoRepository {

	
	public List<Alumno> listarAlumnos() throws Exception;
	
}