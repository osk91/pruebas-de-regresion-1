<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Bienvenido Asistente</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="../css/table.css"/>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/usuario.js"></script>
<link rel="stylesheet" type="text/css" href="css/EstiloGeneral.css"/>
</head>
<form action="">
</form>
<body>
 <!--Título-->
 <h1> Bienvenido Asistente </h1> 
 <!--Contenedor-->
 <div id="container">
  <!--Pestaña 1 activa por defecto-->
  <input id="tab-1" type="radio" name="tab-group" checked="checked" />
  <label for="tab-1"> Utiles </label>
  <!--Pestaña 2 inactiva por defecto-->
  <input id="tab-2" type="radio" name="tab-group" />
  <label for="tab-2">  Lista de Utiles </label>
  
  <input id="tab-3" type="radio" name="tab-group" />
  <label for="tab-3">  Asignar </label>  
  
  
  
  <!--Contenido a mostrar/ocultar-->
  <div id="content">
   <!--Contenido de la Pestaña 1-->
   <div id="content-1">
 
    
    
    <table  border="0">
         <tr>
      		<td width="100"></td>
      		<td width="140"> </td>    
      		<td width="140"></td>   
      		<td width="140"></td>
            <td width="140"></td>
            <td width="140"></td>
      		<td><p align="right"><button><img src="../img/Ayuda.png" width="34" height="34" /></button></td>
         </tr>
         
         <tr>
      		<td><center><select name="Grupo">
      		  <option value = "Seleccione Grupo">Grupo</option></select></center></td>
            
      		<td><center><select name="Utiles">
      		  <option value = "Seleccione utiles">Utiles</option></select></center></td>
 
 <td><center><select name="Tipo">
      		  <option value = "Seleccione Tipo">Tipo</option></select></center></td> 
                          
      		<td><center><select name="Cantidad">
      		  <option value = "Seleccione Cantidad">Cantidad</option></select></center></td>
              
      	<td><center><select name="Detalle">
      		  <option value = "Seleccione Detalle">Detalle</option></select></center></td>
              
              <td><center><button> <img src="../img/Agregar2.png" width="120" height="30" /></button></td>
         </tr>
            
      		<td>&nbsp;</td>
         </tr>
         
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
            <table class="table table-striped table-bordered">
    	<thead>
			<tr>
	            <th>Grupo</th>
                <th>Nombre</th>
	            <th>Tipo</th>
	            <th>Cantidad</th>
                <th>Detalle</th>
	        </tr>
		</thead>
        <tbody>
	        <tr>
	            <td>Aseo</td>
	            <td>Toalla</td>
	            <td>Baño</td>
	            <td>1</td>
                <td>Unidad(s)</td>
	           
	        </tr>
	        <tr>
	            <td>Aseo</td>
	            <td>Jabon de Tocador</td>
	            <td>Baño</td>
                <td>2</td>
                <td>Unidad(s)</td>
	            
	        </tr>
	        <tr>
	            <td>Aseo</td>
	            <td>Peine</td>
	            <td>Baño</td>
                <td>1</td>
                <td>Unidad (s)</td>
	            
	        </tr>
        </tbody>
	</table>
            
        </tr>
         
         
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
<tr><td> <a href="../login.jsp">Cerrar Sesión</a></td></tr>
</table>
   
   </div>
   <!--Contenido de la Pestaña 2-->
   <div id="content-2">
     <table  border="0" >
        <tr>
      		<td width="240"></td>
      		<td width="240"> </td>    
      		<td width="240"></td>   
      		<td width="240"></td>
      		<td><p align="right"><button><img src="../img/Ayuda.png" width="34" height="34" /></button></td>
        </tr>
            
         <tr>
         	<td height="20"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
         </tr>
         
         <table class="table table-striped table-bordered">
    	<thead>
			<tr>
	            <th>Grupo</th>
	            <th>Nombre</th>
	            <th>Tipo</th>
	            <th>Cantidad</th>
	            <th>Detalle</th>
	            <th>OPCIONES</th>
	        </tr>
		</thead>
        <tbody>
	        <tr>
	           <td>Aseo</td>
	            <td>Toalla</td>
	            <td>Baño</td>
	            <td>1</td>
                <td>Unidad(s)</td>
	            
					<td>
					<button class="editar glyphicon glyphicon-pencil" title="Editar" data-toggle="modal" data-target="#editarModal"></button>
	                <button class="eliminar glyphicon glyphicon-remove" title="Eliminar"></button>            
	            </td>
	        </tr>
	        <tr>
	              <td>Aseo</td>
	            <td>Jabon de Tocador</td>
	            <td>Baño</td>
                <td>2</td>
                <td>Unidad(s)</td>
	            <td>
					
					<button class="editar glyphicon glyphicon-pencil" title="Editar" data-toggle="modal" data-target="#editarModal"></button>
	                <button class="eliminar glyphicon glyphicon-remove" title="Eliminar"></button>            
	            </td>
	        </tr>
	        <tr>
	             <td>Aseo</td>
	            <td>Peine</td>
	            <td>Baño</td>
                <td>1</td>
                <td>Unidad (s)</td>
	            <td>
					
					<button class="editar glyphicon glyphicon-pencil" title="Editar" data-toggle="modal" data-target="#editarModal"></button>
	                <button class="eliminar glyphicon glyphicon-remove" title="Eliminar"></button>            
	            </td>
	        </tr>
        </tbody>
	</table>


	<div class="modal fade" id="nuevoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">NUEVO USUARIO</h4>
				</div>
				<div class="modal-body">
					
				</div>
				<div class="modal-footer">
					<button id="u_nuevo_guardar"type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button id="u_nuevo_cancelar"type="button" class="btn btn-primary">Guardar</button>
				</div>
			</div>	
		</div>
	</div>
	<div class="modal fade" id="detalleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">DETALLE USUARIO</h4>
				</div>
				<div id="contenidoDetalle" class="modal-body">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Salir</button>
				</div>
			</div>	
		</div>
	</div>
	<div class="modal fade" id="editarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">EDITAR USUARIO</h4>
				</div>
				<div id="contenidoEditar" class="modal-body">
					
				</div>
				<div class="modal-footer">
					<button id="u_nuevo_guardar"type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button id="u_nuevo_cancelar"type="button" class="btn btn-primary">Guardar</button>
				</div>
			</div>	
		</div>
	</div>

         
     	 <tr>
     	   <td></td>
         <tr>
   	       <td></td>
        <tr>
 	       <td></td>
 	       <td colspan="5">&nbsp;</td>
      </table>

     
