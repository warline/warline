package combate;

import combate.Ataque;

public abstract class Arma {
	private String nombre;
	private int dano;
	private int precision;
	private int vida;
	private int velocidad;
	private Ataque[] ataques;

	
	public void setAtaques(Ataque[] ataques) {
		this.ataques = ataques;
	}
	public int getDano() {
		return dano;
	}
	public int getPrecision() {
		return precision;
	}
	public int getVida() {
		return vida;
	}
	public int getVelocidad() {
		return velocidad;
	}
	
	public Ataque[] getAtaques() {
		return ataques;
	}
	public Arma(String nombre,int dano, int prec, int vida, int veloc){
		this.dano = dano;
		this.precision = prec;
		this.vida = vida;
		this.velocidad = veloc;
		
	}
	public String getNombre() {
		return nombre;
	}
}
