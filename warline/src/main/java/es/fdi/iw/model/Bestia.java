package es.fdi.iw.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name="bestiasPorNivel",
			query="select b from Bestia b Order By(b.nivel)"),
    @NamedQuery(name="bestiaByName",
            query="select b from Bestia b where b.nombre= :nombreParam"),
    @NamedQuery(name="delBestia",
    		query="delete from Bestia b where b.nombre= :nombreParam")
})
public class Bestia {
	private long id;
	private String nombre;
	private int nivel;
	
	//Estadisticas 
	private int fuerza;
	private int defensa;
	private int vida;
	private int precision;
	private int velocidad;

	private int exp;
	private int oro;
	
	public Bestia() {}
	
	public Bestia(int f, int d, int hp, int p, int vel, int n, String name, int x, int o){
		this.fuerza = f;
		this.defensa = d;
		this.vida = hp;
		this.precision = p;
		this.velocidad = vel;;
		this.nivel = n;
		this.nombre = name;
		this.exp = x;
		this.oro = o;
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
		return this.nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	
	public int getNivel() {
		return nivel;
	}
	
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	
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
