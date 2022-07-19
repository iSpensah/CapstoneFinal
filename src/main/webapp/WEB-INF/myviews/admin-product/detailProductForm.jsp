<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  	<title>View Product</title>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Material Icon -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- CSS Link -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<!-- Boxicons CDN Link -->
<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
	<div class="sidebar">
		<div class="logo-details">
       		 <img class='bx bxs-store-alt' src="<c:url value="/resources/images/Logo.png"/>" width="50" height="50" style="margin-left:5px;">
       		 <span class="logo_name" style="margin-left:5px;">GamePating</span>
      	</div>
		<ul class="nav-links">
			<li><a href="../../admin-overview"> <i
					class='bx bx-home icon'></i> <span class="links_name">Dashboard</span>
			</a></li>
			<li><a href="../../admin-category"> <i
					class='bx bx-category-alt icon'></i> <span class="links_name">Category</span>
			</a></li>
			<li><a href="../../admin-product" class="active"> <i
					class='bx bx-basket icon'></i> <span class="links_name">Product</span>
			</a></li>
			<li><a href="../../admin-coupon"> <i
					class="bx bxs-coupon icon"></i> <span class="links_name">Coupon</span>
			</a></li>
			<li><a href="../../admin-event"> <i
					class='bx bx-calendar-event icon'></i> <span class="links_name">Event</span>
			</a></li>
			<li class="log_out"><a href="../../admin"> <i class="bx bx-log-out"></i>
					<span class="links_name">Log out</span>
			</a></li>
		</ul>
	</div>
	<section class="home-section">
		<nav>
        <div class="sidebar-button">
          <i class="bx bx-menu sidebarBtn"></i>
          <span class="dashboard">Product Management</span>
        </div>
        <div class="profile-details">
          <span class="admin_name">DevBuggers</span>
          <img src="<c:url value="/resources/images/coco.jpg"/>" alt="" />
        </div>
      </nav>

		<div class="home-content">

			<div class="container home p-5">
				<h2>Product Detail</h2>
				<div id="form" style="font-size:18px">
					<div>
						<div style="display: flex;">
								<img
									src="${pageContext.request.contextPath}/resources/images/${product.imageProduct}"
									alt="${product.pname}"
									style="object-fit: cover; width: 50%; height: 300px;">
							<div style="margin-left:20px">
							<table>
								<tr><td style="width:200px;">Product ID:</td><td>${product.pid}</td></tr>
								<tr><td>Category Name:</td><td>${product.categoryName}</td></tr>
								<tr><td>Price:</td><td>${product.pprice}</td></tr>
								<tr><td>Sales:</td><td>${product.psalesNum}</td></tr>
								<tr><td>Stock:</td><td>${product.pstock}</td></tr>
								<tr><td>Product Name:</td><td>${product.pname}</td></tr>
								<tr><td>Manufacturer:</td><td>${product.pcompany}</td></tr>
							</table>

							</div>
						</div>
						<div style="width: 100%;">


							<div style="width: 100%;">
								<div>
									Description:
									<p>${product.pdescription}</p>
								</div>
							</div>

						</div>
					</div>
					<a type="button" href="../../admin-product"
						class="btn btn-secondary btn-lg btn-block mt-2">Exit</a>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	let sidebar = document.querySelector(".sidebar");
	let sidebarBtn = document.querySelector(".sidebarBtn");
	sidebarBtn.onclick = function() {
		sidebar.classList.toggle("active");
		if (sidebar.classList.contains("active")) {
			sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
		} else
			sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
	};
</script>
</html>
