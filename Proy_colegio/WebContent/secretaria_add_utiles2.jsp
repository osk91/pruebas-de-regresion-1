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
<title>Documento sin título</title>
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
Vector<UtilBean> lista= new Vector();
Vector<GrupoBean> listagrupo= new Vector();
Vector<UtilBean> idsel = new Vector();
Vector<UtilBean> grado_sel = new Vector();
String codigo =  "";

if( request.getAttribute("listautiles") != null){
	 lista = (Vector)request.getAttribute("listautiles");
	listagrupo = (Vector)request.getAttribute("listagrupo");
	 idsel = (Vector)request.getAttribute("idsel");
	grado_sel = (Vector)request.getAttribute("grado_sel")	 ;
	codigo = (String)request.getAttribute("codigo");
	 
}


%>
<form id="form1" name="form1" method="post" action="ListaAlumnoAgregar">
  <table width="639" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="397" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA SECRETARIA<br />
        Registro de utiles entregados por alumnos</p></td>
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
            <td width="20%" align="left"><input type="button" name="button2" id="button2" value="Verificacion de lista" onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></td>
            <td width="42%" align="left" valign="middle"><input type="button" name="input" value="Registrar utiles"  onclick=								 					"window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
           
           
           
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
              <tr>
                <th colspan="5" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>                  </tr>
                </table>
                  <label for="textfield"></label></th>
                <th width="2%" colspan="2" >&nbsp;</th>
              </tr>
              <tr>
                <th colspan="7" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="22%">Alumno</td>
                    <td width="18%">Grado</td>
                                        <td width="30%" align="left"><input type="submit" value="Registrar"/>
                                        <input type="button" value="Volver" onclick="window.location='/Proy_colegio/secretaria_add_utiles.jsp'"/></td>
                          <td width="3%"><input type="hidden" name="txt_code_alumno" value="<%=codigo%>"/></td>
                                                       <td width="27%">&nbsp;</td>
                  </tr>
                </table></th>
              </tr>
              <tr>
                <th align="center" nowrap="nowrap" scope="col" >Nombre Util </th>
                <th align="center" nowrap="nowrap" scope="col">Tipo</th>
                <th align="center" nowrap="nowrap" scope="col">Detalle_tipo</th>
                <th align="center" nowrap="nowrap" scope="col">Cantidad</th>
                <th colspan="3" align="center" nowrap="nowrap" scope="col">Entregado</th>
                </tr>
              
             <%for(int i=0;i<lista.size();i++){ %>

		<% for(int j=0;j<idsel.size();j++){ %>

				<%if(lista.get(i).getCodigo()==idsel.get(j).getCodigo()){ %>
				<input type="hidden" name="txt_code_util" value="<%=lista.get(i).getCodigo() %>"/>
				<input type="hidden" name="txt_nombre" value="<%=lista.get(i).getNombre() %>"/>
				<input type="hidden" name="txt_tipo" value="<%=lista.get(i).getTipo() %>"/> 
				<input type="hidden" name="txt_detipo" value="<%=lista.get(i).getDetalletipo() %>"/>
				<input type="hidden" name="txt_cantidad" value="<%=lista.get(i).getCantidad() %>"/>
				
           	   <tr>
                <td width="30%" align="center" nowrap="nowrap" ><%=lista.get(i).getNombre() %>  </td>
                <td width="12%" align="center" nowrap="nowrap" ><%=lista.get(i).getTipo() %> </td>
                <td width="16%" align="center" nowrap="nowrap" ><%=lista.get(i).getDetalletipo() %>  </td>
                <td width="18%" align="center" nowrap="nowrap" ><%=lista.get(i).getCantidad() %>  </td>
                <td colspan="3" align="center" nowrap="nowrap" ><label for="textfield2"></label>
                  <input type="text" name="txt_recogido" id="textfield2" /></td>
                </tr>
             
              <%} %>
      
      
		<%} %>
	
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