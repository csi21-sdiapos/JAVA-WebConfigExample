<%@ include file="/views/header.jsp" %>

<html>

<head>
	<meta charset="UTF-8">
	<meta name="theme-color" content="#712cf9">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>Second View</title>
	
	<style>
		.form-control-dark {
		  	border-color: var(--bs-gray);
		}
		.form-control-dark:focus {
		  	border-color: #fff;
		  	box-shadow: 0 0 0 .25rem rgba(255, 255, 255, .25);
		}
		.text-small {
		  	font-size: 85%;
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