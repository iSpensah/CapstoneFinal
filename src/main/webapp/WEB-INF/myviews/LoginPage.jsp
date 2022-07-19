<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <style>

        .close, .close1{
            position:absolute;
            top:15px;
            right:20px;
            font-size:42px;
            transform: rotate(45deg);
            cursor:pointer;
        }
        .modalLoginReg, .modalLoginReg1, .coupon, .events{
            width:100%;
            height:100%;
            background-color: rgba(0,0,0,0.7);
            position: fixed;
            z-index: 1;
            top:0;
            justify-content: center;
            align-items: center;
            display: none;
            overflow: auto;
            color: black;
        }
        #navbarNav .nav-link{
            cursor: pointer;
        }
        .col{
            color: #3467eb;
        }
        .form-control{
            color: black;
        }
        .login{
            background-color: rgba(255, 255, 255, 1);
            width: 30%;
            position: relative;
            border: 1px solid rgb(227, 227, 227);
            border-radius: 10px;
            padding: 2%;
            padding-right: 3%;
            padding-left: 3%;
            box-shadow: 2px 5px 20px 1px #00000032;
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s
        }
        /* Add Animation */
        @-webkit-keyframes animatetop {
        from {top:-300px; opacity:0} 
        to {top:0; opacity:1}
        }

        @keyframes animatetop {
        from {top:-300px; opacity:0}
        to {top:0; opacity:1}
        }
        h3{
            text-align: center;
        }
        .mb-4{
            width: 100%;
        }
        .login input[type="button"], .modalLoginReg1 input[type="submit"]{
            border-radius: 3px;
        }
        .loginAdmin{
            color: #3467eb;
        }
        .card-title{
          text-align: left;
        }
        
                

    </style>
    <meta charset="UTF-8">
	<%@include file="css.html" %>   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
     
    <link href="<c:url value="/resources/css/styles2.css" />" rel="stylesheet">
    <title>GameShark</title>
</head>

