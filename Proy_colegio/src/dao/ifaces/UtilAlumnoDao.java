package dao.ifaces;

import beans.UtilAlumnoBean;
import java.util.Vector;

import beans.GrupoBean;
import beans.UtilBean;

public interface UtilAlumnoDao {
	
	public Vector<UtilAlumnoBean> seleccionarTodos() throws Exception;
	
	public Vector<Integer> seleccionarxgrado(String nomgrado) throws Exception;
	
	
}
