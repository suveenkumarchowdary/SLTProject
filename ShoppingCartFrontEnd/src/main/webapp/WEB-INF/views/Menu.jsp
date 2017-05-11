<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" id="my-navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a href="Home" class="navbar-brand">
					<img src="<c:url value="/resources/images/logo.png"/>" style="max-height: 50px; margin-top: -15px;" alt="logo" />
				</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${isUserLoggedIn=='true'}"> 
						<!--<c:url var="Logout" value="/j_spring_security_Logout"/>--> 
						<li><a href="myCart"><i class="fa fa-shopping-cart" aria-hidden="true"></i> My Cart <span class="label label-warning">${cartSize}</span></a></li>
						<li><a href="secure_logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out </a></li>

					</c:if>
					<c:if test="${isAdmin=='true'}">
						<li><a href="<c:url value="secure_logout" />"><i class="fa fa-sign-out" aria-hidden="true"></i> Sign Out </a></li>

					</c:if>
					<c:if test="${!isUserLoggedIn=='true' && !isAdmin =='true'}">
						<li><a href="RegistrationPage"><i class="fa fa-user-plus" aria-hidden="true"></i> SignUp </a></li>
						<li><a href="Login"><i class="fa fa-sign-in" aria-hidden="true"></i> Login </a></li>
					</c:if>


				</ul>



				<ul class="nav navbar-nav">

					<!-- Dropdown of category -->


					<c:forEach var="category" items="${categoryList}">
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">${category.name}
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu scrollable-menu" role="menu">
								<c:forEach var="product" items="${productList}">
									<c:if test="${product.category_id == category.id}">
										<li><a href="#">${product.name}</a></li>
									</c:if>

									<!-- <li><a href="#">${product.name}</a></li> -->
								</c:forEach>


							</ul></li>
					</c:forEach>

					<%-- Toggle Product--%>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
							All Products <span class="caret"></span>
						</a>
						<ul class="dropdown-menu scrollable-menu">

							<c:forEach var="product" items="${productList}">
								<li><a href="#">${product.name}</a></li>

							</c:forEach>
						</ul></li>
					<%----%>

					<li><a href="ContactUs"> Contact Us </a></li>

				</ul>
			</div>
		</div>
	</nav>




</body>
</html>
