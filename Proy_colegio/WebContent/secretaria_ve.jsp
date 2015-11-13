<%@page import="beans.UtilAlumnoBean"%>
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
Vector<UtilAlumnoBean> lista5 = new Vector();

if( request.getAttribute("util_alum") != null){
	 lista = (Vector)request.getAttribute("listautiles");
	listagrupo = (Vector)request.getAttribute("listagrupo");
	 idsel = (Vector)request.getAttribute("idsel");
	grado_sel = (Vector)request.getAttribute("grado_sel")	 ;
	codigo = (String)request.getAttribute("codigo");
	 lista5 = (Vector)request.getAttribute("util_alum");
}


%>

<form id="form1" name="form1" method="post" action="SecretariaVista">
  <table width="852" border="0" align="center" cellpadding="0" cellspacing="0" background="img/acuarela.jpg">
    <tr>
      <td width="474" rowspan="2" valign="top" class="class1"><p><img src="img/logo.jpg" width="71" height="70" />BIENVENIDA SECRETARIA<br />
        Registro de alumnos</p></td>
      <td width="111" rowspan="2">&nbsp;</td>
      <td width="5">&nbsp;</td>
      <td width="262" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
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
            <td width="15%" align="right"><input type="button" name="button2" id="button2" value="Verificacion de lista" onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></td>
            <td width="47%" align="left" valign="middle"><input type="button" name="input" value="Registrar utiles"  onclick=								 					"window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
         
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
              <tr>
                <th colspan="8" align="left" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th width="17%" class="class2" scope="col">Codigo Alumno</th>
                    <th width="17%" align="left" scope="col"><input type="text" name="txt_codigo" id="textfield" /></th>
                    <th width="6%" align="left" scope="col"><input type="submit" name="button5" id="button5" value="Buscar" /></th>
                    <th width="60%" align="left" scope="col"><input type="button" name="button4" id="button4" value="Volver" onclick="window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></th>
                  </tr>
                </table>                  <label for="textfield"></label></th>
                </tr>
              <tr>
                <th colspan="8" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Nombre Util</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Tipo</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Detalle_tipo</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Cantidad</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Entregado</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2"> Faltante</span></th>
                <th align="center" nowrap="nowrap" scope="col"><span class="class2">Estado</span></th>
                <th align="center" nowrap="nowrap" class="class2" scope="col">Modificar</th>
              </tr>
              <% for (int i=0;i<lista5.size();i++){ %>
              <tr>
                <td width="8%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getNom_util() %></span></td>
                <td width="4%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getTipo_util() %></span></td>
                <td width="11%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getDet_util() %></span></td>
                <td width="20%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getCant_util() %></span></td>
                <td width="18%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getReg_util() %></span></td>
                
                <%int cantidad = Integer.parseInt(lista5.get(i).getCant_util());%>
              <%  int entregado = Integer.parseInt(lista5.get(i).getReg_util()); %>
              <%  String mensaje =""; %>
              <% int faltante = cantidad - entregado; %>
              <%  if(cantidad>entregado){ %>
            	  <%  	mensaje = "Incompleto"; %>
            	  <%  }else{ %>
            		  <%  	mensaje = "Completo"; %>
            		  <%  } %>
                
                
               
                
                
                <td width="7%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=faltante %></span></td>
                <td width="7%" align="center" nowrap="nowrap" scope="col"><span class="class2"><%=mensaje %></span></td>
                <td width="8%" align="center" nowrap="nowrap" scope="col"><a href="ModificarRegUtil?dato=modificar&amp;codeutil=<%=lista5.get(i).getId_util()%>&amp;codealumno=<%=lista5.get(i).getId_alumno()%>">Modificar</a>
                </td>
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