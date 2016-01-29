package es.fdi.iw.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
	private Ataque ataque;
	
	//Estadisticas 
	private int fuerza;
	private int defensa;
	private double vida;
	private int precision;
	private int velocidad;

	private int exp;
	private int oro;
	
	public Bestia() {}
	
	public Bestia(int f, int d, double hp, int p, int vel, int n, String name, int x, int o){
		this.fuerza = f;
		this.defensa = d;
		this.vida = hp;
		this.precision = p;
		this.velocidad = vel;;
		this.nivel = n;
		this.nombre = name;
		this.exp = x;
		this.oro = o;
		ataque=new Ataque("Mordisco",1,1,1);
	}
	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	@ManyToOne(targetEntity = Ataque.class, fetch= FetchType.EAGER)
	
	public Ataque getAtaque() {
		return ataque;
	}

	public void setAtaque(Ataque ataque) {
		this.ataque = ataque;
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
	
	public double getVida() {
		return vida;
	}
	
	public void setVida(double vida) {
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

	public void modificar(Bestia copia){
		nombre = copia.nombre;
		nivel = copia.nivel;
		fuerza = copia.fuerza;
		defensa = copia.defensa;
		vida = copia.vida;
		precision = copia.precision;
		velocidad = copia.velocidad;
		exp = copia.exp;
		oro = copia.oro;
	}

}
