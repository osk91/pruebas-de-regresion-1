package dao.ifaces;

import java.util.Vector;

import beans.GrupoBean;
import beans.UtilBean;

public interface UtilDao {

public Vector<UtilBean> listado() throws Exception;
	
	public UtilBean seleccionarPorId(int id) throws Exception;
	
	public boolean actualizar(UtilBean util) throws Exception;
	
	public boolean eliminar(int id) throws Exception;
	
	public Vector<UtilBean> productosPorCategoria(int categoria) throws Exception;
	
	public Vector<UtilBean> buscarPorNombre(String nombre) throws Exception;
	
	public Vector<UtilBean> seleccionarTodas() throws Exception;
	
	
	public Vector<GrupoBean> seleccionarListaGrupos() throws Exception;
	
	public boolean agregarutil(int codigo,String nombre,int tipo,String detalle,String cantidad) throws Exception;
	
	public Vector<UtilBean>  buscarutil(String nombre) throws Exception;
	

}
