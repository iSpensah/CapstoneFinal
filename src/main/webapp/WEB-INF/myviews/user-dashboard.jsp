<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.util.Calendar"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <style>
    
    .most-played{
	width:100%;
	height: 80vh;
	background: url('assets/BG Most3.jpg');
	background-color: rgba(39, 39, 39, 0.7);
	align-items: center;
	display: flex;
	overflow: auto;
	color: rgb(255, 255, 255);
	background-repeat: no-repeat;
	background-size: cover;
	}
.dropdown {
	float: right;
	padding-right: 30px;
}

.btn {
	border: none;
	margin: 10px 0px;
	box-shadow: none !important;
	background-color: black;
}
.dropdown .dropdown-menu {
	padding: 20px;
	top: 70px !important;
	width: 400px !important;
	left: -310px !important;
	cursor: default;
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: .4;
	animation-name: animatetop;
	animation-duration: .4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
	from {
		top: -300px;
		opacity: 0
	}

	to {
		top: 0;
		opacity: 1
	}
}

@keyframes animatetop {
	from {
		top: -300px;
		opacity: 0
	}

	to {
		top: 0;
		opacity: 1
	}
}

.total-header-section {
	border-bottom: 1px solid #d2d2d2;
}

.total-section p {
	margin-bottom: 20px;
}

.cart-detail {
	padding: 15px 0px;
}

.cart-detail-img img {
	width: 100%;
	height: 100%;
	padding-left: 15px;
}

.cart-detail-product p {
	margin: 0px;
	color: #000;
	font-weight: 500;
}

.cart-detail .price {
	font-size: 15px;
	margin-right: 10px;
	font-weight: 500;
}

.cart-detail .count {
	font-size: 14px;
	color: #666666;
}

.checkout {
	border-top: 1px solid #d2d2d2;
	padding-top: 15px;
}

.checkout .btn-primary {
	border-radius: 5px;
	height: 50px;
}

.dropdown-menu:before {
	content: " ";
	position: absolute;
	top: -20px;
	right: 50px;
	border: 10px solid transparent;
	border-bottom-color: #fff;
}
.btn:hover{
	background-color: rgba(0, 0, 0, 0.8);
}

/* width */
::-webkit-scrollbar {
	width: 5px;
  }
  
  /* Track */
  ::-webkit-scrollbar-track {
	background: #f1f1f1; 
  }
   
  /* Handle */
  ::-webkit-scrollbar-thumb {
	background: #888; 
  }
  
  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
	background: #555; 
  }
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
   .login input[type="submit"]{
       border-radius: 3px;
   }
   .loginAdmin{
       color: #3467eb;
   }
   
           

    </style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
  	<%@include file="css.html" %>   
    <!-- CSS Link -->
    <link rel="stylesheet" href="<c:url value="/resources/css/styles2.css" /> ">
    <title>Dashboard</title>
</head>

