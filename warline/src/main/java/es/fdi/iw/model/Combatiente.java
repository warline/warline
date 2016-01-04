package es.fdi.iw.model;

import javax.persistence.Entity;


public class Combatiente {

	Personaje p;
	double vida;
	long ultimo;
	Ataque ataque;
	
	public Combatiente(Personaje a, double d, long ultimo, Ataque ataque) {
		super();
		this.p = a;
		this.vida = d;
		this.ultimo = ultimo;
		this.ataque = ataque;
	}
	
	public Personaje getPerso() {
		return p;
	}
	public void setHeroe(Personaje p) {
		this.p = p;
	}
	public double getVida() {
		return vida;
	}
	public void setVida(double vida) {
		this.vida = vida;
	}
	public long getUltimo() {
		return ultimo;
	}
	public void setUltimo(long ultimo) {
		this.ultimo = ultimo;
	}
	public Ataque getAtaque() {
		return ataque;
	}
	public void setAtaque(Ataque ataque) {
		this.ataque = ataque;
	}

	
}
