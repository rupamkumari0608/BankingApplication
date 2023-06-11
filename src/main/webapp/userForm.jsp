<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Holder Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style>
body, html {
  height: 100%;
}
body {
	background-image: url("https://image.freepik.com/free-vector/banking-business-banner-finance-savings-bank-building-silhouette-city-background_48369-11853.jpg");
	 background-position: center ;
	background-repeat: no-repeat;
    background-size: cover;
}

</style>
<body>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-header text-white bg-info mb-3" >Open A New Bank Account</div>
			<div class="card-body">

				<form action="insert" method="post">
					<div class="form-group">
						<label style="font-weight: bold">Full Name</label> <input class="form-control" type="text"
							name="name" required />
					</div>
					<div class="form-group">
						<label style="font-weight: bold">Account Number</label> <input class="form-control"
							type="text" name="accountId" required/>
					</div>
					<div class="form-group">
						<label style="font-weight: bold">Bank Type</label> 
						<select class="form-control" name="bankType" >
							 <option value="HDFC">HDFC</option>
							  <option value="SBI">SBI</option>
							</select>
					</div>
					<div class="form-group">
						<label style="font-weight: bold">Amount</label> <input class="form-control" type="text"
							name="amount" required/>
					</div>

					<input class="btn btn-success" type="submit" value="Submit" /> <a
						class="btn btn-danger" href="close">Close</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>