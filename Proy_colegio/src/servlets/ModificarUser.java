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
import beans.UsuarioBean;

/**
 * Servlet implementation class ModificarUser
 */
@WebServlet("/ModificarUser")
public class ModificarUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("hasta aqui funciona bien 1");

		try {
			if(request.getParameter("dato").equalsIgnoreCase("detalle")){
				String codigo = request.getParameter("codigo");	
				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				
				
				System.out.print(codigo);

				ResultSet rs = stmt.executeQuery("select * from t_cuentas where id="+codigo);
				CuentaBean cuenta = null;
				while(rs.next()){
					cuenta = new CuentaBean();
					cuenta.setId(rs.getInt("id"));
					cuenta.setCuenta(rs.getString("cuenta"));
					cuenta.setPass(rs.getString("pass"));
					cuenta.setFk_tipocuenta(rs.getInt("fk_tipocuenta"));
					cuenta.setEstado(rs.getString("estado"));
					System.out.print("hasta aqui funciona bien 1");

				}
					
				ResultSet rs2 = stmt.executeQuery("select * from t_persona where fk_cuenta="+codigo);
				UsuarioBean user = null;
				while(rs2.next()){
					user = new UsuarioBean();
					user.setId(rs2.getInt("id"));
					user.setNombre(rs2.getString("nombre"));
					user.setApellido(rs2.getString("apellido"));
					user.setDni(rs2.getString("dni"));
					user.setDireccion(rs2.getString("direccion"));
					user.setCorreo(rs2.getString("correo"));
					user.setFk_cuenta(rs2.getInt("fk_cuenta"));
					user.setTelefono(rs2.getString("telefono"));
					System.out.print("hasta aqui funciona bien 2");

				}
				
				int a_tipocuenta =0;
				a_tipocuenta = cuenta.getFk_tipocuenta();
				
				ResultSet rs3 = stmt.executeQuery("select id, descripcion from t_tipo_cuentas where id="+a_tipocuenta);
				TipoCuentaBean tipocuenta = null;
				while(rs3.next()){
					tipocuenta = new TipoCuentaBean();
					tipocuenta.setId(rs3.getInt("id"));
					tipocuenta.setDescripcion(rs3.getString("descripcion"));
					System.out.print("hasta aqui funciona bien 3");
				}
				
				request.setAttribute("tipocuenta", tipocuenta);
				request.setAttribute("cuenta", cuenta);
				request.setAttribute("user", user);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_info_user.jsp");
				rd.forward(request, response);
				
				
			}else if(request.getParameter("dato").equalsIgnoreCase("modificar")){
				
				String codigo = request.getParameter("codigo");	
				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				
				System.out.print(codigo);

				ResultSet rs = stmt.executeQuery("select * from t_cuentas where id="+codigo);
				CuentaBean cuenta = null;
				while(rs.next()){
					cuenta = new CuentaBean();
					cuenta.setId(rs.getInt("id"));
					cuenta.setCuenta(rs.getString("cuenta"));
					cuenta.setPass(rs.getString("pass"));
					cuenta.setFk_tipocuenta(rs.getInt("fk_tipocuenta"));
					cuenta.setEstado(rs.getString("estado"));
					System.out.print("hasta aqui funciona bien 1");

				}
					
				ResultSet rs2 = stmt.executeQuery("select * from t_persona where fk_cuenta="+codigo);
				UsuarioBean user = null;
				while(rs2.next()){
					user = new UsuarioBean();
					user.setId(rs2.getInt("id"));
					user.setNombre(rs2.getString("nombre"));
					user.setApellido(rs2.getString("apellido"));
					user.setDni(rs2.getString("dni"));
					user.setDireccion(rs2.getString("direccion"));
					user.setCorreo(rs2.getString("correo"));
					user.setFk_cuenta(rs2.getInt("fk_cuenta"));
					user.setTelefono(rs2.getString("telefono"));
					System.out.print("hasta aqui funciona bien 2");

				}
				
				int a_tipocuenta =0;
				a_tipocuenta = cuenta.getFk_tipocuenta();
				
				ResultSet rs3 = stmt.executeQuery("select id, descripcion from t_tipo_cuentas where id="+a_tipocuenta);
				TipoCuentaBean tipocuenta = null;
				while(rs3.next()){
					tipocuenta = new TipoCuentaBean();
					tipocuenta.setId(rs3.getInt("id"));
					tipocuenta.setDescripcion(rs3.getString("descripcion"));
					System.out.print("hasta aqui funciona bien 3");
				}
				
				TipoCuentaBean tipocuenta2 = null;
				Vector<TipoCuentaBean> listatipocuenta = new Vector<>();
				String consulta2 = "Select id, descripcion from t_tipo_cuentas";
				ResultSet rs4 = stmt.executeQuery(consulta2);
				while(rs4.next()){
					tipocuenta2 = new TipoCuentaBean();
					tipocuenta2.setId(rs4.getInt("id"));
					tipocuenta2.setDescripcion(rs4.getString("descripcion"));
					listatipocuenta.add(tipocuenta2);
					
				}
				
				System.out.print("hasta aqui funciona bien 4");

				
				request.setAttribute("codigo", codigo);
				request.setAttribute("listatipocuenta", listatipocuenta);

				request.setAttribute("tipocuenta", tipocuenta);
				request.setAttribute("cuenta", cuenta);
				request.setAttribute("user", user);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin_mod_user.jsp");
				rd.forward(request, response);
				
				
				
				
			}else if(request.getParameter("dato").equalsIgnoreCase("eliminar")){
				
				String codigo = request.getParameter("codigo");	
				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				System.out.print(codigo);
				
				String consulta2 = "delete from t_persona where fk_cuenta="+codigo;
				int fila2 = stmt.executeUpdate(consulta2);
				
				String consulta = "delete from t_cuentas where id="+codigo;
				int fila = stmt.executeUpdate(consulta);
				System.out.print("ejecuto bien");
				
				
				
				System.out.print("ejecuto bien 2");

				
				if(fila2==1){
					request.setAttribute("mensaje", "Usuario Eliminado del sistema");
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/resultado_admin_add_user.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("mensaje", "Ocurrio un error!");

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/resultado_admin_add_user.jsp");
					rd.forward(request, response);
				}
				
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
			String codigo = request.getParameter("txt_codigo");
			String nombre = request.getParameter("txt_nombre");
			String apellido = request.getParameter("txt_apellido");
			String dni = request.getParameter("txt_dni");
			String direccion = request.getParameter("txt_direccion");
			String correo = request.getParameter("txt_correo");
			String telefono = request.getParameter("txt_telefono");
			
			String cuenta = request.getParameter("txt_cuenta");
			String pass1 = request.getParameter("txt_pass1");
			String pass2 = request.getParameter("txt_pass1");
			String tipocuenta = request.getParameter("cb_tipo_user");
			String estado = request.getParameter("cb_estado");
			
			
			int aux=0;

			
			System.out.print("recibido por post");
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			
			
				
			
			
			ResultSet rs3 = stmt.executeQuery("select id from t_tipo_cuentas where descripcion='"+tipocuenta+"'");
			int id_tipocuenta= 0;
			while(rs3.next()){
				id_tipocuenta = rs3.getInt("id");
				System.out.print(id_tipocuenta);
			}
			
			
			String consulta3 = "update t_cuentas set cuenta='"+cuenta+"' , pass='"+pass1+"' , fk_tipocuenta="+id_tipocuenta+" , estado='"+estado+"' where id="+codigo;
			int filas2 = stmt.executeUpdate(consulta3);
			System.out.print("actualizado cuentas");
			
			
			
			String consulta1 = "update t_persona set nombre='"+nombre+"', apellido='"+apellido+"', dni='"+dni+"', direccion='"+direccion
					+"', correo='"+correo+"', telefono='"+telefono+"' where fk_cuenta="+codigo;
			int filas1 = stmt.executeUpdate(consulta1);
			System.out.print("actualizado datos de persona");

			request.setAttribute("mensaje", "Actualizacion completa!");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/resultado_admin_add_user.jsp");
			rd.forward(request, response);
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
