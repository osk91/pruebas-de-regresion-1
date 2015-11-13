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

import beans.GrupoBean;
import beans.UtilBean;
import dao.ifaces.UtilDao;
import daofactory.DaoFactory;
import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class ListaAlumno
 */
@WebServlet("/ListaAlumno")
public class ListaAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaAlumno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/secretaria_add_utiles1.jsp");
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
			String codigo = request.getParameter("txt_codigo");

			int code_grado = 99999;
			int code_grado2 = 99999;

			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			
			
			//ResultSet rs = stmt.executeQuery("SELECT id from grado where nomgrado='Inicial'");
			ResultSet rs = stmt.executeQuery("select fk_grado from t_alumno where id="+codigo);
			Vector<UtilBean> grado_sel =new Vector<>();
			UtilBean prueba = null;
			while(rs.next()){
				prueba = new UtilBean();
				code_grado = rs.getInt("fk_grado");
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
			request.setAttribute("idsel", idsel);
			request.setAttribute("listagrupo", listagrupo);
			request.setAttribute("listautiles", listautiles);
			request.setAttribute("codigo", codigo);
			RequestDispatcher rd = 
					getServletContext().getRequestDispatcher("/secretaria_add_utiles2.jsp");
			rd.forward(request, response);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
	}

}
