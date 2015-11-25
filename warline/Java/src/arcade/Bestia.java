package arcade;

public class Bestia {
	private int fuerza;
	private int defensa;
	private int vida;
	private int precision;
	private int velocidad;
	private int nivel;
	private String nombre;
	private int exp;
	private int oro;
	
	public Bestia(int f, int d, int vid, int p, int vel, int n, String name, int x, int o){
		setFuerza(f);
		setDefensa(d);
		setVida(vid);
		setPrecision(p);
		setVelocidad(vel);
		setNivel(n);
		setNombre(name);
		setExp(x);
		setOro(o);
	}
	
	
	/**************************/
	/*****GETTERS Y SETTERS****/
	/**************************/
	
	public int getFuerza() {
		return fuerza;
	}
	public void setFuerza(int fuerza) {
		this.fuerza = fuerza;
	}
	public int getDefensa() {
		return defensa;
	}
	public void setDefensa(int defensa) {
		this.defensa = defensa;
	}
	public int getVida() {
		return vida;
	}
	public void setVida(int vida) {
		this.vida = vida;
	}
	public int getPrecision() {
		return precision;
	}
	public void setPrecision(int precision) {
		this.precision = precision;
	}
	public int getVelocidad() {
		return velocidad;
	}
	public void setVelocidad(int velocidad) {
		this.velocidad = velocidad;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public String getNombre() {
		return this.nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public int getOro() {
		return oro;
	}
	public void setOro(int oro) {
		this.oro = oro;
	}
	
	
	
}
