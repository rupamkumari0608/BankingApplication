<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body, html {
	height: 100%;
}
body {
	background-image:url("https://image.freepik.com/free-vector/banking-business-banner-finance-savings-bank-building-silhouette-city-background_48369-11853.jpg");
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
.heading {
	color: #26558b;
	font-size: 90px;
}
a.button1{
	color: #26558b;
	font-size: 35px;
	background-color: white;
    border-color:  #26558b;
}

display {
	font-size: 80px;
	margin-bottom: 15px;
}
div {
	position: fixed;
	top: 20%;
	left: 6%;
	line-height: 90px;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<h1 class="heading">Banking Management Application</h1>
		<a class="btn button1" href="<%=request.getContextPath()%>/list">Users</a>
	</div>


</body>
</html>