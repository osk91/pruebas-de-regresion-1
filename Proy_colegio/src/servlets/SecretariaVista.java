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

import beans.UtilAlumnoBean;

/**
 * Servlet implementation class SecretariaVista
 */
@WebServlet("/SecretariaVista")
public class SecretariaVista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecretariaVista() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			System.out.print("entrando a post");
			String codigoalumno = request.getParameter("txt_codigo");
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			String consulta = "select * from t_util_alumno where id_alumno="+codigoalumno;
			ResultSet rs = stmt.executeQuery(consulta);
			System.out.print("entrando a 1");

			Vector<UtilAlumnoBean> util_alum = new Vector<>();
			UtilAlumnoBean util = null;
			while(rs.next()){
				util = new UtilAlumnoBean();
				util.setId_util(rs.getInt("id_util"));
				util.setId_alumno(rs.getInt("id_alumno"));
				util.setNom_util(rs.getString("nom_util"));
				util.setTipo_util(rs.getString("tipo_util"));
				util.setDet_util(rs.getString("det_util"));
				util.setCant_util(rs.getString("cant_util"));
				util.setReg_util(rs.getString("reg_util"));
						
				util_alum.add(util);
			}
			System.out.print("entrando a 2");

			request.setAttribute("util_alum", util_alum);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/secretaria_ve.jsp");
			rd.forward(request, response);
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
