package es.fdi.iw.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@Entity
@NamedQueries({
	@NamedQuery(name="miHeroe",
			query="select h from Heroe h where h.id= :idParam"),
	@NamedQuery(name="delHeroe",
	query="delete from Heroe h where h.id= :idParam")
})
public class Heroe {
	public static int NUM_ITEMS_EQUIP = 5;
	public static int TAM_INVENT = 25;
	public static int MAX_VIDA = 1000;
	public static int MAX_DEFENSA = 500;
	public static int MAX_FUERZA = 500;
	public static int MAX_VELOCIDAD = 250;
	public static int MAX_PRECISION = 100;
	public static int MAX_NIVEL = 100;

	public static double VIDA_POR_PUNTO = 1;
	public static int DEF_POR_PUNTO = 1;
	public static int FUE_POR_PUNTO = 1;
	public static int VEL_POR_PUNTO = 1;
	public static int PREC_POR_PUNTO = 1;

	/* La xp necesaria para subir de nivel es 200*nivelActual 
	 * es decir para subir del 3 al 4 se necesita 600 xp */

	public static int XP_POR_NIVEL = 200;

	private long id;
	private String nombre;

	//Estadisticas
	private double vida;
	private int defensa;
	private int fuerza;
	private int velocidad;
	private int precision;
	private String imagen;
	private int nivel;
	private int oro;
	private int xp;
	private int puntosHab;
	private List<Item> equipo; //id de objetos equipados
	private List<Item> inventario; //id de objetos en el inventario

	public Heroe() {}

	public Heroe(String nombre) {
		this.nombre = nombre;
		this.vida = 100;
		this.defensa = 10;
		this.fuerza = 10;
		this.velocidad = 5;
		this.precision = 30;
		this.equipo = new ArrayList<Item>();
		this.inventario = new ArrayList<Item>();
		this.nivel = 1;
		this.oro = 0;
		this.xp = 0;
		this.puntosHab = 10;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(unique=true)
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getVida() {
		return vida;
	}

	public void setVida(double vida) {
		this.vida = vida;
	}

	public int getDefensa() {
		return defensa;
	}

	public void setDefensa(int defensa) {
		this.defensa = defensa;
	}

	public int getFuerza() {
		return fuerza;
	}

	public void setFuerza(int fuerza) {
		this.fuerza = fuerza;
	}

	public int getVelocidad() {
		return velocidad;
	}

	public void setVelocidad(int velocidad) {
		this.velocidad = velocidad;
	}

	public int getPrecision() {
		return precision;
	}

	public void setPrecision(int precision) {
		this.precision = precision;
	}

	@OneToMany(targetEntity = Item.class)
	public List<Item> getEquipo() {
		return equipo;
	}

	public void setEquipo(List<Item> equipo) {
		this.equipo = equipo;
	}

	@OneToMany(targetEntity = Item.class, fetch= FetchType.EAGER)
	public List<Item> getInventario() {
		return inventario;
	}

	public void setInventario(List<Item> inventario) {
		this.inventario = inventario;
	}

	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public int getOro() {
		return oro;
	}

	public void setOro(int oro) {
		this.oro = oro;
	}

	public int getXp() {
		return xp;
	}

	public void setXp(int xp) {
		this.xp = xp;
	}

	public void equipar(Item i){
		for(Item item: equipo){
			if(item.getTipo().equals(i.getTipo())){
				equipo.remove(item);
				equipo.add(i);
				return;
			}
		}
		equipo.add(i);
	}
	
	public boolean comprarObjeto(Item i){
		boolean hayPasta = true;
		if(oro < i.getPrecio()){
			hayPasta = false;
		}
		else if(inventario.size() < TAM_INVENT){
			inventario.add(inventario.size(),i);
			//this.oro -= i.getPrecio();
		}
		return hayPasta;
	}
	
	public void venderObjeto(Item i){
		this.oro += i.getPrecio() * 0.8;
		inventario.remove(i);
	}
	public int getPuntosHab() {
		return puntosHab;
	}

	public void setPuntosHab(int puntosHab) {
		this.puntosHab = puntosHab;
	}

}
