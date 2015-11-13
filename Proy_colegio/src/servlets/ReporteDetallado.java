package servlets;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.GrupoBean;
import beans.UtilAlumnoBean;
import beans.UtilBean;

import dao.ifaces.UtilAlumnoDao;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;

/**
 * Servlet implementation class ReporteDetallado
 */
@WebServlet("/ReporteDetallado")
public class ReporteDetallado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReporteDetallado() {
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
			UtilDao grupodao = dao.getUtilDao();
			Vector<GrupoBean> listagrupos = grupodao.seleccionarListaGrupos();
			

			
			request.setAttribute("listagrupos", listagrupos);
			String method = null;

			request.setAttribute("method", method);

			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/directora_utiles_detallado.jsp");
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
			
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao grupodao = dao.getUtilDao();
			Vector<GrupoBean> listagrupos = grupodao.seleccionarListaGrupos();
			Vector<UtilBean> listautiles = grupodao.seleccionarTodas();

			String nomgrado = request.getParameter("cb_grado");
			UtilAlumnoDao uadao = dao.getUtilAlumnoDao();
			System.out.print("primera parte");
			
			Vector<Integer> listautilesxgrado = uadao.seleccionarxgrado(nomgrado);
			
			System.out.print("segunda parte parte");

			Vector<UtilAlumnoBean> listaua = uadao.seleccionarTodos();
			
			String method = "post";
			
			request.setAttribute("listautiles", listautiles);

			
			request.setAttribute("listaua", listaua);
			
			request.setAttribute("listautilesxgrado", listautilesxgrado);

			request.setAttribute("listagrupos", listagrupos);
			
			request.setAttribute("method", method);
			
			request.setAttribute("nomgrado", nomgrado);

			
			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/directora_utiles_detallado2.jsp");
			rd.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
