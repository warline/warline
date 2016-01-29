package es.fdi.iw.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
    @NamedQuery(name="allItems",
            query="select i from Item i"),
    @NamedQuery(name="itemsPorPrecio",
    		query="select i from Item i Order By(i.precio)"),
    @NamedQuery(name="itemsPorNivel",
	query="select i from Item i Order By(i.nivel)"),
    @NamedQuery(name="itemByName",
        query="select i from Item i where i.nombre = :nombreParam"),
    @NamedQuery(name="delItem",
    	query="delete from Item i where i.id= :idParam"),
    @NamedQuery(name="estadisticas",
    	query ="select i.vida, i.defensa, i.fuerza, i.velocidad, i.precision from Item i where i.id = :idParam")
})

public class Item {
	private long id;
	private String nombre;
	private int nivel;
	//Estadisticas
	private double vida;
	private int fuerza;
	private int defensa;
	private int velocidad;
	private int precision;
	private TipoItem tipo;
	private int precio;
	private Ataque at1;
	private Ataque at2;
	private Ataque at3;
	//private boolean disponibilidad
	public Item() {}
	
	public Item(String nombre, double vida, int fu, int def, int vel,
				int pre, TipoItem t , int precio, int nivel,Ataque a1,Ataque a2, Ataque a3){
		this.nombre = nombre;
		this.vida = vida;
 		this.fuerza = fu;
 		this.defensa = def;
		this.velocidad = vel;
		this.precision = pre;
		this.tipo = t;
		this.precio = precio;
		this.nivel=nivel;
		setAt1(a1);
		setAt2(a2);
		setAt3(a3);
	}
	
	public int getNivel() {
		return nivel;
	}

	public void setNivel(int nivel) {
		this.nivel = nivel;
	}

	public int getPrecio(){
		return precio;
	}
	
	public void setPrecio(int precio){
		this.precio = precio;
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
	
    /* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Item other = (Item) obj;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
    public void modificar(Item copia){
    	nombre = copia.nombre;
    	vida = copia.vida;
    	fuerza = copia.fuerza;
    	defensa = copia.defensa;
    	velocidad = copia.velocidad;
    	precision = copia.precision;
    	tipo = copia.tipo;
    	precio = copia.precio;
    	nivel = copia.nivel;
    	at1 = copia.at1;
    	at2 = copia.at2;
    	at3 = copia.at3;
    }

    
    @OneToOne (targetEntity = Ataque.class, fetch= FetchType.EAGER)
	public Ataque getAt3() {
		return at3;
	}

	public void setAt3(Ataque at3) {
		this.at3 = at3;
	}
	
	@OneToOne (targetEntity = Ataque.class, fetch= FetchType.EAGER)
	public Ataque getAt2() {
		return at2;
	}

	public void setAt2(Ataque at2) {
		this.at2 = at2;
	}
	
	@OneToOne (targetEntity = Ataque.class, fetch= FetchType.EAGER)
	public Ataque getAt1() {
		return at1;
	}

	public void setAt1(Ataque at1) {
		this.at1 = at1;
	}
}
