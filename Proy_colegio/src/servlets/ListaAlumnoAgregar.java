package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daofactory.MySqlDaoFactory;

/**
 * Servlet implementation class ListaAlumnoAgregar
 */
@WebServlet("/ListaAlumnoAgregar")
public class ListaAlumnoAgregar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaAlumnoAgregar() {
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
			String codigoalumno = request.getParameter("txt_code_alumno");
			String[] codigoutil = request.getParameterValues("txt_code_util");
			String[] nombre = request.getParameterValues("txt_nombre");
			String[] tipo = request.getParameterValues("txt_tipo");
			String[] detipo = request.getParameterValues("txt_detipo");
			String[] cantidad = request.getParameterValues("txt_cantidad");
			String[] recogido = request.getParameterValues("txt_recogido");
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			System.out.print("funciona hasta aqui 1");

			String consulta="";
			int filas =0;
			for(int i=0;i<codigoutil.length;i++){

				consulta = "insert into t_util_alumno values("+codigoutil[i]+","+codigoalumno+",'"+nombre[i]+"','"+tipo[i]+
						"','"+detipo[i]+"','"+cantidad[i]+"','"+recogido[i]+"')";
				
				//consulta = "insert into lista_grado values("+code_grado+","+codeutil+",'"+grado+"')";
				 //consulta = "insert into lista_grado values("+code_grado+",1,'none')";p
				
				filas = stmt.executeUpdate(consulta);
			}
			
			System.out.print("funciona hasta aqui 2");
			
			if(filas==1){
				request.setAttribute("mensaje", "Registrado el ingreso de utiles por alumno");
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/resultado_registro_alumno_utiles.jsp");
				rd.forward(request, response);
			}else{
				request.setAttribute("mensaje", "Ocurrio un fallo!");
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/resultado_registro_alumno_utiles.jsp");
				rd.forward(request, response);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
	}

}
