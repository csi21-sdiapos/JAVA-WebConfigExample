<%@ include file="/views/header.jsp" %>

<!DOCTYPE html>
<html class="h-100">
<head>
	<meta charset="UTF-8">
	<meta name="theme-color" content="#712cf9">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>Insert title here</title>
	
	<style>
		.btn-secondary,
		.btn-secondary:hover,
		.btn-secondary:focus {
		  	color: #333;
		  	text-shadow: none; /* Prevent inheritance from `body` */
		}
		
		body {
		  	text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
		  	box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
		}
		.cover-container {
		  max-width: 42em;
		}
		
		.nav-masthead .nav-link {
		  	color: rgba(255, 255, 255, .5);
		  	border-bottom: .25rem solid transparent;
		}
		.nav-masthead .nav-link:hover,
		.nav-masthead .nav-link:focus {
		  	border-bottom-color: rgba(255, 255, 255, .25);
		}
		.nav-masthead .nav-link + .nav-link {
		  	margin-left: 1rem;
		}
		.nav-masthead .active {
		  	color: #fff;
		  	border-bottom-color: #fff;
		}
      	.bd-placeholder-img {
        	font-size: 1.125rem;
        	text-anchor: middle;
        	-webkit-user-select: none;
        	-moz-user-select: none;
        	user-select: none;
      	}
      	
      	@media (min-width: 768px) {
        	.bd-placeholder-img-lg {
          	font-size: 3.5rem;
        	}
      	}
      
      	.b-example-divider {
        	height: 3rem;
        	background-color: rgba(0, 0, 0, .1);
        	border: solid rgba(0, 0, 0, .15);
        	border-width: 1px 0;
        	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      	}
      	.b-example-vr {
        	flex-shrink: 0;
        	width: 1.5rem;
        	height: 100vh;
      	}
      	.bi {
        	vertical-align: -.125em;
        	fill: currentColor;
      	}
      	.nav-scroller {
        	position: relative;
        	z-index: 2;
        	height: 2.75rem;
        	overflow-y: hidden;
      	}
      	.nav-scroller .nav {
        	display: flex;
        	flex-wrap: nowrap;
        	padding-bottom: 1rem;
        	margin-top: -1px;
        	overflow-x: auto;
        	text-align: center;
        	white-space: nowrap;
        	-webkit-overflow-scrolling: touch;
      	}
    </style>
</head>

<body class="d-flex h-100 text-center text-bg-dark">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	  <header class="mb-auto">
	    <div>
	      <h3 class="float-md-start mb-0">WebConfig</h3>
	      <nav class="nav nav-masthead justify-content-center float-md-end">
	        <a class="nav-link fw-bold py-1 px-0 active" aria-current="page" href="#">Index</a>
	        <a class="nav-link fw-bold py-1 px-0" href="<c:url value="goToSecondView" />">Second View</a>
	        <a class="nav-link fw-bold py-1 px-0" href="<c:url value="goToThirdView" />">Third View</a>
	      </nav>
	    </div>
	  </header>
	
	  <main class="px-3">
	    <h1>Esto es el INDEX</h1>
	    <p class="lead">
			Esto es un home hecho con una platilla de Bootstrap v5.2
		</p>
	    <p class="lead">
	      <a href="<c:url value="goToSecondView" />" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Second View</a>
	    </p>
	    <p class="lead">
	      <a href="<c:url value="goToThirdView" />" class="btn btn-lg btn-secondary fw-bold border-white bg-white">Third View</a>
	    </p>
	  </main>
	
	  <footer class="mt-auto text-white-50">
	    <p>Ejercicio de prueba para configuración básica web con anotaciones de Spring y para crear nuestras primeras vistas</p>
	  </footer>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>