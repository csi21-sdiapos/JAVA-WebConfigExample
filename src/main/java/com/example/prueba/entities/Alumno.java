package com.example.prueba.entities;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Objects;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.example.prueba.tools.Tools;


@Entity(name = "Alumno")
@Table(name = "alumno", schema = "alumnos")
public class Alumno implements Serializable {

	private static final long serialVersionUID = 1L;

	
	/******************************************* ATRIBUTOS *********************************************/
	@Column(table = "alumno", name = "alumno_uuid", insertable = true, updatable = true, unique = false, nullable = false)
	private UUID alumno_uuid;
	
	@Temporal(value = TemporalType.TIMESTAMP)
	@Column(table = "alumno", name = "alumno_date", insertable = true, updatable = true, unique = false, nullable = false)
	private Calendar alumno_date;
	
	@Id
	@Column(table = "alumno", name = "alumno_id", insertable = false, updatable = false, unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "alumno_alumno_id_seq")
	private long alumno_id;
	
	@Column(table = "alumno", name = "alumno_nombre", insertable = true, updatable = true, unique = false, nullable = false)
	private String alumno_nombre;
	
	@Column(table = "alumno", name = "alumno_apellidos", insertable = true, updatable = true, unique = false, nullable = false)
	private String alumno_apellidos;
	
	@Column(table = "alumno", name = "alumno_telefono", insertable = true, updatable = true, unique = true, nullable = false)
	private String alumno_telefono;

	
	/******************************************* RELACIONES *********************************************/

	
	/******************************************* CONSTRUCTORES *********************************************/
	// constructor lleno
	public Alumno(String alumno_nombre, String alumno_apellidos, String alumno_telefono) {
		super();
		this.alumno_uuid = Tools.generarUUID();
		this.alumno_date = Calendar.getInstance();
		this.alumno_nombre = alumno_nombre;
		this.alumno_apellidos = alumno_apellidos;
		this.alumno_telefono = alumno_telefono;
	}

	// constructor vacío
	public Alumno() {
		super();
	}
		
	
	/******************************************* GETTER Y SETTERS *********************************************/
	public UUID getAlumno_uuid() {
		return alumno_uuid;
	}

	public void setAlumno_uuid(UUID alumno_uuid) {
		this.alumno_uuid = alumno_uuid;
	}

	public Calendar getAlumno_date() {
		return alumno_date;
	}

	public void setAlumno_date(Calendar alumno_date) {
		this.alumno_date = alumno_date;
	}

	public long getAlumno_id() {
		return alumno_id;
	}

	public void setAlumno_id(long alumno_id) {
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

	public String getAlumno_telefono() {
		return alumno_telefono;
	}

	public void setAlumno_telefono(String alumno_telefono) {
		this.alumno_telefono = alumno_telefono;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	/******************************************* MÉTODOS *********************************************/

	
	/******************************************* HashCode y Equals *********************************************/
	@Override
	public int hashCode() {
		return Objects.hash(alumno_apellidos, alumno_date, alumno_id, alumno_nombre, alumno_telefono, alumno_uuid);
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
				&& Objects.equals(alumno_date, other.alumno_date) && alumno_id == other.alumno_id
				&& Objects.equals(alumno_nombre, other.alumno_nombre)
				&& Objects.equals(alumno_telefono, other.alumno_telefono)
				&& Objects.equals(alumno_uuid, other.alumno_uuid);
	}
	
	
	/******************************************* ToString *********************************************/
	@Override
	public String toString() {
		return "\nAlumno [" + 
					"alumno_uuid=" + alumno_uuid + 
					", alumno_date=" + alumno_date.getTime() + 
					", alumno_id=" + alumno_id + 
					", alumno_nombre=" + alumno_nombre + 
					", alumno_apellidos=" + alumno_apellidos + 
					", alumno_telefono=" + alumno_telefono + 
				"]";
	}
	
}