<table>
<tr><td><a href="../login.jsp"> Cerrar Sesión</a></td></tr>
</table>

    
   </div>
   <!--Contenido de la Pestaña 3-->
   <div id="content-3">
   
   <table border="0">
     	 
        <tr>
      		<td width="240"></td>
      		<td width="240"> </td>    
      		<td width="240"></td>   
      		<td width="240"></td>
      		<td width="240"></td>
      		<td><p align="right"><button><img src="../img/Ayuda.png" width="34" height="34" /></button></td>
        </tr>
         
          <tr>
      		<td colspan="2"><center><select name="grupos">
      		  <option value = "Seleccione grupo">grupos</option>
              <option value = "Kinder">Kinder</option>
              <option value = "Primaria">Primaria</option>
              <option value = "Segundaria">Segundaria</option></select></center> </td>
   
   <td colspan="1"><center><select name="Nivel">
   <option value = "Seleccione Nivel">Nivel</option></select></center></td>
               
    <td><center><button> <img src="../img/Agregar2.png" width="120" height="30" /></button></td>
        		
   		 </tr>
          <tr>
         	<td height="20"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
           
         </tr>
         
         <table class="table table-striped table-bordered">
    	<thead>
			<tr>
	            <th>Cantidad</th>
	            <th>Descripción</th>
	            <th>OPCIONES</th>
	        </tr>
		</thead>
        <tbody>
	        <tr>
	            <td>1</td>
	            <td>Toalla</td>
	            <td><input name="Agregar" type="checkbox" value="" /></td>
	            
	           
	        </tr>
	        <tr>
	            <td>2</td>
	            <td>Jabon de Tocador</td>
	            <td><input name="Agregar" type="checkbox" value="" /></td>
	            
	        </tr>
	        <tr>
	            <td>1</td>
	            <td>Peine</td>
	            <td><input name="Agregar" type="checkbox" value="" /></td>
	            
	        </tr>
        </tbody>
	</table>
         
         
     	 <tr>
     	   <td></td>
         <tr>
   	       <td></td>
        <tr>
 	       <td></td>
 	       <td colspan="5">&nbsp;</td>
      </table>
     <table>
<tr><td><a href="../login.jsp">Cerrar Sesión</a></td></tr>
</table>
   </div>
  </div>
  
</div>
</body>
</html>
