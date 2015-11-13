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
<title>Documento sin t�tulo</title>
<style type="text/css">
.class1 {font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 16px;
}
.class2 {font-family: Arial, Helvetica, sans-serif;
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

if( request.getAttribute("vectorua") != null){
	// lista = (Vector)request.getAttribute("listautiles");
	//listagrupo = (Vector)request.getAttribute("listagrupo");
	 //idsel = (Vector)request.getAttribute("idsel");
	//grado_sel = (Vector)request.getAttribute("grado_sel")	 ;
	//codigo = (String)request.getAttribute("codigo");
	 lista5 = (Vector)request.getAttribute("vectorua");
}


%>

<form id="form1" name="form1" method="post" action="ModificarRegUtil">
  <table width="852" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="474" rowspan="2" valign="top" class="class1"><p>BIENVENIDA SECRETARIA<br />
        Registro de alumnos</p></td>
      <td width="111" rowspan="2">&nbsp;</td>
      <td width="5">&nbsp;</td>
      <td width="262" valign="top" class="class2"><span class="class1"><a href="login.jsp">Logout</a></span></td>
    </tr>
    <tr>
      <td height="23">&nbsp;</td>
      <td><input type="button" name="button" id="button" value="Ayuda" />
        <input type="button" name="button4" id="button4" value="Volver" onclick="window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
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
            <td align="right"><input type="button" name="button3" id="button3" value="Registro de alumnos                                   "  /></td>
            <td width="36%" align="left"><input type="button" name="button2" id="button2" value="Verificacion de lista                                     " onclick="window.location='/Proy_colegio/secretaria_ve.jsp'"/></td>
            <td width="26%" align="left" valign="middle"><input type="button" name="input" value="Registrar utiles" onclick="window.location='/Proy_colegio/secretaria_add_utiles.jsp'" /></td>
          </tr>
          <tr>
            <td colspan="3"><table width="100%" border="1" cellspacing="0" cellpadding="0">
              <tr>
                <th colspan="5" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th width="34%" class="class2" scope="col">Codigo Alumno</th>
                    <th width="28%" scope="col"><input type="text" name="txt_codigo" id="textfield" /></th>
                    <th width="11%" align="left" scope="col"><input type="submit" name="button5" id="button5" value="Buscar" /></th>
                                        <th width="27%" align="left" scope="col"><input type="button" name="button5" id="button5" value="Correo" /></th>
                    
                  </tr>
                </table>
                  <label for="textfield"></label></th>
                <th colspan="4" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th colspan="9" scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th nowrap="nowrap" scope="col"><span class="class2">Nombre Util</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2">Tipo</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2">Detalle_tipo</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2">Cantidad</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2">Entregado</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2"> Faltante</span></th>
                <th nowrap="nowrap" scope="col"><span class="class2">Estado</span></th>
                <th nowrap="nowrap" class="class2" scope="col">Agregar</th>
                <th nowrap="nowrap" class="class2" scope="col">Modificar</th>
              </tr>
              <% for (int i=0;i<lista5.size();i++){ %>
              <tr>
                <td width="8%" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getNom_util() %></span></td>
                <td width="4%" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getTipo_util() %></span></td>
                <td width="11%" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getDet_util() %></span></td>
                <td width="20%" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getCant_util() %></span></td>
                <td width="18%" nowrap="nowrap" scope="col"><span class="class2"><%=lista5.get(i).getReg_util() %></span></td>
                
                <%int cantidad = Integer.parseInt(lista5.get(i).getCant_util());%>
              <%  int entregado = Integer.parseInt(lista5.get(i).getReg_util()); %>
              <%  String mensaje =""; %>
              <% int faltante = cantidad - entregado; %>
              <%  if(cantidad>entregado){ %>
            	  <%  	mensaje = "Incompleto"; %>
            	  <%  }else{ %>
            		  <%  	mensaje = "Completo"; %>
            		  <%  } %>
                
                
               
                
                
                <td width="7%" nowrap="nowrap" scope="col"><span class="class2"><%=faltante %></span></td>
                <td width="7%" nowrap="nowrap" scope="col"><span class="class2"><%=mensaje %></span></td>
                <td width="17%" nowrap="nowrap" scope="col"><label for="textfield2"></label>
              
                  <input type="text" name="txt_nuevo" id="txt_nuevo" value=""/></td>
                                     <input type="hidden" name="txt_codealumno" id="txt_nuevo" value="<%=lista5.get(i).getId_alumno()%>"/></td>
                                     <input type="hidden" name="txt_codeutil" id="txt_nuevo" value="<%=lista5.get(i).getId_util()%>"/></td>
                   
                  
                <td width="8%" nowrap="nowrap" scope="col"><input type="submit" name="button6" id="button6" value="Aceptar" /></td>
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