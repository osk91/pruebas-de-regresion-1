<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UtilBean"%>
<%@page import="beans.GrupoBean" %>
<%@page import="beans.AlumnoBean" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Secretaria</title>
<style type="text/css">
.class1 {font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.class2 {font-family: Arial, Helvetica, sans-serif;
}
body {
	background-color: #143C60;
}
</style>
</head>

<body>

<%
Vector<AlumnoBean> alumnolista = new Vector();
Vector<GrupoBean> vectorgrupo = new Vector();


if( request.getAttribute("vector_a") != null){
	 alumnolista = (Vector)request.getAttribute("vector_a");
	 vectorgrupo = (Vector)request.getAttribute("vectorgrupo");
}


%>

<form id="form1" name="form1" method="post" action="Alumno">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="397" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA SECRETARIA<br />
      Buscar Alumnos</p></td>
      <td width="93" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="145" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="4"><fieldset>
        <p class="class2">
          <legend>Seleccione una opcion </legend>
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="38%">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td align="right"><input type="button" name="button3" id="button3" value="Registro de alumnos"  onclick= 					"window.location='/Proy_colegio/secretaria_reg_alumnos1.jsp'"/></td>
            <td width="20%"><input type="button" name="button2" id="button2" value="Verificacion de lista" onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></td>
            <td width="42%" align="left" valign="middle"><input type="button" name="input" value="Registrar utiles"  onclick=								 					"window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
                <tr>
                  <th colspan="5" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th width="34%" class="class2" scope="col">Apellido Alumno</th>
                        <th width="38%" scope="col"><input type="text" name="txt_codigo" id="textfield" /></th>
                        <th width="14%" scope="col"><input type="submit" name="button5" id="button5" value="Buscar" /></th>
                        <th width="14%" scope="col"><input type="submit" name="button6" id="button6" value="Agregar" onclick="window.location='/Proy_colegio/AgregarAlumno'"/></th>
                      </tr>
                    </table>
                      <label for="textfield"></label></th>
                  <th colspan="4" align="left" scope="col"><input type="submit" name="button4" id="button4" value="Volver" /></th>
                </tr>
                <tr>
                  <th colspan="9" scope="col">&nbsp;</th>
                </tr>
                <tr class="class2">
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Nombres</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Apellidos</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Grado</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Estado</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Apoderado</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Correo</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Eliminar</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Modificar</th>
                  <th nowrap="nowrap" bgcolor="#0099CC" scope="col">Ver Datos</th>
                </tr>
                <%for(int i=0;i<alumnolista.size();i++){ %>
                <tr>
                  <td nowrap="nowrap"><%=alumnolista.get(i).getNombre() %></td>
                  <td nowrap="nowrap"><%=alumnolista.get(i).getApellido() %></td>
                  <td nowrap="nowrap"><%=vectorgrupo.get(0).getDescripcion() %></td>
                  <td nowrap="nowrap"><%=alumnolista.get(i).getEstado() %></td>
                  <td nowrap="nowrap"><%=alumnolista.get(i).getApoderado() %></td>
                  <td nowrap="nowrap"><%=alumnolista.get(i).getCorreo() %></td>
                  <td nowrap="nowrap"><a href="ModificarAlumno?accion=eliminar&dato=<%=alumnolista.get(i).getId()%>">eliminar</a></td>
                  <td nowrap="nowrap"><a href="ModificarAlumno?accion=editar&dato=<%=alumnolista.get(i).getId()%>">modificar</a></td>
                  <td nowrap="nowrap"><a href="ModificarAlumno?accion=detalle&dato=<%=alumnolista.get(i).getId()%>">datos</a></td>
                </tr>
                <%} %>
              </table>
              <br /></td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </fieldset></td>
    </tr>
    <tr>
      <td colspan="4" align="right">Todos los derechos reservados</td>
    </tr>
  </table>
</form>
</body>
</html>