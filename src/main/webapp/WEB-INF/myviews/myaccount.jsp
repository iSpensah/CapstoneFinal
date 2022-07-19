<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>My Account</title>

	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<link rel="stylesheet" href="css/all.css">
   <style>
      body {
         background-color: #000000;
         overflow-x: hidden;
      }
      .container {
         background: white;
         width: 540px;
         height: 450px;
         margin: 0 auto;
         position: relative;
         margin-top: 10%;
         box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.5);
      }
      .leftbox {
         float: left;
         top: -5%;
         left: -10%;
         position: absolute;
         width: 15%;
         height: 110%;
         background: #00008B;
         box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.5);
         border: .1em solid #fff;
      }
      nav a {
         list-style: none;
         padding: 30px;
         color: #fff;
         font-size: 1.2em;
         display: block;
         transition: all .3s ease-in-out;
      }
      nav a:hover {
         color: #ffffff;
         cursor: pointer;
         transform: scale(1.4);
      }
      nav a:first-child {
         margin-top: 7px;
      }
      nav a.active {
         color: #2b185b;
      }
      .rightbox {
         width: 60%;
         margin-left: 27%;
         
      }
      .tabShow {
         transition: all .5s ease-in;
         width: 80%;
      }
      h1 {
         font-family: sans-serif;
         color: black;
         font-size: 1.2rem;
         margin-top: 40px;
         margin-bottom: 35px;
      }
      h2 {
         color: black;
         font-family: sans-serif;
         text-transform: uppercase;
         font-size: 8px;
         letter-spacing: 1px;
         margin-left: 2px;
         margin-top: 10px;
      }
      .input, p {
         border: 0;
         border-bottom: 1px solid #DC143C;
         width: 80%;
         font-family: sans-serif;
         font-size: .7em;
         padding: 7px 0;
         color: #000000;
         text-align: center;
         outline: none;
      }
      span {
         font-size: .7em;
         color: #777;
      }
      .btn {
         font-family: monospace;
         text-transform: uppercase;
         font-size: 15px;
         border: 0;
         color: #fff;
         background: #00008B;
         padding: 7px 15px;
         box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.2);
         cursor: pointer;
         margin-top: 15px;
      }
      .tabShow:not(:target) {
      	 display: none;
	  }
	  .tabShow, .tabshow2{
	  	margin-left: 80px;
	  }
          
   </style> 
</head>
<body>

   <div class="container">
      <div class="leftbox">
      <nav>
      	  <c:forEach var="user" items="${allcustomers}"> 
      	 <a href="user-dashboard?userid=${user.userid}"><i class="fa fa-home" aria-hidden="true"></i></a>
      	 </c:forEach>
         <a href="#tab1" class=""><i class="fa fa-user"></i></a>
         <a href="#tab2"><i class="fa fa-credit-card"></i></a>
         <a href="#tab3"><i class="fa fa-envelope"></i></a>
         <a href="#tab5"><i class="fa fa-cog"></i></a>
      </nav>
      </div>
      <span class="rightbox">
      <section id="tab1" class="tabShow">
      	<form><c:forEach var="user" items="${allcustomers}"> 
         <h1>Personal Information</h1>
         <h2>First Name</h2>
         <p class="input">${user.firstname}</p>
         <h2>Last Name</h2>
         <p class="input">${user.lastname}</p>
         <h2>E-mail</h2>
         <p class="input">${user.email}</p>
         <h2>Phone Number</h2>
         <p class="input">${user.contact}</p>
         <h2>Gender</h2>
         <p class="input">${user.gender}</p>
      	</c:forEach></form>         
      </section> <section id="tab2" class="tabShow">
         <h1>Card Information</h1>
         <h2>Payment Method</h2>
         <p class="input">MasterCard - 0101 **** **** 0789</p>
         <h2>Bank Account</h2>
         <p class="input">BDO Debit Card</p>
         <h2>E-payment</h2>
         <p class="input">GCash</p>
      </section>
      
      <section id="tab3" class="tabShow">
      	<form><c:forEach var="user" items="${allcustomers}"> 
         <h1>Billing Address</h1>
         <h2>Address</h2>
         <p class="input">${user.address}</p>
        </c:forEach></form>
      </section>
      
      <section id="tab5" class="tabShow">
      	<form action="updateUserPass">
      	<c:forEach var="user" items="${allcustomers}">
         <h1>Account Settings</h1>
         <h2>Old Password</h2>
         <c:set var="oldpass" value="${user.userpass}" />
         <input type="password" class="input" name="old_pword" id="old" placeholder="Enter Old Password" required onkeyup="oldpassword()"> 
         <h2 id="errormsg2"></h2>
         <h2>New Password</h2>
         <input type="password" class="input" name="new_pword" id="new" placeholder="Enter New Password" onkeyup="password123()" required>
         <h2>Verify New Password</h2>
         <input type="password" class="input" name="confirm_pword" id="confirm" placeholder="Verify New Password" onkeyup="password123()" required>
         <h2 id="errormsg"></h2>
         <input type="submit" id="submit" class="btn" value="Update" >
        </c:forEach></form>
      </section>
   </span>
		<%-- <table border="2" style="color: white;">
			<tr>
				<th>ID</th>
				<th>email</th>
				<th>password</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Address</th>
				<th>Contact No.</th>
			</tr>
				<c:forEach var="customer" items="${allcustomers}">  
				<tr>
					<td onclick="asd()">${customer.userid}</td>
					<td>${customer.email}</td>
					<td>${customer.userpass}</td>
					<td>${customer.firstname}</td>
					<td>${customer.lastname}</td>
					<td>${customer.gender}</td>
					<td>${customer.address}</td>
					<td>${customer.contact}</td>			
				</tr>
				</c:forEach> 	
		</table> --%>
   </div>
 
     
  	<script>
  	
	let params = new URLSearchParams(location.search);
	let updated = params.get('updated');
	
	if(updated == 1){
		Swal.fire(
				  'Great!',
				  'Password changed successfully!',
				  'success'
				)
	}
 		
	function password123(){	
	    var pass = document.getElementById('new').value;
	    var confirm = document.getElementById('confirm').value;
	    
	    if(pass != "" || confirm != ""){
       	 if (pass != confirm) {
            	document.getElementById('errormsg').style.color = 'red';
                document.getElementById('errormsg').innerHTML =  '*Password do not match!';
                document.getElementById('submit').disabled = true;
            	document.getElementById('submit').style.opacity = "0.7";
            }else{
            	document.getElementById('errormsg').style.color = 'green';
            	document.getElementById('errormsg').innerHTML =  '*Password matched!';
            	document.getElementById('submit').disabled = false;
            	document.getElementById('submit').style.opacity = "1";
            }
       }else
       	 document.getElementById('errormsg').innerHTML =  '';
 
	}
	
	function oldpassword(){	
	    var old = document.getElementById('old').value;
	    var oldpassdb = "${oldpass}";
	    console.log(oldpassdb);
	    
	    if(old != ""){
       	 if (old != oldpassdb) {
            	document.getElementById('errormsg2').style.color = 'red';
                document.getElementById('errormsg2').innerHTML =  '*Old password incorrect!';
                document.getElementById('submit').disabled = true;
            	document.getElementById('submit').style.opacity = "0.7";
            }else{
            	document.getElementById('errormsg2').style.color = 'green';
            	document.getElementById('errormsg2').innerHTML =  '*Old password correct!';
            	document.getElementById('submit').disabled = false;
            	document.getElementById('submit').style.opacity = "1";
            }
       }else
       	 document.getElementById('errormsg').innerHTML =  '';
 
	}
	
	</script>
</body>
</html>