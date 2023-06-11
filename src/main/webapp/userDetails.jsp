<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Account Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
table {
	margin-left: auto;
	margin-right: auto;
	font-size: 15px;
	width: 100%;
	table-layout: fixed;
	
}

td {
	border: 1px solid #c1d9d0;
	text-align: center;
	padding: 10px;
}

.card-footer {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	margin-left: 250px;
	margin-right: 250px;
}
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

</head>
<body>
	<div class="container col-md-5">
		<div class="card " style="width: 150%">
			<div class="card-header text-white bg-info mb-3" >Bank Account Details</div>
			<div class="card-body">

				<form id="detailForm" action="details" method="post">
					<div style="color: #FF0000;">${errorMessage}</div>
					<table class="table table-striped">
						<tr>
							<td style="font-weight: bold">Full Name</td>
							<td><input type="text" name="name" readonly
								class="form-control-plaintext" value="${User.accountHolder}" /></td>
						</tr>
						<tr>
							<td style="font-weight: bold">Account Number</td>
							<td><input type="text" name="accountId" readonly
								class="form-control-plaintext" value="${User.accountID}" /></td>
						</tr>
						<tr>
							<td style="font-weight: bold">Bank Type</td>
							<td><input type="text" name="bankType" readonly
								class="form-control-plaintext" value="${User.bankType}" /></td>
						</tr>
						<tr>
							<td style="font-weight: bold">Amount</td>
							<td><input type="text" name="amount" readonly
								class="form-control-plaintext" value="${User.balance}" /></td>
						</tr>
					</table>

					<%-- <a class="button" href="deposit?id=${User.id}&amount=${User.balance}&newAmount=<%=request.getParameter("newAmount")%>" onclick="javascript:working()">Deposit Money</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<a class="button" href="withdraw?id=${User.id}&amount=${User.balance}" > WithDraw Money</a> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		 --%>
				</form>

				<form action="deposit" method="post">
					<div class="row justify-content-center">
						<input type="hidden" name="amount" value="${User.balance}">
						<input type="hidden" name="id" value="${User.id}"> <input
							type="text" name="newAmount"
							placeholder="Enter Amount to Deposit" required/> <input
							class="btn btn-success" type="submit" value="Deposit Amount" />
					</div>

				</form>
				<form action="withdraw" method="post">

					<div class="row justify-content-center">
						<input type="hidden" name="amount" value="${User.balance}">
						<input type="hidden" name="id" value="${User.id}"> <input
							type="text" name="newAmount"
							placeholder="Enter Amount to WithDraw" required /> <input
							class="btn btn-success" type="submit" value="Withdraw Amount" />
					</div>

				</form>
				<div class="card-footer ">
					<a class="btn btn-danger" href="close">Close</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>