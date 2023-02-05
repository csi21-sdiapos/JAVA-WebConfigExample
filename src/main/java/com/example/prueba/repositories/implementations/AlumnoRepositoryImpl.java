package com.example.prueba.repositories.implementations;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.prueba.entities.Alumno;
import com.example.prueba.repositories.interfaces.IAlumnoRepository;


@Repository
public class AlumnoRepositoryImpl implements IAlumnoRepository {

	
	@Override
	public List<Alumno> listarAlumnos() throws Exception {
		List<Alumno> listaAlumnos = new ArrayList<>();
		
		try {
			listaAlumnos.add(new Alumno(1, "Sergio", "Diaz", 27, 666111111, "Sevilla Este"));
			listaAlumnos.add(new Alumno(2, "Angel", "Mora", 20, 666222222, "Triana"));
			listaAlumnos.add(new Alumno(3, "Javier", "Mena", 22, 666333333, "San Francisco Javier"));
			listaAlumnos.add(new Alumno(4, "Moises", "Hidalgo", 23, 666444444, "Nervión"));
			listaAlumnos.add(new Alumno(5, "Javier", "Cano", 21, 666555555, "Ciudad Jardin"));
			
		} catch (Exception e) {
			System.out.println("\n\n[ERROR]: No se han podido crear los alumnos en la lista");
		}
		
		return listaAlumnos;
	}

}