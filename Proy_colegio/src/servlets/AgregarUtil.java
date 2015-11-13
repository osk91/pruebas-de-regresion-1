package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.CodingErrorAction;
import java.sql.Connection;
import java.sql.DriverManager;
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
import junit.*;


/**
 * Servlet implementation class AgregarUtil
 */
@WebServlet("/AgregarUtil")
public class AgregarUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarUtil() {
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
			
			
			
			
			
			request.setAttribute("listautiles", listautiles);
			request.setAttribute("listagrupo",listagrupo );
			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/admin_util_add.jsp");
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
		
		PrintWriter salida = response.getWriter();
		try {
			
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao categoria_dao = dao.getUtilDao();
			Vector<UtilBean> listautiles = categoria_dao.seleccionarTodas();
			//Vector<GrupoBean> listagrupo = categoria_dao.seleccionarListaGrupos();
			
			
			
			int codutil = Integer.parseInt(request.getParameter("txt_codigo"));
			//String nombregrupo = request.getParameter("cb_grupo");
			String detalletipo = request.getParameter("cb_detalletipo");
			String nombreutil = request.getParameter("txt_nombre");
			String cantidad =  request.getParameter("txt_cantidad");
			String tipo = request.getParameter("txt_tipo");
			
			
			System.out.print("aqui lo logro  "+tipo);

			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			String consulta= "insert into util values("+codutil+",'"+nombreutil+"','"+tipo+"','"+detalletipo+"','"+cantidad+"')";
			int resultado = stmt.executeUpdate(consulta);
			
			if(resultado==1){
				request.setAttribute("mensaje", "Util agregado");
			}else{
				request.setAttribute("mensaje", "ocurriò un error");
			}
			
			request.setAttribute("listautiles", listautiles);
			//request.setAttribute("listagrupo",listagrupo );
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/resultado_admin_add.jsp");
			rd.forward(request, response);
			
		//	RequestDispatcher rd = 
			//		getServletContext().getRequestDispatcher("/admin_util_add.jsp");
			//rd.forward(request, response);
			
		} catch (Exception e) {
			salida.print(e.getMessage());
		}
		
		
		
		
		
	}

}
