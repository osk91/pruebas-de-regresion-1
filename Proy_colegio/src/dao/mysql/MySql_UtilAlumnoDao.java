package dao.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import beans.LoginBean;
import beans.UtilAlumnoBean;
import dao.ifaces.LoginDao;
import dao.ifaces.UtilAlumnoDao;
import daofactory.MySqlDaoFactory;


public class MySql_UtilAlumnoDao extends MySqlDaoFactory implements UtilAlumnoDao {

	@Override
	public Vector<UtilAlumnoBean> seleccionarTodos() throws Exception {
		// TODO Auto-generated method stub
		Vector<UtilAlumnoBean> vectorua = new Vector<>();

		try {
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from t_util_alumno");
			
			System.out.print("funciona el select 1");
			UtilAlumnoBean util_alumno = null;
			while(rs.next()){
				util_alumno = new UtilAlumnoBean();
				util_alumno.setId_util(rs.getInt("id_util"));
				util_alumno.setId_alumno(rs.getInt("id_alumno"));
				util_alumno.setNom_util(rs.getString("nom_util"));
				util_alumno.setTipo_util(rs.getString("tipo_util"));
				util_alumno.setDet_util(rs.getString("det_util"));
				util_alumno.setCant_util(rs.getString("cant_util"));
				util_alumno.setReg_util(rs.getString("reg_util"));
				vectorua.add(util_alumno);

				
			}
			
			System.out.print("funciona el select 2");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vectorua;
	}

	@Override
	public Vector<Integer> seleccionarxgrado(String nomgrado)
			throws Exception {
		// TODO Auto-generated method stub
		
		Vector<Integer> id_utiles = new Vector<>();

		try {
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs2 = stmt.executeQuery("select id from grado where nomgrado='"+nomgrado+"'");
			int codegrado=0;
			while(rs2.next()){
				codegrado = rs2.getInt("id");
				
			}
			System.out.print("codigo de grado "+codegrado);
			
			ResultSet rs3 = stmt.executeQuery("select util_id from lista_grado where grado_id="+codegrado);
			int codeutil=0;
			while(rs3.next()){
				codeutil = rs3.getInt("util_id");
				id_utiles.add(codeutil);
			}
			
			/*
			for(int i=0;i<id_utiles.size();i++){
				
				ResultSet rs = stmt.executeQuery("select * from t_util_alumno where id_util="+id_utiles.get(i));
				
				System.out.print("funciona el select 1 "+id_utiles.get(i));
				UtilAlumnoBean util_alumno = null;
				while(rs.next()){
					util_alumno = new UtilAlumnoBean();
					util_alumno.setId_util(rs.getInt("id_util"));
					util_alumno.setId_alumno(rs.getInt("id_alumno"));
					util_alumno.setNom_util(rs.getString("nom_util"));
					util_alumno.setTipo_util(rs.getString("tipo_util"));
					util_alumno.setDet_util(rs.getString("det_util"));
					util_alumno.setCant_util(rs.getString("cant_util"));
					util_alumno.setReg_util(rs.getString("reg_util"));
					
					System.out.print("alumno "+util_alumno.getNom_util());

					vectorua2.add(util_alumno);
					
					
					
				}
				
				
				
				
			}
			*/
			System.out.print("funciona el select 2");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return id_utiles;
		
		
		
		
		
		
	}

}
