package es.fdi.iw.model;

import java.util.List;

public abstract class Personaje {
	public static int NUM_ITEMS_EQUIP = 5;
	public static int TAM_INVENT = 25;
	public static int MAX_VIDA = 1000;
	public static int MAX_DEFENSA = 500;
	public static int MAX_FUERZA = 500;
	public static int MAX_VELOCIDAD = 250;
	public static int MAX_PRECISION = 100;
	public static int MAX_NIVEL = 100;
	
	/* La xp necesaria para subir de nivel es 200*nivelActual 
	 * es decir para subir del 3 al 4 se necesita 600 xp */
	
	public static int XP_POR_NIVEL = 200;

	abstract public String getImagen();

	abstract public void setImagen(String imagen);

	abstract public long getId();
	
	abstract public void setId(long id);
	
	abstract public String getNombre();

	abstract public void setNombre(String nombre);

	abstract public double getVida();

	abstract public void setVida(double vida);
	
	abstract public int getDefensa();

	abstract public void setDefensa(int defensa);

	abstract public int getFuerza();

	abstract public void setFuerza(int fuerza) ;
	
	abstract public int getVelocidad();

	abstract public void setVelocidad(int velocidad);

	abstract public int getPrecision();

	abstract public void setPrecision(int precision);

	abstract public List<Item> getEquipo();

	abstract public void setEquipo(List<Item> equipo);

	abstract public List<Item> getInventario();

	abstract public void setInventario(List<Item> inventario);
	
	abstract public int getNivel();

	abstract public void setNivel(int nivel);

	abstract public int getOro();

	abstract public void setOro(int oro);

	abstract public int getXp();

	abstract public void setXp(int xp) ;
	
	
}
