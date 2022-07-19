<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  	<title>Dashboard</title>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <meta charset="UTF-8" />

	<!--  Swal -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	
    <!-- Bootstrap -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" />
    <!-- Boxicons CDN Link -->
    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></style>
     
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
  </head>
  <body>
  <script>
	let params = new URLSearchParams(location.search);
	let login = params.get('login');
	let violation = params.get('violation');
	
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
	
	if(violation == 1){
		Swal.fire(
				  'Oopps!',
				  'Unable to deleted selected event.',
				  'error'
				)
	}
	
  </script>
    <div class="sidebar">
      <div class="logo-details">
        <img class='bx bxs-store-alt' src="<c:url value="/resources/images/Logo.png"/>" width="50" height="50" style="margin-left:5px;">
        <span class="logo_name" style="margin-left:5px;">GamePating</span>
      </div>
      <ul class="nav-links">
        <li>
          <a href="admin-overview" class="active">
            <i class='bx bx-home icon'></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
            <a href="admin-category">
                <i class='bx bx-category-alt icon'></i>
              <span class="links_name">Category</span>
            </a>
        </li>
        <li>
          <a href="admin-product">
            <i class='bx bx-basket icon'></i>
            <span class="links_name">Product</span>
          </a>
        </li>
        <li>
          <a href="admin-coupon">
            <i class="bx bxs-coupon icon"></i>
            <span class="links_name">Coupon</span>
          </a>
        </li>
        <li>
          <a href="admin-event">
            <i class='bx bx-calendar-event icon'></i>
            <span class="links_name">Event</span>
          </a>
        </li>
        <li class="log_out">
          <a href="admin?logout=1">
            <i class="bx bx-log-out icon"></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
    </div>
    <section class="home-section">
      <nav>
        <div class="sidebar-button">
          <i class="bx bx-menu sidebarBtn"></i>
          <span class="dashboard">Overview</span>
        </div>
        <!-- <div class="search-box">
        <input type="text" placeholder="Search...">
        <i class='bx bx-search' ></i>
      </div> -->
        <div class="profile-details">
          <span class="admin_name">DevBuggers</span>
          <img src="<c:url value="/resources/images/coco.jpg"/>" alt="" />
        </div>
      </nav>

      <div class="home-content">
        <div class="summary">
          <div class="card shadow">
            <div class="container">
              <div class="row">
                <div class="col-8">
                  <h3>${totalproducts}</h3>
                  <h5>Number of Products</h5>
                </div>
                <div class="col-4">
                  <i class='bx bx-basket icon'></i>
                </div>
              </div>
            </div>
          </div>
          <div class="card shadow">
            <div class="container">
              <div class="row">
                <div class="col-8">
                  <h3>${totalcoupons}</h3>
                  <h5>Number of Coupons</h5>
                </div>
                <div class="col-4">
                  <i class="bx bxs-coupon icon"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="card shadow">
            <div class="container">
              <div class="row">
                <div class="col-8">
                  <h3>${totalevents}</h3>
                  <h5>Number of Events</h5>
                </div>
                <div class="col-4">
                  <i class='bx bx-calendar-event icon'></i>
                </div>
              </div>
            </div>
          </div>
        </div>
				
        <div class="product-summary">
        
        <div class="p-3" style="display: flex; justify-content: space-between;  background-color: #343A40; width:auto; color: #fff;">
              <div style="display: flex;">
                <i class='bx bx-basket' style="font-size: 24px; padding-right: 1rem;"></i>
                <h5>Product Inventory</h5>
              </div>
              <h6 class="mr-3 mt-1"><a href="admin-product" style="color: #fff;">View</a></h6>
            </div>
          <table class="table table-striped table-bordered shadow-sm h-25 w-100" id="productData">
            
            <thead class="thead">
                <tr>
                    <th scope="col">Img</th>              
                    <th scope="col">Product Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">CompanyName</th>
                    <th scope="col">Stock</th>
                </tr>
              </thead>
            <tbody class="tablebody">
            <c:forEach var="product" items="${allproduct}">  
					<tr>
						<td class="text-center"><img height="40" width="30" src="${pageContext.request.contextPath}/resources/images/${product.imageDashboard}"></td>
                        <td><a href="admin-product/moreProductDetails/${product.pid}"  style="color:black;" >${product.pname}</a></td>
                        <td>${product.categoryName}</td>
                        <td>
                    		&#8369;<fmt:formatNumber type="number" pattern="##,###.##" value="${product.pprice}" />
         				</td>
                        <td>${product.pcompany}</td>
                        <td>${product.pstock}</td>
					</tr>
					</c:forEach> 
            </tbody>
          </table>
        </div>

        <div class="coupon-event-sum">
          <div class="coupon-summary">
          <div class="p-3" style="display: flex; justify-content: space-between;  background-color: #343A40; width:auto; color: #fff;">
              <div style="display: flex;">
                <i class='bx bxs-coupon' style="font-size: 24px; padding-right: 1rem;"></i>
                <h5>Coupon Inventory</h5>
              </div>
              <h6 class="mr-3 mt-1"><a href="admin-coupon" style="color: #fff;">View</a></h6>
            </div>
            <table class="table table-striped table-bordered shadow-sm" id="couponData">
              <thead class="thead">
                <tr>
                  <th scope="col">Coupon Name</th>
                  <th scope="col">Event Name</th>
                  <th scope="col">Discount</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="coupon" items="${allcoupons}">  
                  <tr>
                    <td>${coupon.coupname}</td>
                    <td>${coupon.eventname}</td>
                    <td>${coupon.discount}%</td>						
		</tr>
		</c:forEach> 
              </tbody>
            </table>
          </div>
          <div class="event-summary">
          <div class="p-3" style="display: flex; justify-content: space-between;  background-color: #343A40; width:auto; color: #fff;">
              <div style="display: flex;">
                <i class='bx bx-calendar-event' style="font-size: 24px; padding-right: 1rem;"></i>
                <h5>Event Inventory</h5>
              </div>
              <h6 class="mr-3 mt-1"><a href="admin-event" style="color: #fff;">View</a></h6>
            </div>
            <table class="table table-striped table-bordered shadow-sm" id="eventData">
              <thead class="thead">
                <tr>
                  <th scope ="col" >EventName</th>
                  <th scope ="col" >Start Date</th>
                  <th scope ="col" >End Date</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="event" items="${allevents}">  
		<tr>
			<td>${event.eventname}</td>
			<td>${event.eventstartdate}</td>
			<td>${event.eventenddate}</td>
								
		</tr>
		</c:forEach> 
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>

    <script>
      let sidebar = document.querySelector(".sidebar");
      let sidebarBtn = document.querySelector(".sidebarBtn");
      sidebarBtn.onclick = function () {
        sidebar.classList.toggle("active");
        if (sidebar.classList.contains("active")) {
          sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
        } else sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
      };
      
      $(document).ready(function() {
          var table = $('#productData').DataTable({
        	  "pagingType": "simple",
        	  "ordering": false,
        	  "searching": false,
        	  "lengthChange": false,
        	  "pageLength" : 5,
        	  
        	  language: {
        		    paginate: {
        		      next: '<h4 style="width:20px; height:20px;">></h4>',
        		      previous: '<h4 style="width:20px; height:20px;"><</h4>'
        		    }
        		  }
          });
       
          table.buttons().container()
              .appendTo( '#example_wrapper .col-md-6:eq(0)' );
      } );
      
      $(document).ready(function() {
          var table = $('#couponData').DataTable({
        	  "pagingType": "simple",
        	  "ordering": false,
        	  "searching": false,
        	  "lengthChange": false,
        	  "pageLength" : 5,
        	  
        	  language: {
      		    paginate: {
      		      next: '<h4 style="width:20px; height:20px;">></h4>',
      		      previous: '<h4 style="width:20px; height:20px;"><</h4>'
      		    }
      		  }
          });
       
          table.buttons().container()
              .appendTo( '#example_wrapper .col-md-6:eq(0)' );
      } );
      
      $(document).ready(function() {
          var table = $('#eventData').DataTable({
        	  "pagingType": "simple",
        	  "ordering": false,
        	  "searching": false,
        	  "lengthChange": false,
        	  "pageLength" : 5,
        	  
        	  language: {
      		    paginate: {
      		      next: '<h4 style="width:20px; height:20px;">></h4>',
      		      previous: '<h4 style="width:20px; height:20px;"><</h4>'
      		    }
      		  }
          });
       
          table.buttons().container()
              .appendTo( '#example_wrapper .col-md-6:eq(0)' );
      } );
     
    </script>

  </body>
</html>
