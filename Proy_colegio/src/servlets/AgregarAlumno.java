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

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

import daofactory.MySqlDaoFactory;

import beans.GrupoBean;

/**
 * Servlet implementation class AgregarAlumno
 */
@WebServlet("/AgregarAlumno")
public class AgregarAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarAlumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			
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
			System.out.print("funciona 1 ");
			ResultSet rs3 = stmt.executeQuery("select max(id) from t_alumno");
			int maxid=0;
			Vector<Integer> vcodigo = new Vector<>();
			while(rs3.next()){
				maxid = rs3.getInt("max(id)");
				maxid++;
				vcodigo.add(maxid);
			}
			
			System.out.print("funciona 2 "+maxid);

			request.setAttribute("vcodigo", vcodigo);
			request.setAttribute("vectorgrupo", vectorgrupo);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/reg_alumno.jsp");
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
			
			String consulta3 = "insert into t_alumno values("+id+",'"+nombre+"','"+apellidos+"','"+dni+"','"+direccion+"','"+correo+"',"+fk_grupo+"," +"'"+estado+"','"+apoderado+"','"+
			telefono+"','"+distrito+"')";
			
			
			int filas = stmt.executeUpdate(consulta3);
			
			if(filas==1){
				request.setAttribute("mensaje", "Alumno agregado");
				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_alumno_add.jsp");
					rd.forward(request, response);
			}else{
				request.setAttribute("mensaje", "Error en la operacion");

				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_alumno_add.jsp");
					rd.forward(request, response);
			}
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
