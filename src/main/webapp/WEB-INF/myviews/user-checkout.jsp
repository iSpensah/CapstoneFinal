<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException,java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <style>
    
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
            color: black;
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
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<%@include file="css.html" %>   

    <!-- CSS Link -->
    <link href="<c:url value="/resources/css/checkout.css"/>" rel="stylesheet">
    <title>Checkout</title>
</head>

<body>
<script>
	
		let params = new URLSearchParams(location.search);
		let remove = params.get('delete');
		let buy = params.get('buy');
		
		let add = params.get('add');
		let minus = params.get('minus');
	
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
		
		if(buy == 1){
			let timerInterval
			Swal.fire({
			  icon: 'success',
			  title: 'Added to cart!',
			  html: 'Redirecting to checkout in <b></b> milliseconds.',
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
		
		if(add == 1){
			Swal.fire(
					  'Added!',
					  'Item has been added by 1.',
					  'success'
					)
		}
		
		if(minus == 1){
			Swal.fire(
					  'Updated!',
					  'Removed 1 to the item.',
					  'success'
					)
		}
		
	</script>
    <div id="home" class="container px-4 pt-3 pt-md-0">
      <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="user-dashboard?userid=${userid}"><img src="<c:url value="resources/assets/Logo.png" />" width="80" height="80" alt="">
            </a>
            <a class="navbar-brand" href="user-dashboard?userid=${userid}"><span class="d-none d-sm-block navbar-brand">GamePating</span></a>
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
                                            class="badge badge-pill badge-danger">${count}</span>
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
	                                            <a href="deleteViewCart/${cart.cartid}?userid=${userid}&productid=${cart.productid}&quantity=${cart.quantity}"><button style="background-color:red;border:none;border-radius:2px;width:50%;font-size: 13px;'">Remove</button></a>
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
                            <a href="showUserDetails?userid=${userid}#tab1"">Profile</a>
                            <a href="#">View Cart</a>
                            <a href="../Spring_Project?logout=1"">Logout</a>
                        </div>
                        </div>
                    </li>
                </ul>
        </nav>
    </div>
    

    <!-- Products -->

    <section class="h-100 h-custom" style="background-color:white;">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
              <div class="card">
                <div class="card-body p-4">
                  <div class="row">
                    <div class="col-lg-7">
                      <h5 class="mb-3"><a href="shopall?userid=${userid}" class="text-body"><i
                            class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                      <hr>
                      <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                          <p class="mb-1">Shopping cart</p>
                          <p class="mb-0">You have ${count} items in your cart</p>
                        </div>
                        <div>
                          <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!"
                              class="text-body">price <i class="fas fa-angle-down mt-1"></i></a></p>
                        </div>
                      </div>
     
			<c:set var="total" value="${0}" />
			<div style="max-height:450px;overflow:auto;">
			 <c:forEach var="cart" items="${cart}" varStatus="count">  
			 <tr>
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="<c:url value="/resources/images/${cart.imageDashboard}"/>"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        
                        <div class="ms-3">
                          <h4><td>${cart.productname}</td></h4>
                          <p class="small mb-0"><td>${cart.companyName}</td></p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                      <h6 class="fw-normal mb-0" style="font-weight:600;"><span style="opacity:0.7">Qty:</span> <span style="font-weight:700;">${cart.quantity }</span></h6>
                        	<div style="width: 50px;padding: 10px;">
	                        <form action="add">
	                        	<input type="hidden" name="oldquantity" value="${cart.quantity}" />
	                        	<input type="hidden" name="productid" value="${cart.productid}" />
	                        	<input type="hidden" name="qoh" value="${cart.QOH}" />
	                        	<input type="hidden" name="userid" value="${userid}" />
	                          	<button type="submit" id="add${count.count}" style="color:black;background:transparent;border:1px solid rgba(0,0,0,.125);border-radius:2px;width:30px;">+</button>
	                          	<script>      	   	
		                         		var qoh2 = ${cart.QOH};
		                         		
		                         		if(qoh2 == 0){
			                         		document.getElementById("add${count.count}").disabled = true;
			                         	}else{
			                         		document.getElementById("add${count.count}").disabled = false;
			                         	}
	                         	</script>
	                         </form>
	                         <form action="minus">
	                        	<input type="hidden" name="oldquantity" value="${cart.quantity}" />
	                        	<input type="hidden" name="productid" value="${cart.productid}" />
	                        	<input type="hidden" name="qoh" value="${cart.QOH}" />
	                        	<input type="hidden" name="userid" value="${userid}" />
	                          	<button type="submit" id="minusd${count.count}" style="color:black;background:transparent;border:1px solid rgba(0,0,0,.125);border-radius:2px;width:30px;">-</button>
	                          	<script>      	   	
		                         		var qoh = ${cart.quantity};
		                         		
		                         		if(qoh == 1){
			                         		document.getElementById("minusd${count.count}").disabled = true;
			                         	}else{
			                         		document.getElementById("minusd${count.count}").disabled = false;
			                         	}
	                         	</script>
	                          </form>
                        	</div>
                       
                         <c:set var = "sumofqua" value ="${cart.pprice * cart.quantity}" />
                        <div style="width: 80px;">
                          <h5 class="mb-0"><td>P ${sumofqua}&nbsp;</td></h5>
                        </div>
                        <input type="hidden" name="quantity[]" value="${cart.quantity}" />
                        <a href="deleteViewCart/${cart.cartid}?userid=${userid}&productid=${cart.productid}&quantity=${cart.quantity}" style="color: #cecece;"><i class="fas fa-trash-alt" style="color:red;"></i></a>
                        
                     		
                      </div>
                    </div>
                  </div>
                </div>
            
             </tr>
                   
          		<c:set var="total" value="${sumofqua + total}" />
             </c:forEach> 
           </div>     		 

                    </div>
                    <div class="col-lg-5">
      
                      <div class="card bg-primary text-white rounded-3">
                        <div class="card-body">
                          <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="mb-0">Card details</h5>
                          </div>
      
                          <p class="small mb-2">Card type</p>
                          <a href="#!" type="submit" class="text-white"><i
                              class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                          <a href="#!" type="submit" class="text-white"><i
                              class="fab fa-cc-visa fa-2x me-2"></i></a>
                          <a href="#!" type="submit" class="text-white"><i
                              class="fab fa-cc-amex fa-2x me-2"></i></a>
                          <a href="#!" type="submit" class="text-white"><i class="fab fa-cc-paypal fa-2x"></i></a>
      
                          <form class="mt-4" action="insertpayment">
                            <div class="form-outline form-white mb-4">
                              <input type="text" id="typeName" class="form-control form-control-lg" size="17"
                                placeholder="Cardholder's Name" required name="cHolderName"/>
                              <label class="form-label" for="typeName">Cardholder's Name</label>
                               <label id="lblmess"class="form-label" for="typeName"></label>
                            </div>
      
                            <div class="form-outline form-white mb-4">
                              <input type="text" id="typeText" class="form-control form-control-lg" size="17"
                                placeholder="1234 5678 9012 3457" minlength="19" maxlength="19" name ="cardNum" required onkeypress="return/[0-9]/i.test(event.key)" />
                              <label class="form-label" for="typeText">Card Number</label>
                            </div>
      
                            <div class="row mb-4">
                              <div class="col-md-6">
                                <div class="form-outline form-white">
                                  <input type="text" id="typeExp" class="form-control form-control-lg"
                                    placeholder="YYYY/MM/DD" size="7" id="exp" minlength="10" maxlength="12" name="cardExp" />
                                  <label class="form-label" for="typeExp">Expiration</label>
                                </div>
                              </div>
                              
                              <div class="col-md-6">
                                <div class="form-outline form-white">
                                  <input type="password" id="typeText" class="form-control form-control-lg"
                                    placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" name="cvv" />
                                  <label class="form-label" for="typeText">Cvv</label>
                               </div>
                              </div>
                              <br />
                              <br />
                              <br />
                               <div class="col-md-6">
                                <div class="form-outline form-white">
	                                <select  id="ddselect" class="form-control form-control-lg" onchange = "getddl()" style="border:1px solid white" >
	                                	<option value = "0" selected="true" style="font-color: black">Coupon Discount</option>
	                              	 <c:forEach var="coupon" items="${allcoupon}">
	                              	 	<option style="color:black;padding:20px;" value ="${coupon.discount}">${coupon.eventname}</option>	
	                              	 </c:forEach>
	                              	 </select>
                               </div>
                              </div>
                            </div>
                       
                          <hr class="my-4">
                          <div class="d-flex justify-content-between">
                            <p class="mb-2">Subtotal</p>
                            <p class="mb-2">P ${total}</p>
                          </div>
                          <div class="d-flex justify-content-between">
                            <p class="mb-2">Coupon Discount</p>
                            <label class="mb-2" id="discount">P 0</label>
                          </div>
                          <input type="hidden" value ="" name = "tBillAmount" id="totalinput" />
						  <input type="hidden" value ="" name = "totalDiscount" id="discountinput" />
						  <input type="hidden" value ="${userid}" name = "userid" />
						  
                          <button type="submit" class="btn btn-info btn-block btn-lg">
                            <div class="d-flex justify-content-between">
                              <span id="total">P ${total}</span>
                              <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                            </div>
                          </button>
                         </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
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
                            <p>Starts: <% out.println(month_name); %></p>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <!-- Coupon Card-->
                <div class="ongoing">
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
                            <p>Starts: <% out.println(month_name); %></p>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                
            </div>
      </div>
    </div>

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

    <script>
    	function getddl()
    	{    	
    		var discountCoupon = document.getElementById("ddselect").value;
    		var temp = discountCoupon / 100;
    		var times = ${total} * temp;
    		var  totalprice = ${total} - times;
    		//var  = ${total - CouponPercent};
    		document.getElementById("total").innerHTML = "P " + totalprice;
    		document.getElementById("discount").innerHTML = "P " + times;
    		document.getElementById("discountinput").value = times;
    		document.getElementById("totalinput").value = totalprice;
    		
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
</body>

</html>