<body>
	<script>
	
		let params = new URLSearchParams(location.search);
		let login = params.get('login');
		let logout = params.get('logout');
		let register = params.get('register');
		
		if(login == 1){	
		    Swal.fire(
	        		  'Wrong Password!',
	        		  'Please try again!',
	        		  'error'
	        		)
	        		
	        window.addEventListener('load', (event) =>{
	        	document.querySelector('.modalLoginReg').style.display ='flex';
			});
		    
		}
		
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
				  title: 'Signed out successfully!'
				})
		}
		
		if(register == 1){
			Swal.fire(
	        		  'Registered!',
	        		  'Please login here.',
	        		  'success'
	        		)
	        		
	        window.addEventListener('load', (event) =>{
	        	document.querySelector('.modalLoginReg').style.display ='flex';
			});
		}
		
	</script>
	
    <div id="home" class="container px-4 pt-3 pt-md-0">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="#home"><img src="<c:url value="resources/assets/Logo.png" />" width="80" height="80" alt="">
            </a>
            <span class="d-none d-sm-block navbar-brand">GamePating</span>
            <span class="d-block d-sm-none navbar-brand">GamePating</span>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml">
                    <li class="nav-item">
                        <a class="nav-link active" href="#products">Shop All</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="events()">Events</a>
                    </li>
                    <li class="nav-item">
                        <span class="nav-link" href="#" onclick="loginModal()">Coupons</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#category">Categories</a>
                    </li>
                </ul>
            </div>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <span class="nav-link active" onclick="loginModal()">Login</span>
                    </li>
                    <li class="nav-item">
                        <span class="nav-link" onclick="registerModal3()">Register</span>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <section class="background-slider" style="margin-top: 30px;">
     
    </section>

     <script>
		var siteroot = "<%=request.getContextPath()%>";
		var iconFile = siteroot + '/resources/assets/2.jpg';  
		var iconFile2 = siteroot + '/resources/assets/3.jpg';   
		var iconFile3 = siteroot + '/resources/assets/4.jpg';  
		var iconFile4 = siteroot + '/resources/assets/5.jpg';  
		var iconFile5 = siteroot + '/resources/assets/6.jpg';  
		var iconFile6 = siteroot + '/resources/assets/7.jpg';   
        function changeBg(){

            const images = [
            'url(' + iconFile + ')', 
            'url(' + iconFile2 + ')', 
            'url(' + iconFile3 + ')', 
            'url(' + iconFile4 + ')', 
            'url(' + iconFile5 + ')', 
            'url(' + iconFile6 + ')', 
            ];

            const section = document.querySelector('.background-slider');
            const bg = images[Math.floor(Math.random() * images.length)];
            section.style.backgroundImage = bg;

        }

        setInterval(changeBg, 1500);

    </script>

    <!-- Products -->
    <section id="products">
        <div class="container px-4" id="container">
            <h1 class="padding-t pt-5 pt-md-0 products-heading text-center">Products</h1>
            <h5 class="text-center text-secondary"> <span><i class = "fa fa-star"></i></span>New Release<span><i class = "fa fa-star"></i></span></h5>
            <div class="row mb-5 mt-3">
                
                <c:forEach var="product" items="${allproducts}" varStatus="imgCount" begin="0" end="7">
                <div class="products-column col-md-3 p-3" >
                    <div class="card">
                    <!-- Image here IMAGE -->
                        <img onclick="loginModal()" style="cursor:pointer" src="<c:url value="/resources/images/${product.imageDashboard}" />" width="247px" height="329px" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold">${product.productname}</h3>
                            <p class="card-text text-secondary">P ${product.pprice}</p> 
                            <br />
                            <div class = "rating d-flex mt-1">
                                <span>
                                    <i class = "fa fa-star"></i> 
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                            </div>
                            
                            <div class="d-flex justify-content-end">
                                <button  class="products-button text-white mt-3 mt-md-0" onclick="loginModal()">
                               	 <i class="fa fa-cart-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach> 
            </div>
        </div>
    </section>
     		 

    
    <!-- HOT -->
    <section>
        <div class="hot">
            <div  class="vampire">  
            </div>
            
        </div>
    </section>
    
   <!-- Products -->
    <section id="products">
        <div class="container px-4" id="container">
            <h1 class="padding-t pt-5 pt-md-0 products-heading text-center">Popular Right Now</h1>
            <h5 class="text-center text-secondary"><span><i class="fas fa-fire"></i></span> Hot <span><i class="fas fa-fire"></i></span></h5>
            <div class="row mb-5 mt-3">
                
                <c:forEach var="product" items="${allproducts}" varStatus="imgCount" begin="12" end="19">
                <div class="products-column col-md-3 p-3" >
                    <div class="card">
                    <!-- Image here IMAGE -->
                        <img onclick="loginModal()" style="cursor:pointer" src="<c:url value="/resources/images/${product.imageDashboard}" />" width="247px" height="329px" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold">${product.productname}</h3>
                            <p class="card-text text-secondary">P ${product.pprice}</p> 
                            <br />
                            <div class = "rating d-flex mt-1">
                                <span>
                                    <i class = "fa fa-star"></i> 
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                                <span>
                                    <i class = "fa fa-star"></i>
                                </span>
                            </div>
                            
                            <div class="d-flex justify-content-end">
                                <button  class="products-button text-white mt-3 mt-md-0" onclick="loginModal()">
                               	 <i class="fa fa-cart-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach> 
            </div>
        </div>
    </section>

    <!-- Most Played Games -->
    <section>
        <div  class="most-played">
            <div class="vampire">
                    <h1>Pirate Warriors 4</h1>
                    <button class="view-more">View More</button>
                    <span style="font-weight:bolder">&nbsp;P 1395</span>
            </div>
            
        </div>
    </section>

    <!-- Gamers Review -->
    <section id="products">

        <div class="container px-4" id="container">
            <h1 class="padding-t pt-5 pt-md-0 products-heading text-center">Gamers Review</h1>
            <div class="row mb-5 mt-3">
                <div class="products-column col-md-3 p-3" >
                    <div class="card">
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Miracle.jpg" />" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold" style="text-align: left;">Miracle</h3>
                            <p class="card-text text-secondary">I really want this game tried buying it put my payment method was declined and i know i have enough on my card. I wish i knew why my payment method was...</p>
                        </div>
                    </div>
                </div>

                <div class="products-column col-md-3 p-3">
                    <div class="card">
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Dendi.jpg" />" class="card-img-top" alt="...">
                        <div class="card-body d-flex flex-column h-100">
                            <h3 class=" card-title font-weight-bold" style="text-align: left;">Dendi</h3>
                            <p class="flex-grow-1 card-text text-secondary">Like it a lot , easy to buy , legit , instant delivery , all game requirements listed below , description of the game below , easy payment. game in fun to play ,...</p>
                        </div>
                    </div>
                </div>

                <div class="products-column col-md-3 p-3">
                    <div class="card">
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Yaphets.jpeg" />" class="card-img-top" alt="...">
                        <div class="card-body d-flex flex-column h-100">
                            <h3 class=" card-title font-weight-bold" style="text-align: left;">YaphetS</h3>
                            <p class="flex-grow-1 card-text text-secondary">One word incredible. This game saved my mother from cancer and saved my right heart going to the shredder . After having that experience I'm a new man and am living my life very well everything...
                            </p>
                        </div>
                    </div>
                </div>

                <div class="products-column col-md-3 p-3">
                    <div class="card">
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Abed.jpg" />" class="card-img-top" alt="...">
                        <div class="card-body d-flex flex-column h-100">
                            <h3 class=" card-title font-weight-bold" style="text-align: left;">Abed</h3>
                            <p class="flex-grow-1 card-text text-secondary"> I really want this game tried buying it put my payment method was declined and i know i have enough on my card. I wish i knew why my payment method was...
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories -->
    
        <div class="container px-4" id="container">
            <h1 id="category" class="padding-t pt-5 pt-md-0 products-heading text-center">Categories</h1>
            <div id="category">
                <div class="row">
                <c:forEach var="cat" items="${procat}">
                    <div class="column" style="width:100% !important;">
                      <a href="#category" onclick="loginModal()">${cat}</a>
                    </div>
                </c:forEach>
               </div>
            </div>
        </div>

    <!-- Contact -->
    <section id="contact">
        <div class="container px-4">
            <h1 class="text-center contact-heading padding-t pt-5 pt-md-0">Contact Us!</h1>
            
            <div class="row padding-b pb-3">

                <div class="col-lg-6 order-2 order-lg-1">
                    <div class="container line mb-4 mb-lg-0"></div>
                    <div class="mb-3">
                        <i class="fas fa-phone-alt fa-2x d-inline-block align-top mt-2 mr-3"></i>
                        <div class="d-inline-block">
                            <h4>+639123456789</h4>
                            <p class="contact-detail"></p>
                        </div>
                    </div>
                    <div class="mb-3">
                        <i class="fas fa-envelope fa-2x d-inline-block align-top mt-2 mr-3"></i>
                        <div class="d-inline-block">
                            <h4>games_games@games.com</h4>
                            <p class="contact-detail"></p>
                        </div>
                    </div>
                    <div class="mb-3">
                        <i class="fas fa-map-marker-alt fa-2x d-inline-block align-top mt-2 mr-3"></i>
                        <div class="d-inline-block">
                            <h4>McKinley Hill Cyberpark, Taguig</h4>
                            <p class="contact-detail"></p>
                        </div>
                    </div>

                </div>
                <div class="contact-form col-lg-6 order-1">

                    <form action="mailto:" method="post" enctype="text/plain">
                        <div class="row">
                            <div class="col-md-6 form-group first-name-box required">
                                <!-- <label for="firstName"></label> -->
                                <input type="text" class="form-control form-control-lg input mb-3"
                                    placeholder="First name">
                            </div>
                            <div class="col-md-6 form-group last-name-box">
                                <!-- <label for="lastName"></label> -->
                                <input type="text" class="form-control form-control-lg input mb-3"
                                    placeholder="Last name">
                            </div>
                        </div>
                        <div class="form-group required">
                            <!-- <label for="email"></label> -->
                            <input type="email" class="form-control form-control-lg input mb-3" id="email"
                                placeholder="Email Address">
                        </div>
                        <div class="form-group required">
                            <!-- <label for="textArea"></label> -->
                            <textarea class="form-control form-control-lg input mb-3" id="textArea" rows="5"
                                placeholder="Message..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-dark btn-lg contact-button mb-4">Send
                            Message</button>
                    </form>
                </div>
            </div>
        </div>

    </section>



    <!-- Footer -->
    <footer id="footer">


        <div class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 text-center d-lg-flex justify-content-end align-items-center p-2">
                        <h3 class="d-inline-block footer-text px-2"><a href="#home">Home</a></h3>
                        <p class="d-inline-block footer-text px-2">&#8729;</p>
                        <h3 class="d-inline-block footer-text px-2"><a href="#products">Shop</a></h3>
                        <p class="d-inline-block footer-text px-2">&#8729;</p>
                        <h3 class="d-inline-block footer-text px-2"><a href="#category">Categories</a>
                        </h3>
                        <p class="d-inline-block footer-text px-2">&#8729;</p>
                        <h3 class="d-inline-block footer-text footer-contact px-2"><a href="#contact">Contact</a></h3>
                        <!-- <p class="d-inline-block pipe p-3">|</p> -->
                    </div>
                    <div class="col-lg-5 text-center d-lg-flex justify-content-start align-items-center p-4">
                        <a href="" target="_blank"><i
                                class="fab fa-twitter fa-2x footer-icon px-3"></i></a>
                        <a href="" target="_blank"> <i
                                class="fab fa-instagram fa-2x footer-icon px-3"></i></a>
                        <a href="" target="_blank"><i
                                class="fab fa-facebook fa-2x footer-icon px-3"></i></a>
                    </div>
                </div>
            </div>
            <!-- Login PopUp Modal-->
            <div class="modalLoginReg">
                <div class ="login">
                    <div class="close" onClick="modalClose()">+</div>
                    <form action="loginregister" method="POST"> 
                        <!-- Email input -->
                        <h3>Sign in </h2>
                        </br>
                        <div class="form-outline mb-4">
                        <input style="color: black" type="email" id="form2Example1" class="form-control" required name="email"/>
                        <label class="form-label" for="form2Example1">Email address</label>
                        </div>
                    
                        <!-- Password input -->
                        <div class="form-outline mb-4">
                        <input style="color: black"  type="password" id="form2Example2" class="form-control" required name="pass" />
                        <label class="form-label" for="form2Example2">Password</label>
                        </div>
                        
                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                        <div class="col d-flex justify-content-center">
                            <!-- Checkbox -->
                            <div class="form-check">
                            <!--<input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />--> 
                            <!--<label class="form-check-label" for="form2Example31"> Remember me </label>--> 
                            </div>
                        </div>
                            
                        <div class="col">
                            <!-- Simple link -->
                            <a href="#!">Forgot password?</a>
                        </div>
                        </div>
                    
                        <!-- Submit button -->
                        <a href="user-dashboard.html"><input type="submit" class="btn btn-primary btn-block mb-4" value="Sign in"/></a>
                        <span close="signas">Sign in as an</span> <a href="admin" class="loginAdmin">Admin?</a>
                    </form>
                    </div>
              </div>
              <style>

                .title-event p{
                    cursor: pointer;
                    font-weight: 700;
                }
                .title-event p:hover{
                    text-decoration: none;
                    opacity: .7;
                }
            </style>
            <div class="events">
                <div class ="login1">
                    <div class="close" onClick="modalClose()">+</div>
                    <div>
                        <h3>Events </h2>
                            <br />
                        <div class="hl"></div>
                        <div class="title-event" style="margin-top: 10px;justify-content: center;"> 
                            <p style="display: inline-block;padding-right: 10%;color: rgb(195, 16, 16);" onclick="ongoing()" class="p2">Ongoing Events </p>
                            <p style="display: inline-block" onclick="upcoming()" class="p1">Upcoming Events </p>
                           
                        </div>
                        <br />
                        <div class="upcoming" style="display: none;">
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>20<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>Christmas Sale</p>
                                    <p>Starts: December 24, 2022</p>
                                </div>
                            </div>
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>15<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>Halloween Sale</p>
                                    <p>Starts: November 1, 2022</p>
                                </div>
                            </div>
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>30<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>New Year Sale</p>
                                    <p>Starts: December 30, 2022</p>
                                </div>
                            </div>
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>10<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>Winter Sale</p>
                                    <p>Starts: September 1, 2022</p>
                                </div>
                            </div>
                        </div>
                        <!-- Coupon Card-->
                        <div class="ongoing">
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>25<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>Summer Sale</p>
                                    <p>Valid Until: August 1, 2023</p>
                                </div>
                            </div>
                            <div class="coupon-card">
                                <div class="sale">
                                    <p>50<span>%</span></p>
                                </div>
                                <div class="vl"></div>
                                <div class="details">
                                    <p>Buy 1 Take Sale</p>
                                    <p>Valid Until: January 3, 2023</p>
                                </div>
                             </div>
                        </div>
                        
                    </div>
              </div>
            </div>
            <!-- Coupon PopUp Modal-->
            <div class="coupon">
                <div class ="login1">
                    <div class="close" onClick="modalClose()">+</div>
                    <div>
                        <h3>Coupons </h2>
                            <br />
                        <div class="hl"></div>
                        <br />
                        <!-- Coupon Card-->
                        <div class="coupon-card">
                            <div class="sale">
                                <p>20<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Christmas Sale</p>
                                <p>Valid Until: January 3, 2023</p>
                            </div>
                        </div>
                        <div class="coupon-card">
                            <div class="sale">
                                <p>15<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Halloween Sale</p>
                                <p>Valid Until: November 30, 2022</p>
                            </div>
                        </div>
                        <div class="coupon-card">
                            <div class="sale">
                                <p>30<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Black Friday Sale</p>
                                <p>Valid Until: January 3, 2023</p>
                            </div>
                        </div>
                        <div class="coupon-card">
                            <div class="sale">
                                <p>25<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Summer Sale</p>
                                <p>Valid Until: August 1, 2023</p>
                            </div>
                        </div>
                        <div class="coupon-card">
                            <div class="sale">
                                <p>10<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Winter Sale</p>
                                <p>Valid Until: February 3, 2023</p>
                            </div>
                        </div>
                        <div class="coupon-card">
                            <div class="sale">
                                <p>50<span>%</span></p>
                            </div>
                            <div class="vl"></div>
                            <div class="details">
                                <p>Buy 1 Take Sale</p>
                                <p>Valid Until: January 3, 2023</p>
                            </div>
                         </div>
                    </div>
              </div>
            </div>
              <div class="modalLoginReg1" >
                <div class ="login">
                    <div class="close" onClick="modalClose()">+</div>
                    <form action="register" method="POST">
                        <!-- Email input -->
                        <h3>Register </h2>
                        </br>
                        <style>
                        	.merge .form-outline mb-4{
                        		float:left
                        	}
                        </style>
                        <div class="merge">
	                        <div class="form-outline mb-4">
	                            <input style="color: black" type="text" id="form2Example1" class="form-control" name="firstname"/>
	                            <label class="form-label" for="form2Example1">Firstname</label>
	                        </div>
	
	                        <div class="form-outline mb-4">
	                            <input  style="color: black" type="text" id="form2Example1" class="form-control" name="lastname" />
	                            <label class="form-label" for="form2Example1">Lastname</label>
	                        </div>
                        </div>
                        <div class="form-outline mb-4">
	                        <input style="color: black" type="email" id="form2Example1" class="form-control" name="email" />
	                        <label class="form-label" for="form2Example1">Email address</label>
                        </div>
                    
                        <!-- Password input -->
                        <div class="form-outline mb-4">
	                        <input style="color: black" type="password" id="pass" class="form-control" onkeyup="validate_password()" name="userpass" minlength="8" maxlength="25"/>
	                        <label class="form-label" for="form2Example2">Password</label>
                        </div> 
                        
                        <div class="form-outline mb-4" style="margin-bottom:0px !important;" >
	                        <input style="color: black;" type="password" id="confirmpass" class="form-control" onkeyup="validate_password()"/>
	                        <label class="form-label" for="form2Example2">Confirm Password</label>
                        </div><span style="text-align:center;font-size:12px;" id="errormsg"></span>
                        
                        <div class="form-outline mb-4" style="margin-top:1.5rem !important;">
                            <input style="color: black" type="text" onkeypress="return /[0-9]/i.test(event.key)" id="form2Example1" class="form-control" name="phonenumber" minlength="11" maxlength="11"/>
                            <label class="form-label" for="form2Example1">Phone Number</label>
                        </div>
                        
                        <div class="form-outline mb-4">
	                        <input style="color: black" type="text" id="pass" class="form-control" onkeyup="validate_password()" name="address"/>
	                        <label class="form-label" for="form2Example2">Address</label>
                        </div> 
                             <select class="form-control" style="width:50%;margin-bottom:0px !important;color: #495057;" name="gender">
						  		<option selected>Gender</option>
						  		<option>Male</option>
						  		<option>Female</option>
						  		<option>Other</option>
							 </select>
                        
                        <script>
 
	                        function validate_password() {
	                       	 
	                            var pass = document.getElementById('pass').value;
	                            var confirm_pass = document.getElementById('confirmpass').value;
	                            
	                            if(pass != "" || confirm_pass != ""){
	                            	 if (pass != confirm_pass) {
	 	                            	document.getElementById('errormsg').style.color = 'red';
	 	                                document.getElementById('errormsg').innerHTML =  '*Password do not match!';
	 	                                document.getElementById('submit').disabled = true;
	 	                            }else{
	 	                            	document.getElementById('errormsg').style.color = 'green';
	 	                            	document.getElementById('errormsg').innerHTML =  '*Password matched!';
	 	                            	document.getElementById('submit').disabled = false;
	 	                            }
	                            }else{
	                            	document.getElementById('errormsg').innerHTML =  '';
	                            }
	                           
	                        }
                        
                        </script>
                        <br /><br />
                        <!-- Submit button -->
                        <input type="submit" class="btn btn-primary btn-block mb-4" id="submit" value="Register"/>
                    </form>
                    </div>
              </div>

         
    </footer>
    <script>

        function registerModal3(){
            document.querySelector('.modalLoginReg1').style.display ='flex';
        }
        function ongoing(){
            document.querySelector('.ongoing').style.display ='block';
            document.querySelector('.upcoming').style.display ='none';
            document.querySelector('.p1').style.color = 'black';
            document.querySelector('.p2').style.color ='rgb(195, 16, 16)';
        }
        function upcoming(){
            document.querySelector('.upcoming').style.display ='block';
            document.querySelector('.ongoing').style.display ='none';
            document.querySelector('.p1').style.color = 'rgb(195, 16, 16)';
            document.querySelector('.p2').style.color ='black';
        }
      /*   function modalProduct2(){
            document.querySelector('.productModal2').style.display ='flex';
        } */

        function loginModal(){
            document.querySelector('.modalLoginReg').style.display ='flex';
        }

        function coupon(){
            document.querySelector('.coupon').style.display ='flex';
        }
        function events(){
            document.querySelector('.events').style.display ='flex';
        }


        function modalClose(){
            document.querySelector('.modalLoginReg').style.display ='none';
            document.querySelector('.modalLoginReg1').style.display ='none';
            document.querySelector('.coupon').style.display ='none';
            document.querySelector('.events').style.display ='none';
        }
    		
    </script>


    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" data-auto-replace-svg="nest"></script>


    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

    <!-- Owl Carousel -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.0.0/mdb.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>
