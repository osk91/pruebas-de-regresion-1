package servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.UtilBean;

import dao.ifaces.LoginDao;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;

/**
 * Servlet implementation class BuscarUtil
 */
@WebServlet("/BuscarUtil")
public class BuscarUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuscarUtil() {
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
			String nombre = request.getParameter("txt_buscar");
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao utildao = dao.getUtilDao();
			Vector<UtilBean> vutil = new Vector<>();
			vutil = utildao.buscarutil(nombre);
			
			
			request.setAttribute("listautiles", vutil);
			RequestDispatcher rd =
					getServletContext().getRequestDispatcher("/admin_utiles_buscar.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
