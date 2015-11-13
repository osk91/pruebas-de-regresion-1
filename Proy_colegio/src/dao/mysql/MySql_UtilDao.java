package dao.mysql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import beans.GrupoBean;
import beans.UtilBean;
import dao.ifaces.UtilDao;
import daofactory.MySqlDaoFactory;

public class MySql_UtilDao extends MySqlDaoFactory implements UtilDao {

	@Override
	public Vector<UtilBean> listado() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UtilBean seleccionarPorId(int idutil) throws Exception {
		// TODO Auto-generated method stub
		UtilBean util2 = null;

		try {
			
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT id, nombre, tipo, detipo, cantidad " +
					"FROM util where id="+idutil);
			while(rs.next()){
				util2 = new UtilBean();
				util2.setCodigo(rs.getInt("id"));
				util2.setNombre(rs.getString("nombre"));
				util2.setTipo(rs.getString("tipo"));
				util2.setDetalletipo(rs.getString("detipo"));
				util2.setCantidad(rs.getString("cantidad"));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return util2;
	}

	@Override
	public boolean actualizar(UtilBean util) throws Exception {
	
		
		return false;
	}

	@Override
	public boolean eliminar(int id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Vector<UtilBean> productosPorCategoria(int categoria)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Vector<UtilBean> buscarPorNombre(String nombre) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Vector<UtilBean> seleccionarTodas() throws Exception {
		// TODO Auto-generated method stub
		
			Vector<UtilBean> listautiles = null;


		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT id, nombre, tipo, detipo, cantidad " +
					"FROM util");
			
			
			// para la tabla util creo un vector y luego creo un objeto BEAN para almacenar cada
			//columnaa de la tabla
			listautiles = new Vector<UtilBean>();
			while(rs.next()){
				
				UtilBean util = new UtilBean();
				util.setCodigo(rs.getInt("id"));
				util.setNombre(rs.getString("nombre"));
				util.setTipo(rs.getString("tipo"));
				util.setDetalletipo(rs.getString("detipo"));
				util.setCantidad(rs.getString("cantidad"));
				
				
				listautiles.add(util);
				
			}
			
			
			
			
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
		return listautiles;
	}

	//este metodo es para listar categorias

	
	@Override
	public Vector<GrupoBean> seleccionarListaGrupos() throws Exception {
		// TODO Auto-generated method stub
		Vector<GrupoBean> lista2 = null;
		
		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs2 = stmt.executeQuery("Select id, nomgrado from grado");
			
			// para la tabla util creo un vector y luego creo un objeto BEAN para almacenar cada
			//columnaa de la tabla
			
			lista2 = new Vector<GrupoBean>();
			while(rs2.next()){
				GrupoBean grupo = new GrupoBean();
				grupo.setCodegrupo(rs2.getInt("id"));
				grupo.setDescripcion(rs2.getString("nomgrado"));
				
				
				
				lista2.add(grupo);
				
			}			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return lista2;
	}

	@Override
	public boolean agregarutil(int codigo, String nombre, int tipo,	String detalle, String cantidad) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String consulta = "insert into util values("+codigo+",'"+nombre+"',"+tipo+",'"+detalle+"','"+cantidad+"')";
			int estadoactualizar = stmt.executeUpdate(consulta);
			
			
			
			
			if(estadoactualizar==1){
				flag = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return flag;
	}

	@Override
	public Vector<UtilBean>  buscarutil(String nombre) throws Exception {
		// TODO Auto-generated method stub
		Vector<UtilBean> vutil = new Vector<>();

		try {
			Connection con =  MySqlDaoFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select id, nombre, tipo, detipo, cantidad from util where nombre like '%"+nombre+"%'");
			
			UtilBean util = null ;
			while(rs.next()){
				util = new UtilBean();
				util.setCodigo(rs.getInt("id"));
				util.setNombre(rs.getString("nombre"));
				util.setTipo(rs.getString("tipo"));
				util.setDetalletipo(rs.getString("detipo"));
				util.setCantidad(rs.getString("cantidad"));
				
				vutil.add(util);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return vutil;
	}
	
	
	

		
		
		
	

	
	
}
