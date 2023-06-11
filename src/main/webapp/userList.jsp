<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking Management system</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body, html {
	height: 100%;
}

body {
	background-image:
		url("https://image.freepik.com/free-vector/banking-business-banner-finance-savings-bank-building-silhouette-city-background_48369-11853.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: rgb(80, 146, 227)">
			<div>
				<a href="<%=request.getContextPath()%>" class="navbar-brand">
					Home</a>
			</div>
		</nav>
	</header>
	<br>

	<div class="row">
		<div class="container">
			<h1 class="text-center">List of Users</h1>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Open New Account</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>S.no.</th>
						<th>Name</th>
						<th>Bank Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%int i = 1;%>
					<c:forEach var="user" items="${listUser}">
						<tr>
							<td><%=i%> <%i++;%></td>
							<td><c:out value="${user.accountHolder}" /></td>
							<td><c:out value="${user.bankType}" /></td>
							<td><a href="details?id=<c:out value='${user.id}' />">View
									Details</a></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
		</div>
	</div>
</body>
</html>