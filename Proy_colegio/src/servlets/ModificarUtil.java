package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UtilBean;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;
import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class ModificarUtil
 */
@WebServlet("/ModificarUtil")
public class ModificarUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUtil() {
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
			
			if(request.getParameter("accion") != null){
				if(request.getParameter("accion").equals("editar")){
					String util = request.getParameter("codigo");
					
					DaoFactory factoria = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
					UtilDao dao = factoria.getUtilDao();
					UtilBean utilaux
							= dao.seleccionarPorId(Integer.parseInt(util));
					
					request.setAttribute("utilaux", utilaux);
					RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/admin_util_mod.jsp");
					rd.forward(request, response);
				}	
				
				
				
				
				
				else if(request.getParameter("accion").equals("eliminar")){
					String util2 = request.getParameter("codigo");
					Connection conexion = MySqlDaoFactory.obtenerConexion();
					Statement stmt = conexion.createStatement();
					int codigo = Integer.parseInt(util2);
					String consulta = "delete from util where id="+codigo;
					
					int update1 = stmt.executeUpdate(consulta);
					
					if(update1==1){
						request.setAttribute("mensaje", "producto eliminado");
					}else{
						request.setAttribute("mensaje", "ocurrio un error");
					}
					
					
					RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_admin.jsp");
					rd.forward(request, response);
					
				}
				
			}else{
				
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
			int codutil = Integer.parseInt(request.getParameter("txt_codigo"));
			//String nombregrupo = request.getParameter("cb_grupo");
			String detalletipo = request.getParameter("cb_detalletipo");
			String nombreutil = request.getParameter("txt_nombre");
			String cantidad =  request.getParameter("txt_cantidad");
			String tipo = request.getParameter("txt_tipo");
			Connection conexion = MySqlDaoFactory.obtenerConexion();
			Statement stmt = conexion.createStatement();
			
			String consulta = "update util set nombre='"+nombreutil+"',tipo='"+tipo+"',detipo='"+detalletipo+"',cantidad='"+
			cantidad+"' where id="+codutil;
			
			int filas = stmt.executeUpdate(consulta);
			
			if(filas==1){
				request.setAttribute("mensaje", "Util Actualizado");
				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_admin.jsp");
					rd.forward(request, response);
			}else{
				request.setAttribute("mensaje", "Util Actualizado");

				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/resultado_admin.jsp");
					rd.forward(request, response);
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