<body>
	<script>
	let params = new URLSearchParams(location.search);
	let login = params.get('login');
	let cart = params.get('cart');
	let remove = params.get('delete');
	let payment = params.get('payment');
	
	if(payment == 1){
		let timerInterval
		Swal.fire({
		  icon: 'success',
		  title: 'Payment successful!',
		  html: 'Redirecting to hompage in <b></b> milliseconds.',
		  timer: 1500,
		  timerProgressBar: true,
		  didOpen: () => {
		    Swal.showLoading()
		    const b = Swal.getHtmlContainer().querySelector('b')
		    timerInterval = setInterval(() => {
		      b.textContent = Swal.getTimerLeft()
		    }, 100)
		  },
		  willClose: () => {
		    clearInterval(timerInterval)
		  }
		}).then((result) => {
		  /* Read more about handling dismissals below */
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log('I was closed by the timer')
		  }
		})
	}
	
	if(login == 1){
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
		  title: 'Signed in successfully'
		})
	}
	
	if(cart == 1){
		Swal.fire(
				  'Great!',
				  'Successfully added to cart!',
				  'success'
				)
		}
	
	if(remove == 1){
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: false,
			  timer: 2000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  }
			})

			Toast.fire({
			  icon: 'success',
			  title: 'Item/s removed successfully!'
			})
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
                        <a class="nav-link active" href="shopall?userid=${userid}">Shop All</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"  onclick="events()">Events</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="coupon()">Coupons</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#category">Categories</a>
                    </li>
                </ul>
            </div>
            	
        			<div class="dropdown">
                            <div type="button" class="btn btn-info" data-toggle="dropdown" style="background-color: transparent;border:none;">
                                <i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 22px;"></i><span
                                    class="badge badge-pill badge-danger">${count }</span>
                            </div>
                            <div class="dropdown-menu">
                                <div class="row total-header-section">
                                    <div class="col-lg-6 col-sm-6 col-6">
                                        <i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 18px;"></i> <span
                                            class="badge badge-pill badge-danger">${count }</span>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-6 total-section text-right">
                                        <p>Your Cart</span></p>
                                    </div>
                                </div>
                                <div class="over" style="overflow-x: hidden; max-height: 300px;">
                                <c:choose>
                               	<c:when test = "${not empty cart}">
						         <c:set var="total" value="${0}"/>
                               		<c:forEach var="cart" items="${cart}" varStatus="loop">  
                               		<c:set var="sumofqua" value="${cart.pprice * cart.quantity}"/>
	                                    <div class="row cart-detail">
	                                        <div class="col-lg-4 col-sm-4 col-4 cart-detail-img">
	                                            <img src="<c:url value="/resources/images/${cart.imageDashboard}" />">
	                                        </div>
	                                        <div class="col-lg-8 col-sm-8 col-8 cart-detail-product">
	                                            <p>${cart.productname }</p>
	                                            <span class="price" style="color:red;font-size: 17px;">P ${sumofqua}</span> <span class="count"> Quantity: ${cart.quantity }</span>
	                                            <br/>
	                                            <br/>
	                                            <a href="deleteCart/${cart.cartid}?userid=${userid}&productid=${cart.productid}&quantity=${cart.quantity}"><button style="background-color:red;color:white;border:none;border-radius:2px;width:50%;font-size: 13px;'">Remove</button></a>
	                                        </div>
	                                        
	                                        <c:set var="total" value="${sumofqua + total}"/>
	                                    </div>
	                            	 </c:forEach>
						     	</c:when>
						     	<c:otherwise>
						     	<br/>
						     	  <h5 style="text-align:center;color:red;">There's nothing out here.</h5>
						     	 <br/>
						     	</c:otherwise>
						     	</c:choose>
	                             </div>
                                
                                <div class="row">
                                    <div class="col-lg-12 col-sm-12 col-12 text-center checkout">
                                        <p style="float:right;">Total: <span style="color:red;font-weight: 500;"><c:out value="P ${total}"/></span></p>
                                        <a href="usercheckout?userid=${userid}"><button style="background-color: black;border: none;" class="btn btn-primary btn-block">Checkout</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
             
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <div class="dropdown">
                        <i class="fa fa-bars"  aria-hidden="true" style="font-size:25px"></i>
                        <div class="dropdown-content">
                            <a href="showUserDetails?userid=${userid}#tab1">Profile</a>
                            <a href="usercheckout?userid=${userid}">View Cart</a>
                            <a href="../Spring_Project?logout=1">Logout</a>
                        </div>
                        </div>
                    </li>
                </ul>
        </nav>
       
    </div>
    <section class="background-slider" style="margin-top: 30px;">
        <div>
            <!-- <h2>Play to win, but enjoy the fun.</h2> -->
        </div>
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
                        <a href="viewproduct/${product.productid}?userid=${userid}"><img style="cursor:pointer" src="<c:url value="/resources/images/${product.imageDashboard}" />" width="247px" height="329px" class="card-img-top" alt="..."></a>
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
	                        <script>
		                       	window.addEventListener('load', (event) =>{
			                       	var date = new Date();
			                       		
			                       	var year = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
									var time = date.getHours() + '-' + date.getMinutes() + '-' + date.getSeconds();
									
									date = year + " " + time;
								
		                      	   	document.getElementById("timestamp${imgCount.count}").value = date;
		
		                      	});
							</script>
               				<form action="addtocart" method="GET">	
		                        <input type="hidden" value="1" name="qoh">
		                        <input type="hidden" value="${userid}" name="userid">
		                        <input type="hidden" value="${product.productid}" name="productid">
		                        <input type="hidden" value="1" name="isOnCart">
		                        <input type="hidden" value="" id="timestamp${imgCount.count}" name="date"/>
		                        <input type="hidden" value="${product.QOH}" name="tot"/>
                            
	                            <div class="d-flex justify-content-end">
	                                <button type="submit" class="products-button text-white mt-3 mt-md-0"	>
	                               	 <i class="fa fa-cart-plus"></i>
	                                </button>
	                            </div>
             				</form> 
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
            <h1 class="padding-t pt-5 pt-md-0 products-heading text-center">Popular Products</h1>
             <h5 class="text-center text-secondary"><span><i class="fas fa-fire"></i></span> Hot <span><i class="fas fa-fire"></i></span></h5>
            <div class="row mb-5 mt-3">
                <c:forEach var="product" items="${allproducts}" varStatus="imgCount" begin="12" end="19">
                <div class="products-column col-md-3 p-3" >
                    <div class="card">
                    <!-- Image here IMAGE -->
                        <a href="viewproduct/${product.productid}?userid=${userid}"><img style="cursor:pointer" src="<c:url value="/resources/images/${product.imageDashboard}" />" width="247px" height="329px" class="card-img-top" alt="..."></a>
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
	                        <script>
		                       	window.addEventListener('load', (event) =>{
			                       	var date = new Date();
			                       		
			                       	var year = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate();
									var time = date.getHours() + '-' + date.getMinutes() + '-' + date.getSeconds();
									
									date = year + " " + time;
								
		                      	   	document.getElementById("timestamp${imgCount.count}").value = date;
		
		                      	});
							</script>
               				<form action="addtocart" method="GET">	
		                        <input type="hidden" value="1" name="qoh">
		                        <input type="hidden" value="${userid}" name="userid">
		                        <input type="hidden" value="${product.productid}" name="productid">
		                        <input type="hidden" value="1" name="isOnCart">
		                        <input type="hidden" value="" id="timestamp${imgCount.count}" name="date"/>
		                        <input type="hidden" value="${product.QOH}" name="tot"/>
                            
	                            <div class="d-flex justify-content-end">
	                                <button type="submit" class="products-button text-white mt-3 mt-md-0"	>
	                               	 <i class="fa fa-cart-plus"></i>
	                                </button>
	                            </div>
             				</form> 
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
                    <a href="viewproduct/4006?userid=${userid}"><button class="view-more">View More</button></a>
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
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Miracle.jpg"/>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h3 class="card-title font-weight-bold" style="text-align: left;">Miracle</h3>
                            <p class="card-text text-secondary">I really want this game tried buying it put my payment method was declined and i know i have enough on my card. I wish i knew why my payment method was...</p>
                        </div>
                    </div>
                </div>

                <div class="products-column col-md-3 p-3">
                    <div class="card">
                        <img src="<c:url value="/resources/assets/Gamers Review Pic/Dendi.jpg"/>" class="card-img-top" alt="...">
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
                      <a href="filtershopall?userid=${userid}&cat=${cat}" onclick="loginModal()">${cat}</a>
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
                        <h3 class="d-inline-block footer-text px-2"><a href="#">Categories</a>
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
                <c:choose>
                <c:when test="${not empty allcoupon}">
                <c:forEach var="coup" items="${allcoupon}">
                	<c:set var="date2" value="${coup.eventenddate}"/>
                	
                	<%  
                   	  	String sDate1= String.valueOf(pageContext.getAttribute("date2"));  
                   	    Calendar cal = Calendar.getInstance();

                   	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
                   	    cal.setTime(sdf.parse(sDate1));

                   	    SimpleDateFormat month_date = new SimpleDateFormat("MMMM dd, yyyy");
                   	    String month_name = month_date.format(cal.getTime());
   	
                    %>
                    
                <div class="coupon-card">
                    <div class="sale">
                        <p>${coup.discount}<span>%</span></p>
                    </div>
                    <div class="vl"></div>
                    <div class="details">
                        <p>${coup.coupname}</p>
                        <p>Valid Until: <% out.println(month_name); %></p>
                    </div>
                </div>
                </c:forEach>
                </c:when>
			     	<c:otherwise>
			     	<br/>
			     	  <h5 style="text-align:center;color:red;">No available coupons.</h5>
			     	 <br/>
			     	</c:otherwise>
                </c:choose>
            </div>
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
                <c:choose>
                <c:when test="${not empty allcoupon}">
                	<c:forEach var="up" items="${upcoming}">
                	<c:set var="date2" value="${up.eventstartdate}"/>
                	<%  
                   	  	String sDate1= String.valueOf(pageContext.getAttribute("date2"));  
                   	    Calendar cal = Calendar.getInstance();

                   	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
                   	    cal.setTime(sdf.parse(sDate1));

                   	    SimpleDateFormat month_date = new SimpleDateFormat("MMMM dd, yyyy");
                   	    String month_name = month_date.format(cal.getTime());
   	
                    %>
                    <div class="coupon-card">
                        <div class="sale">
                            <p>${up.discount}<span>%</span></p>
                        </div>
                        <div class="vl"></div>
                        <div class="details">
                            <p>${up.coupname}</p>
                            <p>Starts:   <% out.println(month_name); %></p>
                        </div>
                    </div>
                    </c:forEach>
                </c:when>
			     	<c:otherwise>
			     	<br/>
			     	  <h5 style="text-align:center;color:red;">No upcoming events.</h5>
			     	 <br/>
			     	</c:otherwise>
                </c:choose>
                </div>
                <!-- Coupon Card-->
                <div class="ongoing">
                <c:choose>
                <c:when test="${not empty allcoupon}">
                    <c:forEach var="coup" items="${allcoupon}">
                    <c:set var="date2" value="${coup.eventenddate}"/>
                	<%  
                   	  	String sDate1= String.valueOf(pageContext.getAttribute("date2"));  
                   	    Calendar cal = Calendar.getInstance();

                   	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
                   	    cal.setTime(sdf.parse(sDate1));

                   	    SimpleDateFormat month_date = new SimpleDateFormat("MMMM dd, yyyy");
                   	    String month_name = month_date.format(cal.getTime());
   	
                    %>
                    <div class="coupon-card">
                        <div class="sale">
                            <p>${coup.discount}<span>%</span></p>
                        </div>
                        <div class="vl"></div>
                        <div class="details">
                            <p>${coup.coupname}</p>
                            <p>Valid Until: <% out.println(month_name); %></p>
                        </div>
                    </div>
                    </c:forEach>
                </c:when>
			     	<c:otherwise>
			     	<br/>
			     	  <h5 style="text-align:center;color:red;">No ongoing events.</h5>
			     	 <br/>
			     	</c:otherwise>
                </c:choose>
                </div>
            </div>
      </div>
    </div>


    </footer>
    <script>
    
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

        function coupon(){
            document.querySelector('.coupon').style.display ='flex';
        }
        function events(){
            document.querySelector('.events').style.display ='flex';
        }
        
        function modalClose(){
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
