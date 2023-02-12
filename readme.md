# Ejemplo de Configuración Web mediante Anotaciones de Spring Framework

- [Ejemplo de Configuración Web mediante Anotaciones de Spring Framework](#ejemplo-de-configuración-web-mediante-anotaciones-de-spring-framework)
- [1. Objetivo 1 - Jueves 2 de febrero --\> Sacar mensajes por vista](#1-objetivo-1---jueves-2-de-febrero----sacar-mensajes-por-vista)
	- [Configuración básica](#configuración-básica)
		- [com.example.prueba --\> ServletInitializerConfig.java](#comexampleprueba----servletinitializerconfigjava)
		- [com.example.prueba.app --\> AppContextConfig.java](#comexamplepruebaapp----appcontextconfigjava)
		- [com.example.prueba.web --\> WebContextConfig.java](#comexamplepruebaweb----webcontextconfigjava)
		- [webapps/views/header.jsp](#webappsviewsheaderjsp)
	- [1.1. com.example.prueba.web.controllers --\> SecondViewController.java](#11-comexamplepruebawebcontrollers----secondviewcontrollerjava)
	- [1.2. webapps/views/second.jsp](#12-webappsviewssecondjsp)
- [2. Objetivo 2 - Viernes 3 de febrero --\> Sacar objetos por vista (lista de alumnos)](#2-objetivo-2---viernes-3-de-febrero----sacar-objetos-por-vista-lista-de-alumnos)
	- [2.1. com.example.prueba.web.controllers --\> ThirdViewController.java](#21-comexamplepruebawebcontrollers----thirdviewcontrollerjava)
	- [2.2. webapps/views/third.jsp](#22-webappsviewsthirdjsp)
	- [Prueba de Ejecución 1 - Objetivo 1 y 2 --\> @RequestMapping() pasando mensajes y objetos del controlador a la vista](#prueba-de-ejecución-1---objetivo-1-y-2----requestmapping-pasando-mensajes-y-objetos-del-controlador-a-la-vista)
- [3. Objetivo 3 - Viernes 10 de febrero --\> insertar alumnos en BBDD con un formulario de registro](#3-objetivo-3---viernes-10-de-febrero----insertar-alumnos-en-bbdd-con-un-formulario-de-registro)
	- [3.0. src\\main\\resources --\> META-INF --\> persistence.xml](#30-srcmainresources----meta-inf----persistencexml)
	- [3.1. com.example.prueba.entities --\> Alumno.java](#31-comexamplepruebaentities----alumnojava)
	- [3.2. com.example.prueba.repositories.interfaces --\> IAlumnoRepository.java](#32-comexamplepruebarepositoriesinterfaces----ialumnorepositoryjava)
	- [3.3. com.example.prueba.repositories.implementations --\> AlumnoRepositoryImpl](#33-comexamplepruebarepositoriesimplementations----alumnorepositoryimpl)
	- [3.4. com.example.prueba.web.controllers --\> ThirdViewController.java](#34-comexamplepruebawebcontrollers----thirdviewcontrollerjava)
	- [3.5. webapps/views/third.jsp](#35-webappsviewsthirdjsp)
	- [3.6. com.example.prueba.web.controllers --\> FormViewController.java](#36-comexamplepruebawebcontrollers----formviewcontrollerjava)
	- [3.7. webapps/views/Form.jsp](#37-webappsviewsformjsp)
	- [Prueba de Ejecución 2 - Objetivo 3 --\> @RequestMapping(method = RequestMethod.POST) insertando alumnos en la BBDD a través de la vista de un formulario](#prueba-de-ejecución-2---objetivo-3----requestmappingmethod--requestmethodpost-insertando-alumnos-en-la-bbdd-a-través-de-la-vista-de-un-formulario)
	- [Solución de Errores de Configuraciones Internas](#solución-de-errores-de-configuraciones-internas)
		- [La uri absoluta: http://java.sun.com/jsp/jstl/core no se puede resolver en web.xml](#la-uri-absoluta-httpjavasuncomjspjstlcore-no-se-puede-resolver-en-webxml)
		- [Exception: No se encuentra TagLibraryValidator class: org.apache.taglibs.standard.tlv.JstlCoreTLV](#exception-no-se-encuentra-taglibraryvalidator-class-orgapachetaglibsstandardtlvjstlcoretlv)
		- [La biblioteca nativa de Apache Tomcat basada en ARP que permite un rendimiento óptimo en entornos de desarrollo no ha sido hallada en java.library.path](#la-biblioteca-nativa-de-apache-tomcat-basada-en-arp-que-permite-un-rendimiento-óptimo-en-entornos-de-desarrollo-no-ha-sido-hallada-en-javalibrarypath)


# 1. Objetivo 1 - Jueves 2 de febrero --> Sacar mensajes por vista

## Configuración básica

### com.example.prueba --> ServletInitializerConfig.java

```java
public class ServletInitializerConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { AppContextConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebContextConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

}
```

### com.example.prueba.app --> AppContextConfig.java

```java
@Configuration
@ComponentScan
public class AppContextConfig {
	
}
```

### com.example.prueba.web --> WebContextConfig.java

```java
@Configuration
@ComponentScan
@EnableWebMvc
public class WebContextConfig {
	
	@Bean
	public ViewResolver viewsFolderMapping() {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        
        internalResourceViewResolver.setPrefix("/views/");
        internalResourceViewResolver.setSuffix(".jsp");
        
        return internalResourceViewResolver;
    }
	
}
```

### webapps/views/header.jsp

```html
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
```

## 1.1. com.example.prueba.web.controllers --> SecondViewController.java

```java
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
```

## 1.2. webapps/views/second.jsp

```html
...
<div class="container marketing">
		<!-- Three columns of text below the carousel -->
	    <div class="row">
	      <div class="col-lg-4">
	        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	
	        <h2 class="fw-normal">Mensaje 1</h2>
	        <p>
	        	<c:out value="${secondViewModel.message1}"/>
	        </p>
	        <p><a class="btn btn-secondary" href="../index.jsp">Volver al Index &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-lg-4">
	        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	
	        <h2 class="fw-normal">Mensaje 2</h2>
	        <p>
	        	<c:out value="${secondViewModel.message2}"/>
	        </p>
	        <p><a class="btn btn-secondary" href="./second.jsp">Recargar esta Second View &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-lg-4">
	        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>
	
	        <h2 class="fw-normal">Mensaje 3</h2>
	        <p>
	        	<c:out value="${secondViewModel.message3}"/>
	        </p>
	        <p><a class="btn btn-secondary" href="./third.jsp">Ir a la Third View &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	</div>
...
```

# 2. Objetivo 2 - Viernes 3 de febrero --> Sacar objetos por vista (lista de alumnos)

## 2.1. com.example.prueba.web.controllers --> ThirdViewController.java

```java
@Controller(value = "ThirdViewController")
public class ThirdViewController {

	
	protected final Log logger = LogFactory.getLog(getClass());
	
	IAlumnoRepository alumnoRepository = new AlumnoRepositoryImpl();
	
	
	
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
```

## 2.2. webapps/views/third.jsp

```html
<div class="container">
		<h1 class="text-center">Lista de alumnos</h1>
		
		<table class="table table-dark table-hover">
 			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nombre</th>
					<th scope="col">Apellidos</th>
					<th scope="col">Edad</th>
					<th scope="col">Tel�fono</th>
					<th scope="col">Direcci�n</th>
				</tr>
			</thead>
			<c:forEach var="alumno" items="${thirdViewModel.alumnos}"> <!-- foreach(alumno in listalumnos) -->
				<tbody>
					<tr>
						<td><c:out value="${alumno.alumno_id}" /></td>
						<td><c:out value="${alumno.alumno_nombre}" /></td>
						<td><c:out value="${alumno.alumno_apellidos}" /></td>
						<td><c:out value="${alumno.alumno_edad}" /></td>
						<td><c:out value="${alumno.alumno_telefono}" /></td>
						<td><c:out value="${alumno.alumno_direccion}" /></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
```

## Prueba de Ejecución 1 - Objetivo 1 y 2 --> @RequestMapping() pasando mensajes y objetos del controlador a la vista

[Prueba de ejecución 1](https://user-images.githubusercontent.com/91122596/216816416-8f07f962-de69-4de4-8834-b54cf3109ac6.mp4)

# 3. Objetivo 3 - Viernes 10 de febrero --> insertar alumnos en BBDD con un formulario de registro

## 3.0. src\main\resources --> META-INF --> persistence.xml

El contexto xml propio de JPA.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<persistence 
    xmlns="http://java.sun.com/xml/ns/persistence" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://java.sun.com/xml/ns/persistence http://java.sun.com/xml/ns/persistence/persistence_2_0.xsd"
    version="2.0"
>
    <persistence-unit name="AlumnosVistas" transaction-type="RESOURCE_LOCAL">
        <description>archivo xml de contexto de persistencia de JPA con Hibernate</description>
        <provider>org.hibernate.jpa.HibernatePersistenceProvider</provider>

        <class>com.example.prueba.entities.Alumno</class>
        
        <properties>
            <property name="hibernate.connection.url" value="jdbc:postgresql://localhost/AlumnosVistas"/>
            <property name="hibernate.connection.driver_class" value="org.postgresql.Driver"/>
            <property name="hibernate.connection.username" value="postgres"/>
            <property name="hibernate.connection.password" value="12345"/>
            <property name="hibernate.archive.autodetection" value="class"/>
            <property name="hibernate.show_sql" value="false"/>
            <property name="hibernate.format_sql" value="true"/>
            <property name="hibernate.hbm2ddl.auto" value="update"/>
            <property name="hibernate.dialect" value="org.hibernate.dialect.PostgreSQLDialect"/>
        </properties>
    </persistence-unit>
</persistence>
```

## 3.1. com.example.prueba.entities --> Alumno.java

Actualizamos la entidad con code first para la BBDD.

```java
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
	
	...
```

## 3.2. com.example.prueba.repositories.interfaces --> IAlumnoRepository.java

Actualizamos la interfaz del repositorio de Alumno.

```java
public interface IAlumnoRepository {


	/**
	 * List alumnos.
	 *
	 * @return the list
	 * @throws Exception the exception
	 */
	public List<Alumno> listAlumnos() throws Exception;
	
	
	
	/**
	 * Find by id alumno.
	 *
	 * @param alumno_id the alumno id
	 * @return the alumno
	 * @throws Exception the exception
	 */
	public Alumno findByIdAlumno(long alumno_id) throws Exception;
	
	
	
	/**
	 * Insert alumno.
	 *
	 * @param alumno the alumno
	 * @throws Exception the exception
	 */
	public void insertAlumno(Alumno alumno) throws Exception;
	
	
	
	/**
	 * Edits the alumno.
	 *
	 * @param alumno_id the alumno id
	 * @param alumno_nombre the alumno nombre
	 * @param alumno_apellidos the alumno apellidos
	 * @param alumno_telefono the alumno telefono
	 * @throws Exception the exception
	 */
	public void editAlumno(long alumno_id, String alumno_nombre, String alumno_apellidos, String alumno_telefono) throws Exception;
	
	
	
	/**
	 * Delete by id alumno.
	 *
	 * @param alumno_id the alumno id
	 * @throws Exception the exception
	 */
	public void deleteByIdAlumno(long alumno_id) throws Exception;
	
	
	
	/**
	 * Delete alumno.
	 *
	 * @param alumno the alumno
	 * @throws Exception the exception
	 */
	public void deleteAlumno(Alumno alumno) throws Exception;
}
```

## 3.3. com.example.prueba.repositories.implementations --> AlumnoRepositoryImpl

Actualizamos la implementación del repositorio de Alumno.

```java
@Repository(value = "AlumnoRepositoryImpl")
public class AlumnoRepositoryImpl implements IAlumnoRepository {

	
	/** The entity manager factory. */
	@PersistenceUnit(name = "AlumnosVistas", unitName = "AlumnosVistas")
    private EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("AlumnosVistas");

	
	
	public List<Alumno> listAlumnos() throws Exception {
		// The EntityManager class allows operations such as create, read, update, delete
		EntityManager entityManager = entityManagerFactory.createEntityManager();
						
		// the lowercase a refers to the object
		// :objectID is a parameterized query thats value is set below
		String query = "SELECT a FROM Alumno a WHERE a.id IS NOT NULL";
		    	
		// Issue the query and get a matching object
		TypedQuery<Alumno> typedQuery = entityManager.createQuery(query, Alumno.class);
		List<Alumno> listaAlumnos = new ArrayList<>();
		    	
		try {
			// Get matching objects and output
		    listaAlumnos = typedQuery.getResultList();
		}
		    	
		catch(NoResultException ex) {
			ex.printStackTrace();
		}
		    	
		finally {
			// Close EntityManager
		    // entityManager.flush();
			// entityManager.clear();
		    entityManager.close();
		}
		    	
		return listaAlumnos;
	}
	
	

	/**
	 * Insert alumno - NO QUERY.
	 *
	 * @param alumno the alumno
	 * @throws Exception the exception
	 */
	@Override
	public void insertAlumno(Alumno alumno) throws Exception {
		// The EntityManager class allows operations such as create, read, update, delete
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		// Used to issue transactions on the EntityManager
		EntityTransaction entityTransaction = null;
				 
		try {
			// Get transaction and start
		    entityTransaction = entityManager.getTransaction();
		    entityTransaction.begin();
		 
		    // Save the object
		    entityManager.merge(alumno);
		    entityTransaction.commit();
		            
		} catch (Exception ex) {
			// If there is an exception rollback changes
		    if (entityTransaction != null) {
		    	entityTransaction.rollback();
		    }
		            
		    ex.printStackTrace();
		        
		} finally {
			// Close EntityManager
		    // entityManager.flush();
		    // entityManager.clear();
		    entityManager.close();
		}
	}

}
```

## 3.4. com.example.prueba.web.controllers --> ThirdViewController.java 

Actualizamos el controlador de la vista de la lista de alumnos, para que envíe una instancia de Alumno vacía hacia el formulario de registro y nos redireccione hacia esta vista del formulario.

```java
// método que nos manda al formulario de registro de alumnos
	@RequestMapping(value="/goToFormCreateAlumno")
    public String navegacionFormulario(Model model) {
        logger.info("Navegamos al formulario");
        
        Alumno alumnoModel = new Alumno();
        model.addAttribute("alumnoModel", alumnoModel);
        
        return "Form";
    } 
```

**Nota**: aún no me funciona bien la navegación entre las vistas. Tengo que moverme a través de la URL con los @requestMapping(). Actualmente no sé cómo redirigir al usuario hacia otra vista, cargándose el método principal del controlador de tal vista.

## 3.5. webapps/views/third.jsp

Actualizamos los campos a mostrar en la lista de alumnos.

```html
<table class="table table-dark table-hover">
 	<thead>
		<tr>
			<th scope="col">UUID</th>
			<th scope="col">DATE</th>
			<th scope="col">ID</th>
			<th scope="col">Nombre</th>
			<th scope="col">Apellidos</th>
			<th scope="col">Teléfono</th>
		</tr>
	</thead>
	<c:forEach var="alumno" items="${thirdViewModel.alumnos}"> <!-- foreach(alumno in listalumnos) -->
		<tbody>
			<tr>
				<td><c:out value="${alumno.alumno_uuid}" /></td>
				<td><c:out value="${alumno.alumno_date.getTime()}" /></td>
				<td><c:out value="${alumno.alumno_id}" /></td>
				<td><c:out value="${alumno.alumno_nombre}" /></td>
				<td><c:out value="${alumno.alumno_apellidos}" /></td>
				<td><c:out value="${alumno.alumno_telefono}" /></td>
			</tr>
		</tbody>
	</c:forEach>
</table>
```

## 3.6. com.example.prueba.web.controllers --> FormViewController.java

```java
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
```

## 3.7. webapps/views/Form.jsp

```html
<form:form method="POST" action="formCreateAlumno" modelAttribute="alumnoModel">
	<table>
	 	<tr class="mb-3">
	    	<td><form:label path="alumno_nombre" for="alumno_nombre" class="form-label">Nombre</form:label></td>
	   		<td><form:input path="alumno_nombre" type="text" class="form-control" id="alumno_nombre" placeholder="nombre..." /></td>
	  	</tr>
		<tr>
	    	<td><form:label path="alumno_apellidos" for="alumno_apellidos" class="form-label">Apellidos</form:label></td>
	     	<td><form:input path="alumno_apellidos" type="text" class="form-control" id="alumno_apellidos" placeholder="apellidos..." /></td>
	  	</tr>
	 	<tr>
	     	<td><form:label path="alumno_telefono" for="alumno_telefono" class="form-label">Teléfono</form:label></td>
	  		<td><form:input path="alumno_telefono" type="text" class="form-control" id="alumno_telefono" placeholder="telefono..." /></td>
	  	</tr>
	                
	  	<tr>
	   		<td><input type="submit" class="btn btn-primary" value="Registrar Alumno"/></td>
		</tr>
	</table>
</form:form> 
```

## Prueba de Ejecución 2 - Objetivo 3 --> @RequestMapping(method = RequestMethod.POST) insertando alumnos en la BBDD a través de la vista de un formulario

[Prueba de ejecución 2](https://user-images.githubusercontent.com/91122596/218308842-1149ff67-ab13-4b91-ba59-a8d8f6714117.mp4)

## Solución de Errores de Configuraciones Internas

### La uri absoluta: http://java.sun.com/jsp/jstl/core no se puede resolver en web.xml

https://programmerclick.com/article/8213382282/

### Exception: No se encuentra TagLibraryValidator class: org.apache.taglibs.standard.tlv.JstlCoreTLV

https://users.tomcat.apache.narkive.com/4yYYoYZ9/tomcat-and-jstl-1-2

### La biblioteca nativa de Apache Tomcat basada en ARP que permite un rendimiento óptimo en entornos de desarrollo no ha sido hallada en java.library.path

Explicación: 
http://java-white-box.blogspot.com/2012/04/java-tomcat-tomcat-log.html

Archivo dll:
https://archive.apache.org/dist/tomcat/tomcat-connectors/native/