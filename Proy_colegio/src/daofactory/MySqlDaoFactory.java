package daofactory;

import java.sql.Connection;
import java.sql.DriverManager;

import dao.ifaces.LoginDao;
import dao.ifaces.UtilAlumnoDao;
import dao.ifaces.UtilDao;
import dao.mysql.MySql_LoginDao;
import dao.mysql.MySql_UtilAlumnoDao;
import dao.mysql.MySql_UtilDao;

public class MySqlDaoFactory extends DaoFactory {
	
	static final String usuario = "root";
	static final String clave 	= "root";
	static final String url 	= "jdbc:mysql://localhost:3306/colegio";
	//static final String url 	= "jdbc:mysql://localhost:3307/gruposw?autoReconnect=true";

	
	
	public static Connection obtenerConexion(){
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con =  DriverManager.getConnection(url,usuario,clave );
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
			
		}	
		
		return con;
	}
	
	
	
	public LoginDao getLoginDao(){
		return new MySql_LoginDao();
	}

	@Override
	public UtilDao getUtilDao() {
		// TODO Auto-generated method stub
		return new MySql_UtilDao();
	}

	public UtilAlumnoDao getUtilAlumnoDao(){
		
		return new MySql_UtilAlumnoDao();
	}

	
	
	
}
