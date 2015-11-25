package combate;



public class Heroe {
String nombre;
private int fuerza;
private double precision;
private int defensa;
private double vida;
private int velocidad;
private Arma derecha;
private Arma izquierda;



public Heroe(String nombre, int fuerza, double vida, int velocidad) {
	this.nombre = nombre;
	this.fuerza = fuerza;
	this.vida = vida;
	this.velocidad = velocidad;
	Arma a=new Espada("Puño",0,0,0,0);
	this.derecha = a;
	this.izquierda = a;
}

public void setDerecha(Arma derecha) {
	velocidad-=this.derecha.getVelocidad();
	this.derecha = derecha;
	velocidad+=derecha.getVelocidad();
}

public void setIzquierda(Arma izquierda) {
	velocidad-=this.izquierda.getVelocidad();
	this.izquierda = izquierda;
	velocidad+=izquierda.getVelocidad();
}

public void setVelocidad(int velocidad) {
	this.velocidad = velocidad;
}
public void setVida(double vida) {
	this.vida = vida;
}
public String getNombre() {
	return nombre;
}
public int getFuerza() {
	return fuerza;
}
public double getVida() {
	return vida;
}
public int getVelocidad() {
	return velocidad;
}
public Arma getDerecha() {
	return derecha;
}
public Arma getIzquierda() {
	return izquierda;
}
}
