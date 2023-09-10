<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registeration</title>
<%@include file="all_js_css.jsp" %>
<style>
body{
background-color: #fdf5e6;
}

.container{
width:38%;
border:1px solid black;
margin:auto;
padding:25px;
font-size:20px;
background-color: #cd853f;

}

#MyForm table tr td input{
font-size:20px;
}
table,td,th,tr{
text-align: center;}

</style>

</head>
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
			<li class="nav-item active"><a class="nav-link bg-success"
				href="Login.jsp">Login <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item"><a class="nav-link bg-light"
				href="index.jsp">HOME</a></li>

		</ul>
	</div>
</nav>
    <br><br>

<div class="container">

<h1 align="center"><font color="black">Register Here!</font></h1>

<form action="NewUserServlet" method="post">

<table>

<tr>
<td>Provide a Username</td>
<td><input type="text" name="uname" placeholder="Enter Here" required /></td>
</tr>

<tr>
<td>Set a Password</td>
<td><input type="password" name="pass" placeholder="Enter Here" required /></td>
</tr>

<tr>
<td>Confirm Password</td>
<td><input type="password" name="pass1" placeholder="Enter Here" required /></td>
</tr>

<tr>
<td><button type="submit" class="btn btn-success">SUBMIT</button></td>
<td><button type="submit" class="btn btn-danger">RESET</button></td>
</tr>

</table>

</form>



</body>
</html>