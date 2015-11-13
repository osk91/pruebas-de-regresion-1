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

/**
 * Servlet implementation class AsistenteVista
 */
@WebServlet("/AsistenteVista")
public class AsistenteVista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AsistenteVista() {
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
					getServletContext().getRequestDispatcher("/asistente_visualiza.jsp");
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
		PrintWriter out = response.getWriter();
		try {
			String grado = request.getParameter("cb_grado");
			int code_grado = 99999;
			int code_grado2 = 99999;

			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/colegio";
			Connection con = DriverManager.getConnection(url, "root", "root");
			Statement stmt = con.createStatement();
			//ResultSet rs = stmt.executeQuery("SELECT id from grado where nomgrado='Inicial'");
			ResultSet rs = stmt.executeQuery("select id from grado where nomgrado='"+grado+"'");
			Vector<UtilBean> grado_sel =new Vector<>();
			UtilBean prueba = null;
			while(rs.next()){
				prueba = new UtilBean();
				code_grado = rs.getInt("id");
				prueba.setCodigo(code_grado);
				System.out.print(code_grado);
				grado_sel.add(prueba);
			}
			
			

			Vector<UtilBean> idsel =null;
			Vector<Integer> ides_utiles = null;
			UtilBean utilsel = null;
			ResultSet rs2 = stmt.executeQuery("select util_id from lista_grado where grado_id="+code_grado);
			idsel = new Vector<>();

			while(rs2.next()){

				code_grado2 = rs2.getInt("util_id");
				utilsel = new UtilBean();
				
				System.out.print(code_grado2);
				utilsel.setCodigo(code_grado2);
				utilsel.setNombre("");
				utilsel.setTipo("");
				utilsel.setDetalletipo("");
				utilsel.setCantidad("");
				
				idsel.add(utilsel);

			}
			
			
			
			
			
			
			
			
			
			
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			UtilDao categoria_dao = dao.getUtilDao();
			Vector<UtilBean> listautiles = categoria_dao.seleccionarTodas();
			Vector<GrupoBean> listagrupo = categoria_dao.seleccionarListaGrupos();
			
			
			request.setAttribute("grado_sel", grado_sel);
			request.setAttribute("grado", grado);
			request.setAttribute("idsel", idsel);
			request.setAttribute("listagrupo", listagrupo);
			request.setAttribute("listautiles", listautiles);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/asistente_visualiza2.jsp");
			rd.forward(request, response);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
		
	}

}
