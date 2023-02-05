# Ejemplo de Configuración Web mediante Anotaciones de Spring Framework

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
```

### com.example.prueba.web.controllers --> SecondViewController.java

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

### webapps/views/second.jsp

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

### com.example.prueba.web.controllers --> ThirdViewController.java

```java
@Controller(value = "ThirdViewController")
public class ThirdViewController {

	protected final Log logger = LogFactory.getLog(getClass());
	IAlumnoRepository alumnoRepository = new AlumnoRepositoryImpl();
	
	@RequestMapping(value = "/third")
    public ModelAndView requestThirdViewManager() throws Exception {
        
		logger.info("Entrando en el metodo --> requestThirdViewManager() --> ThirdViewController");
        
		List<Alumno> listaAlumnos = alumnoRepository.listarAlumnos();
		Map<String, Object> thirdViewModel = new HashMap<>();
        thirdViewModel.put("alumnos", listaAlumnos);
        
        logger.info("La listaAlumnos contiene " + listaAlumnos.size() + " alumnos");
        
        return new ModelAndView("third", "thirdViewModel", thirdViewModel);
    } 	
}
```

### webapps/views/second.jsp

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

## Prueba de Ejecución 1 --> @RequestMapping() pasando mensajes y objetos a la vista

[Prueba de ejecución 1](https://user-images.githubusercontent.com/91122596/216816416-8f07f962-de69-4de4-8834-b54cf3109ac6.mp4)