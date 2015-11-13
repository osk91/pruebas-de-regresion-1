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

import beans.TipoCuentaBean;

/**
 * Servlet implementation class AgregarUser
 */
@WebServlet("/AgregarUser")
public class AgregarUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			System.out.print("recibido por get");
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
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
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_add_user.jsp");
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
			
			String nombre = request.getParameter("txt_nombre");
			String apellido = request.getParameter("txt_apellido");
			String dni = request.getParameter("txt_dni");
			String direccion = request.getParameter("txt_direccion");
			String correo = request.getParameter("txt_correo");
			String telefono = request.getParameter("txt_telefono");
			
			String cuenta = request.getParameter("txt_cuenta");
			String pass1 = request.getParameter("txt_pass1");
			String pass2 = request.getParameter("txt_pass2");
			String tipocuenta = request.getParameter("cb_tipo_user");
			String estado = request.getParameter("cb_estado");
			
			
			int aux=0;

			
			System.out.print("recibido por post");
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			
			
			if(!pass1.equals(pass2)){
				
				request.setAttribute("mensaje", "los campos de password no coinciden");
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/resultado_admin_add_user.jsp");
				rd.forward(request, response);
			}else{
			
			
			
			
			ResultSet rs = stmt.executeQuery("select max(id) from t_persona");
			
			while(rs.next()){
				aux = rs.getInt("max(id)");
				aux++;
				System.out.print(aux);
			}
			
			ResultSet rs2 = stmt.executeQuery("select max(id) from t_cuentas");
			int id_cuenta=0;
			while (rs2.next()){
				id_cuenta = rs2.getInt("max(id)");
				id_cuenta++;
				System.out.print(id_cuenta);
			}
			
			ResultSet rs3 = stmt.executeQuery("select id from t_tipo_cuentas where descripcion='"+tipocuenta+"'");
			int id_tipocuenta= 0;
			while(rs3.next()){
				id_tipocuenta = rs3.getInt("id");
				System.out.print(id_tipocuenta);
			}
			
			
			String consulta3 = "insert into t_cuentas values("+id_cuenta+",'"+cuenta+"','"+pass1+"',"+id_tipocuenta+",'"+estado+"')";
			int filas2 = stmt.executeUpdate(consulta3);
			
			
			
			String consulta1 = "insert into t_persona values("+aux+",'"+nombre+"','"+apellido+"','"+dni+"','"+direccion+
					"','"+correo+"',"+id_cuenta+",'"+telefono+"')";
			int filas1 = stmt.executeUpdate(consulta1);
			
			request.setAttribute("mensaje", "Se agrego al nuevo usuario");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/resultado_admin_add_user.jsp");
			rd.forward(request, response);
			
			
			} // este es el fin del else
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}
