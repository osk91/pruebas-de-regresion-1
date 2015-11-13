package daofactory;

import dao.ifaces.LoginDao;
import dao.ifaces.UtilAlumnoDao;
import dao.ifaces.UtilDao;

public abstract class DaoFactory {

	public static final int MYSQL =1;
	public static final int SQLSERVER =2;
	public static final int ORACLE =3;
	
	public abstract LoginDao getLoginDao();
	public abstract UtilDao getUtilDao();
	public abstract UtilAlumnoDao getUtilAlumnoDao();

	public static DaoFactory getDAOFactory(int origen){
		switch (origen) {
		
			case MYSQL:
				return new MySqlDaoFactory();
				
			case SQLSERVER:
				
			case ORACLE:
				
			default:
				return null;
				
		}
	}
	
}
