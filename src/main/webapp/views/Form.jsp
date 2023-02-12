<%@ include file="/views/header.jsp" %>

<html>

<head>
	<meta charset="UTF-8">
	<meta name="theme-color" content="#712cf9">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>Register Form</title>
</head>
 
<body>
	<header class="p-3 text-bg-dark">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">About</a></li>
	         
	          <li><a <c:url value="/goToFormCreateAlumno" /> class="btn btn-primary px-2 text-white">Formulario de Registro</a></li>
	        </ul>
	
	        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
	          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
	        </form>
	
	        <div class="text-end">
	          <button type="button" class="btn btn-outline-light me-2">Login</button>
	          <button type="button" class="btn btn-warning">Sign-up</button>
	        </div>
	      </div>
	    </div>
	</header>
    
    <div class="container">
    	<h1 class="text-center">Formulario de Registro de Alumnos</h1>
    	
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
    </div>
  	
  	<footer class="py-5 text-bg-dark">
	    <div class="row">
	      <div class="col-6 col-md-2 mb-3">
	        <h5>Section</h5>
	        <ul class="nav flex-column">
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	        </ul>
	      </div>
	
	      <div class="col-6 col-md-2 mb-3">
	        <h5>Section</h5>
	        <ul class="nav flex-column">
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	        </ul>
	      </div>
	
	      <div class="col-6 col-md-2 mb-3">
	        <h5>Section</h5>
	        <ul class="nav flex-column">
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
	          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
	        </ul>
	      </div>
	
	      <div class="col-md-5 offset-md-1 mb-3">
	        <form>
	          <h5>Subscribe to our newsletter</h5>
	          <p>Monthly digest of what's new and exciting from us.</p>
	          <div class="d-flex flex-column flex-sm-row w-100 gap-2">
	            <label for="newsletter1" class="visually-hidden">Email address</label>
	            <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
	            <button class="btn btn-primary" type="button">Subscribe</button>
	          </div>
	        </form>
	      </div>
	    </div>
	
	    <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
	      <p>&copy; 2022 Company, Inc. All rights reserved.</p>
	      <ul class="list-unstyled d-flex">
	        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
	        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
	        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
	      </ul>
	    </div>
	</footer>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> 
 </body>

</html>