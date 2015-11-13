package dao.mysql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import beans.LoginBean;
import dao.ifaces.LoginDao;
import daofactory.MySqlDaoFactory;


public class MySql_LoginDao extends MySqlDaoFactory implements LoginDao{

	@Override
	public LoginBean seleccionarxcuenta(String cuenta,String pass) throws Exception {
		//declarando el objeto de salida
		LoginBean login = null;

		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select id,cuenta,pass,fk_tipocuenta,estado from t_cuentas" +
					" where cuenta='"+cuenta+"' and pass='"+pass+"'");
			
				login = new LoginBean();
				
				while( rs.next() ){
					login.setId( rs.getInt("id") );
					login.setFkcuenta(rs.getInt("fk_tipocuenta"));
					login.setEstado(rs.getString("estado"));
				}

			
			
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		
		
		// TODO Auto-generated method stub
		return login;
	}

	
	
	
}
