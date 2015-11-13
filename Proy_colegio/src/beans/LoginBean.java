package beans;

public class LoginBean {
	int id;
	String cuenta;
	String pass;
	String tipocuenta;
	int fkcuenta;
	String estado;
	
	
	public int getFkcuenta() {
		return fkcuenta;
	}
	public void setFkcuenta(int fkcuenta) {
		this.fkcuenta = fkcuenta;
	}
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
	public String getTipocuenta() {
		return tipocuenta;
	}
	public void setTipocuenta(String tipocuenta) {
		this.tipocuenta = tipocuenta;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
