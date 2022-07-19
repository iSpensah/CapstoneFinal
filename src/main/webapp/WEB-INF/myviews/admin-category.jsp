<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Category</title>
	<link rel = "icon" href = "resources/assets/Logo.png" type = "image/x-icon">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!--  Swal -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">

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
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></style>
     
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
    
  </head>
  <body>
   <script>
	let params = new URLSearchParams(location.search);
	let event = params.get('event');
	let remove = params.get('remove');
	let edit = params.get('edit');
	
	if(event == 1){
		Swal.fire(
				  'Added!',
				  'Successfully generated new category.',
				  'success'
				)
	}
	
	if(remove == 1){
		Swal.fire(
				  'Deleted!',
				  'The category has been successfully deleted.',
				  'success'
				)
	}
	
	if(edit == 1){
		Swal.fire(
				  'Updated!',
				  'The category has been successfully updated.',
				  'success'
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
          <a href="admin-overview">
            <i class='bx bx-home icon'></i>
            <span class="links_name">Dashboard</span>
          </a>
        </li>
        <li>
            <a href="admin-category" class="active">
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
          <span class="dashboard">Category Management</span>
        </div>
        <div class="profile-details">
          <span class="admin_name">DevBuggers</span>
          <img src="<c:url value="/resources/images/coco.jpg"/>" alt="" />
        </div>
      </nav>

      <div class="home-content">

        <div class="home">
          <div class="header">
            <a class="btn btn-primary mb-1 mt-3 shadow-sm" href="admin-category/addNewCategoryForm" role="button">Add New Category</a>
    
			<div class="search-box mb-1 mt-3 shadow-sm">
              <input id="searchBox" class="searchbtn" type="text" placeholder="Search by Category Name or ID">
              <i class='bx bx-search' style="top: 50%;"></i>
            </div>
          </div>
    
          <div class="product-manage">
            <table class="table table-striped table-bordered shadow-sm" id="myTable">
              <thead class="thead">
                <tr>
                  <th style="width:100px;" scope ="col">ID</th>
                  <th style="width:230px;" scope ="col">Category Name</th>
                  <th scope ="col">Category Description</th>
                  <th  style="width: 110px;" scope ="col">Action</th>
              </tr>
              </thead>
              <tbody class="tablebody">
					<c:forEach var="category" items="${allcategory}">  
					<tr>
						<td>${category.categoryId}</td>
						<td>${category.categoryName}</td>
						<td>${category.categoryDesc}</td>
						
						
						<td>
							<a class="edit btn btn-info" style="width: 50px; height: 40px;" href="admin-category/editCategoryForm/${category.categoryId}"><i class="material-icons">edit</i></a>
							<span class="delete btn btn-danger" style="width: 50px; height: 40px;" id="${category.categoryId}" onclick="javascript:swapContents(this);"><i class="material-icons">delete</i></span>				
						
						<script>
						
							function swapContents(el){
								var category = el.id;
								const swalWithBootstrapButtons = Swal.mixin({
									  customClass: {
									    confirmButton: 'btn btn-success',
									    cancelButton: 'btn btn-danger'
									  },
									  buttonsStyling: false
									})
				
									swalWithBootstrapButtons.fire({
									  title: 'Are you sure?',
									  text: "You won't be able to revert this!",
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonText: 'Yes, delete it!',
									  cancelButtonText: 'No, cancel!',
									  reverseButtons: true
									}).then((result) => {
									  if (result.isConfirmed) {
										  window.location.href = "deleteCategory/"+category;
									  } else if (
									    /* Read more about handling dismissals below */
									    result.dismiss === Swal.DismissReason.cancel
									  ) {
									    swalWithBootstrapButtons.fire(
									      'Cancelled',
									      'Category has not been deleted.',
									      'error'
									    )
									  }
									})
							}
							</script>	
						</td>
						
					</tr>
					</c:forEach> 
              </tbody>
            </table>
          </div>
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
    
    $(document).ready(function() {
        var table = $('#myTable').DataTable({
        	
        	"dom": 'rtip',
        	
        	columnDefs: [
        		{ searchable: true, targets: 0 },
        		{ searchable: true, targets: 1 },
        		{ searchable: false, targets: 2 },
        		{ searchable: false, targets: 3 },
        	    { orderable: true, targets: 0 },
        	    { orderable: true, targets: 1 },
        	    { orderable: false, targets: 2 },
        	    { orderable: false, targets: 3 },
        	    
        	  ],

        	
        });
        
        $('#searchBox').on( 'keyup', function () {
            table.search( this.value ).draw();
        } );
     
        table.buttons().container()
            .appendTo( '#example_wrapper .col-md-6:eq(0)' );
    } );
    
  </script>
  
  <script src="<c:url value="/resources/js/test.js"/>"></script>
  
</html>
