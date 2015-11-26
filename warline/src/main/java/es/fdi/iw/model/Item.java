package es.fdi.iw.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
    @NamedQuery(name="allItems",
            query="select i from Item i"),
    @NamedQuery(name="itemByNombre",
        query="select i from Item i where i.nombre = :nombreParam"),
    @NamedQuery(name="delItem",
    	query="delete from Item i where i.id= :idParam"),
    @NamedQuery(name="itemByImagen",
    	query = "select i.imagen from Item i where i.id = :idParam"),
    @NamedQuery(name="estadisticas",
    	query ="select i.vida, i.defensa, i.fuerza, i.velocidad, i.precision from Item i where i.id = :idParam")
})

public class Item {
	private long id;
	private String nombre;
	private String imagen;
	//Estadisticas
	private double vida;
	private int fuerza;
	private int defensa;
	private int velocidad;
	private int precision;
	private TipoItem tipo;
	private int precio;
	public Item() {}
	
	public Item(String nombre, String img, double vida, int fu, int def, int vel, int pre, TipoItem t , int _precio){
		this.nombre = nombre;
		this.imagen = img;
		this.vida = vida;
 		this.fuerza = fu;
 		this.defensa = def;
		this.velocidad = vel;
		this.precision = pre;
		this.tipo = t;
		precio = _precio;
	}
	
	public int getPrecio(){
		return precio;
	}
	
	public void setPrecio(int _precio){
		precio = _precio;
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

	public String getImagen() {
		return imagen;
	}

	public int getFuerza() {
		return fuerza;
	}

	public int getVelocidad() {
		return velocidad;
	}

	public int getPrecision() {
		return precision;
	}

	public double getVida() {
		return vida;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public void setVida(double vida) {
		this.vida = vida;
	}

	public void setFuerza(int fuerza) {
		this.fuerza = fuerza;
	}

	public void setDefensa(int defensa) {
		this.defensa = defensa;
	}

	public void setVelocidad(int velocidad) {
		this.velocidad = velocidad;
	}

	public void setPrecision(int precision) {
		this.precision = precision;
	}

	public void setTipo(TipoItem tipo) {
		this.tipo = tipo;
	}

	public int getDefensa() {
		return defensa;
	}

	public TipoItem getTipo(){
		return tipo;
	}	
	
	
	
}
