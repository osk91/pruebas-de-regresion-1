package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import beans.GrupoBean;
import beans.UtilBean;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;
import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class Asistente
 */
@WebServlet("/Asistente")
public class Asistente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Asistente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao categoria_dao = dao.getUtilDao();
			Vector<UtilBean> listautiles = categoria_dao.seleccionarTodas();
			Vector<GrupoBean> listagrupo = categoria_dao.seleccionarListaGrupos();
			request.setAttribute("listagrupo", listagrupo);
			request.setAttribute("listautiles", listautiles);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/asistente_principal.jsp");
			rd.forward(request, response);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int filas =0 ;

		PrintWriter out = response.getWriter();
		try {
				
				String[] idutiles1= request.getParameterValues("checkutil");
				String grado = request.getParameter("cb_grado");
				Integer[] idutiles = null ;
				/*for(int i=0;i<idutiles1.length;i++){
					int aux;
					aux = Integer.parseInt(idutiles1[i]);
					idutiles[i]=aux;
					
				}
				
				*/
				int code_grado = 99999;

				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				//ResultSet rs = stmt.executeQuery("SELECT id from grado where nomgrado='Inicial'");
				ResultSet rs = stmt.executeQuery("select id from grado where nomgrado='"+grado+"'");
				while(rs.next()){
					code_grado = rs.getInt("id");
					System.out.print(code_grado);


				}
				
				
				
				//String consulta = "insert into lista_grado values(2,1,'Kinder')";
				//int rs2 = stmt.executeUpdate(consulta);
				
				
				String consulta="";
				for(int i=0;i<idutiles1.length;i++){
					int codeutil= Integer.parseInt(idutiles1[i]);
					consulta = "insert into lista_grado values("+code_grado+","+codeutil+",'"+grado+"')";
					 //consulta = "insert into lista_grado values("+code_grado+",1,'none')";
					
					int rs2 = stmt.executeUpdate(consulta);
					filas = rs2;
				}

				
				
				
				//String consulta = "insert into lista_grado values("+code_grado+",1,'none')";

				
				String mensaje="";
				mensaje = ""+grado;
				
				if(filas!=0){
					if(filas==1){
						
						mensaje = "Se agregaron los utiles al "+mensaje;
						request.setAttribute("mensaje", mensaje);
						RequestDispatcher rd = 
								getServletContext().getRequestDispatcher("/resultado_asistente.jsp");
						rd.forward(request, response);
						
					}
						
						mensaje =  "utiles ya existen en "+mensaje;
						
						request.setAttribute("mensaje", mensaje);
						RequestDispatcher rd = 
								getServletContext().getRequestDispatcher("/resultado_asistente.jsp");
						rd.forward(request, response);
						
						
					
				}
				
				
				
				
				
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
