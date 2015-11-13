package dao.ifaces;

import beans.LoginBean;

public interface LoginDao {

	public  LoginBean seleccionarxcuenta(String cuenta,String pass) throws Exception;
	
}
