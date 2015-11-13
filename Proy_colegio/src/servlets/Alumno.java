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

import beans.AlumnoBean;
import beans.GrupoBean;

import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class Alumno
 */
@WebServlet("/Alumno")
public class Alumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Alumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/secretaria_reg_alumnos1.jsp");
			rd.forward(request, response);
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
			
			String ape = request.getParameter("txt_codigo");
			//int code = Integer.parseInt(codigo);
			if(ape.equalsIgnoreCase("")){
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/secretaria_reg_alumnos1.jsp");
				rd.forward(request, response);
				
			}else{
			
				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
			
			String consulta = "select * from t_alumno where apellidos like '%"+ape+"%'";
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
					getServletContext().getRequestDispatcher("/secretaria_reg_alumnos2.jsp");
			rd.forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
