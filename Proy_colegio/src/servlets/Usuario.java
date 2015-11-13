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

import beans.CuentaBean;
import beans.TipoCuentaBean;

/**
 * Servlet implementation class Usuario
 */
@WebServlet("/Usuario")
public class Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			
			String consulta = "select id, cuenta, pass, fk_tipocuenta, estado from t_cuentas";
			ResultSet rs = stmt.executeQuery(consulta);
			
			Vector<CuentaBean> listacuenta = new Vector<>();
			CuentaBean cuenta = null;
			
			
			while(rs.next()){
				cuenta = new CuentaBean();
				cuenta.setId(rs.getInt("id"));
				cuenta.setCuenta(rs.getString("cuenta"));
				cuenta.setPass(rs.getString("pass"));
				cuenta.setFk_tipocuenta(rs.getInt("fk_tipocuenta"));
				cuenta.setEstado(rs.getString("estado"));
				
				listacuenta.add(cuenta);
				
							
			}
			
			TipoCuentaBean tipocuenta = null;
			Vector<TipoCuentaBean> listatipocuenta = new Vector<>();
			String consulta2 = "Select id, descripcion from t_tipo_cuentas";
			ResultSet rs2 = stmt.executeQuery(consulta2);
			while(rs2.next()){
				tipocuenta = new TipoCuentaBean();
				tipocuenta.setId(rs2.getInt("id"));
				tipocuenta.setDescripcion(rs2.getString("descripcion"));
				listatipocuenta.add(tipocuenta);
				
			}
			
			
			
			request.setAttribute("listatipocuenta", listatipocuenta);

			request.setAttribute("listacuenta", listacuenta);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_user_principal.jsp");
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
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
		
			String dni = request.getParameter("txt_busqueda");

			
			
			String consulta3 ="select fk_cuenta from t_persona where dni='"+dni+"'";
			ResultSet rs3 = stmt.executeQuery(consulta3);
			int auxdni=0;
			
			while(rs3.next()){
				auxdni = rs3.getInt("fk_cuenta");
				
			}
			
			
			
			String consulta = "select id, cuenta, pass, fk_tipocuenta, estado from t_cuentas where id="+auxdni;
			ResultSet rs = stmt.executeQuery(consulta);
			
			Vector<CuentaBean> listacuenta = new Vector<>();
			CuentaBean cuenta = null;
			
			
			while(rs.next()){
				cuenta = new CuentaBean();
				cuenta.setId(rs.getInt("id"));
				cuenta.setCuenta(rs.getString("cuenta"));
				cuenta.setPass(rs.getString("pass"));
				cuenta.setFk_tipocuenta(rs.getInt("fk_tipocuenta"));
				cuenta.setEstado(rs.getString("estado"));
				
				listacuenta.add(cuenta);
				
							
			}
			
			TipoCuentaBean tipocuenta = null;
			Vector<TipoCuentaBean> listatipocuenta = new Vector<>();
			String consulta2 = "Select id, descripcion from t_tipo_cuentas";
			ResultSet rs2 = stmt.executeQuery(consulta2);
			while(rs2.next()){
				tipocuenta = new TipoCuentaBean();
				tipocuenta.setId(rs2.getInt("id"));
				tipocuenta.setDescripcion(rs2.getString("descripcion"));
				listatipocuenta.add(tipocuenta);
				
			}
			
			
			
			request.setAttribute("listatipocuenta", listatipocuenta);

			request.setAttribute("listacuenta", listacuenta);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_user_principal.jsp");
			rd.forward(request, response);
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
	}

}
