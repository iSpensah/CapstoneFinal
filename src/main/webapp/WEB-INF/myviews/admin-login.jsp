<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
  <head>
       
    <!--  Swal -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	
  	<title>Admin Login</title>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <meta charset="UTF-8" />
    <!-- Font Awesome -->
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    rel="stylesheet"
    />
    <!-- Google Fonts -->
    <link
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
    rel="stylesheet"
    />
    <!-- MDB -->
    <link
    href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.css"
    rel="stylesheet"
    />
    <title>Login</title>
  </head>
    <body>
    <script>
	let params = new URLSearchParams(location.search);
	let logout = params.get('logout');
	
	if(logout == 1){
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: false,
			  timer: 1000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  }
			})

			Toast.fire({
			  icon: 'success',
			  title: 'Signed out successfully.'
			})
		}
  </script>

        <section class="h-100 gradient-form" style=" background-image: url('https://img.freepik.com/free-photo/black-texture-with-brick-wall-background_35257-311.jpg');">
            <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-10" >
                <div class="card rounded-3 text-black" >
                    <div class="row g-0">
                    <div class="col-lg-6">
                        <div class="card-body p-md-5 mx-md-4">
        
                        <div class="text-center">
                            <img src="<c:url value="/resources/images/Logo.png"/>"
                            style="width: 185px;" alt="logo"><br/>
                            <h1 class="mt-1 mb-5 pb-1" style="font-weight:900">GamePating</h1>
                        </div>
        
                        <form action="signin" method="post">
                            <p>Please login to your account</p>

        
                            <div class="form-outline mb-4">
                            <input type="text" id="usernameAdmin" class="form-control"
                                placeholder="Input AdminID" required name="adminid"/>
                            <label class="form-label" for="form2Example11">AdminID</label>
                            </div>

                            <div class="form-outline mb-4">
                            <input type="password" id="passwordAdmin" required name="adminpass" class="form-control" />
                            <label class="form-label" for="form2Example22">Password</label>
                            </div>

                            <div class="text-center pt-1 mb-5 pb-1">
                            <p><font color="red">  ${IncorrectNotify} </font> </p>
                            <a href="admin-overview">
                            	<button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit" name="submit">Login</button>
                            </a>
                            </div>

        

                        </form>
        
                        </div>
                    </div>
                    <div class="col-lg-6 d-flex align-items-center gradient-custom-2" style="background-color: #000000;
                    background-image: url('../user/assets/BG.jpg'); background-size: cover;">
                        <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                        <h4 class="mb-4">We are more than just a company</h4>
                        <p class="small mb-0">GameShark Inc. is an IT company based in North Korea. We have been in business since 2010. We work with Activision, Rockstar Games, Valve, Riot and other Gaming Companies. We do most of our work online with the customer. Give us a call and let us help you with your Gaming Needs..</p>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
            </div>
            </div>
        </section>
        
         <!-- Section: Design Block -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.js"
        >
        </script>
    </body>
</html>

