<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Colegio Panamericano</title>
<link rel="stylesheet" type="text/css" href="css/style 2.css">
<style type="text/css">
body {
	background-color: #143C60;
}
</style>
</head>




<body>
<%
String mensaje = "";
if(request.getAttribute("mensaje")!=null){
	mensaje = (String)request.getAttribute("mensaje");
	
}


%>

<div class="container">
	<section id="content">
		<form action="Login" method="post">
			<h1>Colegio Panamericano</h1>
			<div>
				<input type="text" placeholder="Ingrese Usuario" required id="username" name="txtcuenta"/>
				
			</div>
			<div>
				<input type="password" placeholder="Ingrese Contraseña" required id="password" name="txtpassword"/>
			</div>
			<div>
				<input align="center" type="submit" value="Ingresar" />
				
			</div>
		</form><!-- form -->
		<div class="button"><%=mensaje %></div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
 <footer>
    <div class="container">
    	<div class="wrapper">
        <div class="fleft">
          <h5 class="left">Copyright - VirtualSolutions.com </h5>
        </div>
        <div class="fright">
          <h5>Todos los Derechos Reservados</h5>
          <h5>Direcci&oacute;n:Mz. I1 Lt.45 al 54 9na.Etapa -Urb. San Antonio de Carapongo - Lurigancho -Chosica <a href="index.jsp"><img src="img/home.png" width="31" height="30" class="right"><img src="img/icono-facebookbo.png" width="29" height="30" class="right"></a><a href="https://www.youtube.com/user/SchoolPanamericano" target="_blank"><img src="img/icono-youtube.png" width="31" height="30" class="right"></a><a href="https://accounts.google.com/AccountChooser?hd=panamericano.edu.pe&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&ss=1&ltmpl=default" target="_blank"><img src="img/gmail.png" width="31" height="30" class="right"></a></h5>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>