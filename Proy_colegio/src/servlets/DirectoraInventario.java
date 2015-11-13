package servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UtilAlumnoBean;
import beans.UtilBean;
import dao.ifaces.UtilAlumnoDao;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;

/**
 * Servlet implementation class DirectoraInventario
 */
@WebServlet("/DirectoraInventario")
public class DirectoraInventario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectoraInventario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao categoria_dao = dao.getUtilDao();
			
			Vector<UtilBean> listautiles = categoria_dao.seleccionarTodas();
			UtilAlumnoDao ua = dao.getUtilAlumnoDao();
			
			Vector<UtilAlumnoBean> listaua = ua.seleccionarTodos();
			
			request.setAttribute("listaua", listaua);

			request.setAttribute("listautiles", listautiles);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/directora_inventario.jsp");
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
	}

}
