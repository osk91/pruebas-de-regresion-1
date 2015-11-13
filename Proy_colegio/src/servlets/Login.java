package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.LoginBean;
import dao.ifaces.LoginDao;
import daofactory.DaoFactory;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter salida = response.getWriter();
		try {
			String cuenta = request.getParameter("txtcuenta");
			String pass = request.getParameter("txtpassword");
			System.out.print(cuenta);
			System.out.print(pass);
			//se cra un objeto de la clase daofactory para poder invocar al metodo daofactory que contiene 
			//el tipo de base de datos que se usara 
			
			DaoFactory dao = DaoFactory.getDAOFactory(DaoFactory.MYSQL);
			// se crea la interface dao de login para poder utilizar los metodos que contienen las intrucciones de BD
				LoginDao logdao = dao.getLoginDao();//
			LoginBean logear = logdao.seleccionarxcuenta(cuenta, pass);
			
			
			String mensaje = "Online";
			if(logear.getId()!=0){
				
				if(logear.getEstado().equalsIgnoreCase("activo")){
					if(logear.getFkcuenta()==1){
					 mensaje = "Acceso  autorizado";
						request.setAttribute("mensaje", mensaje);
						RequestDispatcher rd =
								getServletContext().getRequestDispatcher("/admin_principal.jsp");
						rd.forward(request, response);
					
					
					}else if(logear.getFkcuenta()==2){
					mensaje = "Acceso  autorizado";
					request.setAttribute("mensaje", mensaje);
					response.sendRedirect("Asistente");
						
					}else if(logear.getFkcuenta()==3){
					response.sendRedirect("/Proy_colegio/secretaria_principal.jsp");

					
					}else if(logear.getFkcuenta()==4){
						response.sendRedirect("/Proy_colegio/directora_principal.jsp");
						
					}
					
					
					
				}else{
					request.setAttribute("mensaje", "Usuario bloqueado. Debe ponerse en contacto con el administrador");
					RequestDispatcher rd =
							getServletContext().getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
					
					
				}
				
			}else{
				request.setAttribute("mensaje", "Usuario no existe");
				RequestDispatcher rd =
						getServletContext().getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
			
			/*
			CategoriaDao catdao = dao.getCategoriaDao();
			Vector<CategoriaBean> categorias = catdao.seleccionarTodas();
			request.setAttribute("categorias", categorias);
			*/
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			salida.print(e.getMessage());
		}
		
		
		
		
		
		
		
		
		
	}

}
