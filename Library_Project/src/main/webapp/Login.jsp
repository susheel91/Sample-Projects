<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | LOGIN</title>
<%@include file="all_js_css.jsp" %>
<style>
body {
	background-color: #fdf5e6;
}

.container {
	width: 35%;
	border: 1px solid black;
	margin: auto;
	padding: 25px;
	font-size: 20px;
	background-color: #cd853f;
}

#MyForm table tr td input {
	font-size: 20px;
}

table, td, th, tr {
	text-align: center;
}
</style>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light brown">
	<a class="navbar-brand" href="index.jsp"><b><u></u></b></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse p-0 m-0" id="navbarSupportedContent">
	<img alt="" src="img/lib.jpg" style="width:100px" class="img-fluid p-0 m-0">
	</div>
	<div class="text-right p-0 m-0">
	<ul class="navbar-nav mr-auto">                 
			<li class="nav-item active"><a class="btn btn-outline-dark my-2 my-sm-0"
				href="index.jsp">HOME <span class="sr-only"></span></a>
			</li>
			</ul>
			</div>
			</nav>
			<br><br>
	

	<div class="container text-center">

		<h1 align="center">
			<font color="black">Login Here!</font>
		</h1><br>

		<form action="LoginServlet" method="post">

			<table>

				<tr>
					<td align="left">User Name</td>
					<td align="center"><input type="text" name="username" placeholder="Enter Here" required/></td>
				</tr>

				<tr>
					<td align="left">Password</td>
					<td align="center"><input type="password" name="password" placeholder="Enter Here" required/></td>
				</tr>


			</table><br>
			<button type="submit" class="btn btn-success">LOGIN</button>

		</form>

	</div>

</body>
</html>