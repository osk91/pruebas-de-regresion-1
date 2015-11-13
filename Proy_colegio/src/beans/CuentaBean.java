package beans;

public class CuentaBean {

	int id;
	String cuenta;
	String pass;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCuenta() {
		return cuenta;
	}
	public void setCuenta(String cuenta) {
		this.cuenta = cuenta;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getFk_tipocuenta() {
		return fk_tipocuenta;
	}
	public void setFk_tipocuenta(int fk_tipocuenta) {
		this.fk_tipocuenta = fk_tipocuenta;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	int fk_tipocuenta;
	String estado;
	
	
	
}
