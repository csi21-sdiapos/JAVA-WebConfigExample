package com.example.prueba.entities;

import java.util.Objects;

public class Alumno {

	
	/******************************************* ATRIBUTOS *********************************************/
	private int alumno_id;
	private String alumno_nombre;
	private String alumno_apellidos;
	private int alumno_edad;
	private int alumno_telefono;
	private String alumno_direccion;
	
		
	/******************************************* RELACIONES *********************************************/

	
	/******************************************* CONSTRUCTORES *********************************************/
	// constructor lleno
	public Alumno(int alumno_id, String alumno_nombre, String alumno_apellidos, int alumno_edad, int alumno_telefono,
			String alumno_direccion) {
		super();
		this.alumno_id = alumno_id;
		this.alumno_nombre = alumno_nombre;
		this.alumno_apellidos = alumno_apellidos;
		this.alumno_edad = alumno_edad;
		this.alumno_telefono = alumno_telefono;
		this.alumno_direccion = alumno_direccion;
	}
	
	// constructor vacío
	public Alumno() {
		super();
	}

	
	/******************************************* GETTER Y SETTERS *********************************************/
	public int getAlumno_id() {
		return alumno_id;
	}

	public void setAlumno_id(int alumno_id) {
		this.alumno_id = alumno_id;
	}

	public String getAlumno_nombre() {
		return alumno_nombre;
	}

	public void setAlumno_nombre(String alumno_nombre) {
		this.alumno_nombre = alumno_nombre;
	}

	public String getAlumno_apellidos() {
		return alumno_apellidos;
	}

	public void setAlumno_apellidos(String alumno_apellidos) {
		this.alumno_apellidos = alumno_apellidos;
	}

	public int getAlumno_edad() {
		return alumno_edad;
	}

	public void setAlumno_edad(int alumno_edad) {
		this.alumno_edad = alumno_edad;
	}

	public int getAlumno_telefono() {
		return alumno_telefono;
	}

	public void setAlumno_telefono(int alumno_telefono) {
		this.alumno_telefono = alumno_telefono;
	}

	public String getAlumno_direccion() {
		return alumno_direccion;
	}

	public void setAlumno_direccion(String alumno_direccion) {
		this.alumno_direccion = alumno_direccion;
	}
	
	
	/******************************************* MÉTODOS *********************************************/

	
	/******************************************* HashCode y Equals *********************************************/
	@Override
	public int hashCode() {
		return Objects.hash(alumno_apellidos, alumno_direccion, alumno_edad, alumno_id, alumno_nombre, alumno_telefono);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Alumno other = (Alumno) obj;
		return Objects.equals(alumno_apellidos, other.alumno_apellidos)
				&& Objects.equals(alumno_direccion, other.alumno_direccion) && alumno_edad == other.alumno_edad
				&& alumno_id == other.alumno_id && Objects.equals(alumno_nombre, other.alumno_nombre)
				&& alumno_telefono == other.alumno_telefono;
	}
	
	
	/******************************************* ToString *********************************************/
	@Override
	public String toString() {
		return "\nAlumno [" + 
					"alumno_id=" + alumno_id + 
					", alumno_nombre=" + alumno_nombre + 
					", alumno_apellidos=" + alumno_apellidos + 
					", alumno_edad=" + alumno_edad + 
					", alumno_telefono=" + alumno_telefono + 
					", alumno_direccion=" + alumno_direccion + 
				"]";
	}
	
}