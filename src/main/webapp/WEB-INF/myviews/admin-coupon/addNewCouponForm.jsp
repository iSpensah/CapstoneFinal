<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Add New Coupon</title>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Material Icon -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    
    <!-- CSS Link -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    
    <!-- Boxicons CDN Link -->
    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  </head>
  <body>
    <div class="sidebar">
      <div class="logo-details">
        <img class='bx bxs-store-alt' src="<c:url value="/resources/images/Logo.png"/>" width="50" height="50" style="margin-left:5px;">
        <span class="logo_name" style="margin-left:5px;">GamePating</span>
      </div>
      <ul class="nav-links">
        <li>
          <a href="../admin-overview">
            <i class='bx bx-home icon'></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
            <a href="../admin-category">
                <i class='bx bx-category-alt icon'></i>
              <span class="links_name">Category</span>
            </a>
        </li>
        <li>
          <a href="../admin-product">
            <i class='bx bx-basket icon'></i>
            <span class="links_name">Product</span>
          </a>
        </li>
        <li>
          <a href="../admin-coupon" class="active">
            <i class="bx bxs-coupon icon"></i>
            <span class="links_name">Coupon</span>
          </a>
        </li>
        <li>
          <a href="../admin-event">
            <i class='bx bx-calendar-event icon'></i>
            <span class="links_name">Event</span>
          </a>
        </li>
        <li class="log_out">
          <a href="#">
            <i class="bx bx-log-out"></i>
            <span class="links_name">Log out</span>
          </a>
        </li>
      </ul>
    </div>
    <section class="home-section">
      <nav>
        <div class="sidebar-button">
          <i class="bx bx-menu sidebarBtn"></i>
          <span class="dashboard">Coupon Management</span>
        </div>
        <div class="profile-details">
          <span class="admin_name">DevBuggers</span>
          <img src="<c:url value="/resources/images/coco.jpg"/>" alt="" />
        </div>
      </nav>

      <div class="home-content">

        <div class="container home p-5">
          <h2>Add Coupon</h2>
          <p>Please enter the following ...</p>
          <form action="saveNewCoupon">
        <input type="text" class="form-control mt-2 pl-3" placeholder="Enter Coupon Name" required name="coupname">
        <input type="text" class="form-control mt-2 pl-3" placeholder="Enter Coupon Description" required name="coupdesc">
            <select class="custom-select" required name="pid">
				  <option>----Select Event category----</option>
            <c:forEach var="eventname" items="${allevents}">
					    <option value='${eventname.pid}'>${eventname.eventname}</option>
				    </c:forEach>
			  </select> 
        <input type="number" class="form-control mt-2 pl-3" placeholder="Enter Discount" required name="discount" min="1">
      	<input type="submit" value="Add Coupon" class="btn btn-primary btn-lg btn-block mt-2"/>
      </form>
      
      <a type="button" href="../admin-coupon" class="btn btn-secondary btn-lg btn-block mt-2">Cancel</a>
        </div>
      </div>
    </section>
  </body>

  <script>
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".sidebarBtn");
    sidebarBtn.onclick = function () {
      sidebar.classList.toggle("active");
      if (sidebar.classList.contains("active")) {
        sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
      } else sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
    };

    
  </script>
</html>
