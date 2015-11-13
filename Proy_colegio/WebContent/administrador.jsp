<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Bienvenido Administrador</title>
<link rel="stylesheet" type="text/css" href="file:///H|/SW1/Colegio Panamericano/css/table.css"/>
<script type="text/javascript" src="file:///H|/SW1/Colegio Panamericano/js/bootstrap.min.js"></script>
<script type="text/javascript" src="file:///H|/SW1/Colegio Panamericano/js/jquery.min.js"></script>
<script type="text/javascript" src="file:///H|/SW1/Colegio Panamericano/js/usuario.js"></script>
<link rel="stylesheet" type="text/css" href="css/EstiloGeneral.css"/>
<style type="text/css">
body,td,th {
	color: #000;
}
body {
	background-color: #143C60;
}
</style>
</head>
<form action="">
</form>
<body>
 <!--Título-->
 <h2 align="center" style="color:#FFF"> <strong>Bienvenido Administrador</strong></h2> 
 <!--Contenedor-->
 <div id="container">
  <!--Pestaña 1 activa por defecto-->
  <input id="tab-1" type="radio" name="tab-group" checked="checked" />
  <label for="tab-1"> Administración de Usuarios </label>
  <!--Pestaña 2 inactiva por defecto-->
  <input id="tab-2" type="radio" name="tab-group" />
  <label for="tab-2">  Administración de Utiles </label>
  
  
  <!--Contenido a mostrar/ocultar-->
<div id="content">
   <!--Contenido de la Pestaña 1-->
   <div id="content-1">
    
    <table  border="0">
         <tr>
      		<td width="100">Desde<center><input type='date' value='FECHA'/> </center></td>
      		<td width="140"><input type='submit' value='BUSCAR' style='background:url("imagen.gif");' /></td>   
      		<td width="140"></td>
            <td width="140"></td>
           <td width="140"></td>
      		<td><p align="right"><button><img src="img/Ayuda.png" width="34" height="34" /></button></td>
           
            
            
            
      </tr>
         
         <tr>
      		
 
		   <td>Hasta <center><input type='date' value='FECHA'/> </center></td>
            
           <td><center><input type='submit' value='ACTUALIZAR' style='background:url("imagen.gif");' /> </center></td> 
                          
   		   	<td><center><input type='submit' value='VER PERFIL' style='background:url("imagen.gif");' /> </center></td>
              
      		<td><center><input type='submit' value='MODIFICAR' style='background:url("imagen.gif");' /> </center></td>
              
  			<td><center><input type='submit' value='ELIMINAR' style='background:url("imagen.gif");' /></center></td>
   
   			<td><center><input type='submit' value='CREAR' style='background:url("imagen.gif");' /></center></td>             
      </tr>
            
      		<td>&nbsp;</td>
         
         
          <tr>
      		<td ></td>
      		<td>&nbsp;</td>
      		<td>&nbsp;</td>
      		<td>&nbsp;</td>
      		<td>&nbsp;</td>
         </tr>
         
           
         
         <tr>
         	<td height="20"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
         </tr>
         
         <tr>
     	    <td></td>
         
         
     	 <tr>
     	   <td></td>
         <tr>
   	       <td></td>
        <tr>
 	       <td></td>
 	       <td colspan="5">&nbsp;</td>
        </tr>
           </tr>
           </tr>
           </tr>
     </table>
<table>
<td><a href="login.jsp" >Cerrar Sesión</a></td></tr></table>
   
  </div>
   <!--Contenido de la Pestaña 2-->
  <div id="content-2">
     <table  border="0" >
        <tr>
      		<td width="240"></td>
      		<td width="240"> </td>    
      		<td width="240"></td>   
      		<td width="240"></td>
      		<td><button><img src="img/Ayuda.png" width="34" height="34" /></button></td>
        </tr>
            
         <tr>
         	<td height="20"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
         </tr>
         
         

         
     	 <tr>
     	   <td></td>
         <tr>
   	       <td></td>
        <tr>
 	       <td></td>
 	       <td colspan="5">&nbsp;</td>
     </table>

     
<table>
<td><a href="login.jsp" >Cerrar Sesión</a></td></tr></table>

    
  </div>
</div>
</body>
</html>
