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
<title>Documento sin ttulo</title>
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


<form id="form1" name="form1" method="post" action="ModificarAlumno">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="397" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA SECRETARIA<br />
        Agregar Alumno
      </p></td>
      <td width="93" rowspan="2">&nbsp;</td>
      <td width="4">&nbsp;</td>
      <td width="145" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td><input type="button" name="button4" id="button4" value="Volver" onclick="window.location='/Proy_colegio/secretaria_reg_alumnos1.jsp'" /></td>
    </tr>
    <tr>
      <td colspan="4"><fieldset>
        <p class="class2">Ingrese los datos<br />
        </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><fieldset>
              <legend class="class2">Datos Personales</legend>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="23%" class="class2">Nombres</td>
                  <td width="77%"><label for="textfield"></label>
                                      <input type="hidden" name="txt_id" id="textfield" value="<%=alumnolista.get(0).getId() %>" />
                                      <input type="hidden" name="txt_fk_grado" id="textfield" value="<%=alumnolista.get(0).getFk_grado() %>" />
                  
                    <input type="text" name="txt_nombre" id="textfield" value="<%=alumnolista.get(0).getNombre() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Apellidos</td>
                  <td><label for="textfield2"></label>
                    <input type="text" name="txt_apellido" id="textfield2" value="<%=alumnolista.get(0).getApellido() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">DNI</td>
                  <td><label for="textfield3"></label>
                    <input type="text" name="txt_dni" id="textfield3" value="<%=alumnolista.get(0).getDni() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Direccion</td>
                  <td><label for="textfield4"></label>
                    <input type="text" name="txt_direccion" id="textfield4" value="<%=alumnolista.get(0).getDireccion() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Correo</td>
                  <td><label for="textfield5"></label>
                    <input type="text" name="txt_correo" id="textfield5" value="<%=alumnolista.get(0).getCorreo() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Apoderado</td>
                  <td><label for="textfield6"></label>
                    <input type="text" name="txt_apoderado" id="textfield6" value="<%=alumnolista.get(0).getApoderado() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Telefono</td>
                  <td><label for="textfield7"></label>
                    <input type="text" name="txt_telefono" id="textfield7" value="<%=alumnolista.get(0).getTelefono() %>" /></td>
                </tr>
                <tr>
                  <td class="class2">Distrito</td>
                  <td><label for="textfield8"></label>
                    <input type="text" name="txt_distrito" id="textfield8" value="<%=alumnolista.get(0).getDistrito() %>" /></td>
                </tr>
              </table>
              <br />
            </fieldset></td>
          </tr>
          <tr>
            <td><fieldset>
              <legend class="class2">Datos Academicos</legend>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="23%">Grado</td>
                  <td width="77%"><label for="select"></label>
                    <select name="cb_grado" id="select">
                    <%for(int i=0;i<vectorgrupo.size();i++){ %>
                      <option><%=vectorgrupo.get(i).getDescripcion() %></option>
                     <%} %> 
                      
                    </select></td>
                </tr>
                <tr>
                  <td>Estado</td>
                  <td><label for="select2"></label>
                    <select name="cb_estado" id="select2">
                      <option>Activo</option>
                      <option>Bloqueado</option>
                      <option>Suspendido</option>
                    </select></td>
                </tr>
              </table>
              <br />
            </fieldset></td>
          </tr>
        </table>
        <p class="class2">&nbsp;          </p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right"><input type="submit" name="button2" id="button2" value="Listo" /></td>
          </tr>
        </table>
        <p class="class2"><br />
        </p>
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