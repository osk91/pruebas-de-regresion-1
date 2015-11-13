package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daofactory.MySqlDaoFactory;

import beans.AlumnoBean;
import beans.GrupoBean;

/**
 * Servlet implementation class ModificarAlumno
 */
@WebServlet("/ModificarAlumno")
public class ModificarAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarAlumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			if(request.getParameter("accion") != null){
				if(request.getParameter("accion").equals("editar")){
					String codigo = request.getParameter("dato");
					
					
					Connection con =  MySqlDaoFactory.obtenerConexion();
					Statement stmt = con.createStatement();
					
					String consulta = "select * from t_alumno where id="+codigo;
					//String consulta = "select * from t_alumno where id=1";
					
					
					ResultSet rs = stmt.executeQuery(consulta);
					AlumnoBean alumno = null;
					Vector<AlumnoBean> vector_a = new Vector<>();
					
					while(rs.next()){
						alumno = new AlumnoBean();
						alumno.setId(rs.getInt("id"));
						alumno.setNombre(rs.getString("nombre"));
						alumno.setApellido(rs.getString("apellidos"));
						alumno.setDni(rs.getString("dni"));
						alumno.setDireccion(rs.getString("direccion"));
						alumno.setCorreo(rs.getString("correo"));
						alumno.setFk_grado(rs.getInt("fk_grado"));
						alumno.setEstado(rs.getString("estado"));
						alumno.setApoderado(rs.getString("apoderado"));
						alumno.setTelefono(rs.getString("telefono"));
						alumno.setDistrito(rs.getString("distrito"));
						System.out.print(alumno.getId());
						vector_a.add(alumno);
					}
					
					String consulta2 = "select * from grado";
					ResultSet rs2= stmt.executeQuery(consulta2);
					GrupoBean grupo= null;
					Vector<GrupoBean> vectorgrupo = new Vector<>();
					
					while(rs2.next()){
						grupo = new GrupoBean();
						grupo.setCodegrupo(rs2.getInt("id"));
						grupo.setDescripcion(rs2.getString("nomgrado"));
						vectorgrupo.add(grupo);
						
					}
					
					request.setAttribute("vectorgrupo", vectorgrupo);

					request.setAttribute("vector_a", vector_a);
					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/mod_alumno.jsp");
					rd.forward(request, response);
					
					
					
					
				}else if(request.getParameter("accion").equals("eliminar")){
						String codigo = request.getParameter("dato");
					
					
						Connection con =  MySqlDaoFactory.obtenerConexion();
						Statement stmt = con.createStatement();
					
					String consulta4 = "delete from t_alumno where id="+codigo;

					int filas = stmt.executeUpdate(consulta4);
					
					if(filas==1){
						request.setAttribute("mensaje", "Registro de alumno eliminado");
						RequestDispatcher rd =
								getServletContext().getRequestDispatcher("/resultado_alumno_del.jsp");
							rd.forward(request, response);
					}else{
						request.setAttribute("mensaje", "Ocurrio un error volver a intentarlo");

						RequestDispatcher rd =
								getServletContext().getRequestDispatcher("/resultado_alumno_del.jsp");
							rd.forward(request, response);
					}
					
				}else if(request.getParameter("accion").equals("detalle")){
					
String codigo = request.getParameter("dato");
					
					
Connection con =  MySqlDaoFactory.obtenerConexion();
Statement stmt = con.createStatement();
					
					String consulta = "select * from t_alumno where id="+codigo;
					//String consulta = "select * from t_alumno where id=1";
					
					
					ResultSet rs = stmt.executeQuery(consulta);
					AlumnoBean alumno = null;
					Vector<AlumnoBean> vector_a = new Vector<>();
					
					while(rs.next()){
						alumno = new AlumnoBean();
						alumno.setId(rs.getInt("id"));
						alumno.setNombre(rs.getString("nombre"));
						alumno.setApellido(rs.getString("apellidos"));
						alumno.setDni(rs.getString("dni"));
						alumno.setDireccion(rs.getString("direccion"));
						alumno.setCorreo(rs.getString("correo"));
						alumno.setFk_grado(rs.getInt("fk_grado"));
						alumno.setEstado(rs.getString("estado"));
						alumno.setApoderado(rs.getString("apoderado"));
						alumno.setTelefono(rs.getString("telefono"));
						alumno.setDistrito(rs.getString("distrito"));
						System.out.print(alumno.getId());
						vector_a.add(alumno);
					}
					
					String consulta2 = "select * from grado where id="+vector_a.get(0).getFk_grado();
					ResultSet rs2= stmt.executeQuery(consulta2);
					GrupoBean grupo= null;
					Vector<GrupoBean> vectorgrupo = new Vector<>();
					
					while(rs2.next()){
						grupo = new GrupoBean();
						grupo.setCodegrupo(rs2.getInt("id"));
						grupo.setDescripcion(rs2.getString("nomgrado"));
						vectorgrupo.add(grupo);
						
					}
					
					request.setAttribute("vectorgrupo", vectorgrupo);

					request.setAttribute("vector_a", vector_a);
					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/detalle_alumno.jsp");
					rd.forward(request, response);
					
					
					
				}

				
				
			}

			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			String id= request.getParameter("txt_id");
			String nombre = request.getParameter("txt_nombre");
			String apellidos = request.getParameter("txt_apellido");
			String dni = request.getParameter("txt_dni");
			String direccion = request.getParameter("txt_direccion");
			String correo = request.getParameter("txt_correo");
			String apoderado = request.getParameter("txt_apoderado");
			String telefono = request.getParameter("txt_telefono");
			String distrito = request.getParameter("txt_distrito");
			String estado = request.getParameter("cb_estado");
			String nomgrado = request.getParameter("cb_grado");
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			String consulta2 = "select * from grado where nomgrado='"+nomgrado+"'";
			ResultSet rs2= stmt.executeQuery(consulta2);
			GrupoBean grupo= null;
			Vector<GrupoBean> g1 = new Vector<>();
			
			while(rs2.next()){
				grupo = new GrupoBean();
				grupo.setCodegrupo(rs2.getInt("id"));
				grupo.setDescripcion(rs2.getString("nomgrado"));
				g1.add(grupo);
				
			}
			
			int fk_grupo = g1.get(0).getCodegrupo();
			
			//String consulta3 = "update t_alumno set nombre='"+nombre+"', apellidos='"+apellidos+"', dni='"+dni+", direccion='"+direccion+"', correo='"+correo+"', fk_grado="
				//			+fk_grado+", estado='"+"Activo"+
					//	"', apoderado='"+apoderado+"', telefono='"+telefono+"', distrito='"+distrito+"' where id="+id;
			
			String consulta3 = "update t_alumno set nombre='"+nombre+"', apellidos='"+apellidos+"', dni='"+dni+"', direccion='"+direccion+"', " +
					"correo='"+correo+"', fk_grado="+fk_grupo+", " +
			"estado='"+estado+"', apoderado='"+apoderado+"', telefono='"+telefono+"', distrito='"+distrito+"' where id="+id;
			
			
			
			
			int filas = stmt.executeUpdate(consulta3);
			
			if(filas==1){
				request.setAttribute("mensaje", "Datos del Alumno Actualizado");
				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_alumno_mod.jsp");
					rd.forward(request, response);
			}else{
				request.setAttribute("mensaje", "No Actualizado");

				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_alumno_mod.jsp");
					rd.forward(request, response);
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
