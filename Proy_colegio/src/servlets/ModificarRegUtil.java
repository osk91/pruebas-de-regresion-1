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

import beans.UtilAlumnoBean;

/**
 * Servlet implementation class ModificarRegUtil
 */
@WebServlet("/ModificarRegUtil")
public class ModificarRegUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarRegUtil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
try {
			
			if(request.getParameter("dato").equalsIgnoreCase("modificar")){
				
				String codeutil = request.getParameter("codeutil");
				String codealumno = request.getParameter("codealumno");
							
				System.out.print("metodo get y tengo "+ codeutil +"  "+ codealumno);

				Connection con =  MySqlDaoFactory.obtenerConexion();
				Statement stmt = con.createStatement();
				
				ResultSet rs = stmt.executeQuery("select * from t_util_alumno where id_util="+codeutil+" and id_alumno="+codealumno);
				UtilAlumnoBean ua = null;
				Vector<UtilAlumnoBean> vectorua = new Vector<>();
				
				while(rs.next()){
					ua = new UtilAlumnoBean();
					ua.setId_util(rs.getInt("id_util"));
					ua.setId_alumno(rs.getInt("id_alumno"));
					ua.setNom_util(rs.getString("nom_util"));
					ua.setTipo_util(rs.getString("tipo_util"));
					ua.setDet_util(rs.getString("det_util"));
					ua.setCant_util(rs.getString("cant_util"));
					ua.setReg_util(rs.getString("reg_util"));
					vectorua.add(ua);
				}
				
				
				
				//int filas = stmt.executeUpdate("update t_util_alumno set reg_util='"+nuevomonto+"' where id_util="+codeutil+" and id_alumno="+codealumno);
				
				/*
				System.out.print("se actualizo la base de datos");
				
				if(filas==1){
					request.setAttribute("mensaje", "Registro actualizado");
					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/resultado_secretaria.jsp");
					rd.forward(request, response);
				}else{
					request.setAttribute("mensaje", "Ocurrio un error");
					RequestDispatcher rd = 
							getServletContext().getRequestDispatcher("/resultado_secretaria.jsp");
					rd.forward(request, response);
					
				}
				*/
				request.setAttribute("vectorua", vectorua);
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/secretaria_ve2.jsp");
				rd.forward(request, response);
				
				
					
			}else{
				
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
			String nuevomonto = request.getParameter("txt_nuevo");
			String codealumno = request.getParameter("txt_codealumno");
			String codeutil = request.getParameter("txt_codeutil");
			
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			ResultSet rs2 = stmt.executeQuery("select reg_util from t_util_alumno where id_util="+codeutil+" and id_alumno="+codealumno);
			int nuevomonto2 =0;
			while(rs2.next()){
				nuevomonto2 = rs2.getInt("reg_util");
			}
			int aux = Integer.parseInt(nuevomonto);
			aux = aux + nuevomonto2;
			
			int filas = stmt.executeUpdate("update t_util_alumno set reg_util='"+aux+"' where id_util="+codeutil+" and id_alumno="+codealumno);
			
			if(filas==1){
				request.setAttribute("mensaje", "Registro actualizado");
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/resultado_secretaria.jsp");
				rd.forward(request, response);
			}else{
				request.setAttribute("mensaje", "Ocurrio un error");
				RequestDispatcher rd = 
						getServletContext().getRequestDispatcher("/resultado_secretaria.jsp");
				rd.forward(request, response);
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
