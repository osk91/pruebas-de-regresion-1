package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class AsistenteEliminar
 */
@WebServlet("/AsistenteEliminar")
public class AsistenteEliminar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsistenteEliminar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			if(request.getParameter("dato")!=null){
				
				String codigo = request.getParameter("codigo");
				String codigo_grupo = request.getParameter("grado");
				
				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				
				String consulta2 = "select id from grado where nomgrado='"+codigo_grupo+"'";
				ResultSet rs3 = stmt.executeQuery(consulta2);
				int codigo_grupo2=0;

				while(rs3.next()){
					codigo_grupo2 = rs3.getInt("id");
				}
				
				
				String consulta = "delete from lista_grado where grado_id="+codigo_grupo2+" and util_id="+codigo;
				int fila = stmt.executeUpdate(consulta);
				
				if(fila==1){
					request.setAttribute("mensaje", "Objeto Eliminado de la lista");
					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/resultado_asistente.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("mensaje", "Ocurrio un error");

					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/resultado_asistente.jsp");
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
		
		
		
	}

}
