package es.fdi.iw.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

@Entity
@NamedQueries({
	@NamedQuery(name="allHeroes",
            query="select h from Heroe h"),
	@NamedQuery(name="miHeroe",
			query="select h from Heroe h where h.id= :idParam"),
	@NamedQuery(name="delHeroe",
		query="delete from Heroe h where h.id= :idParam"),
	@NamedQuery(name="topDiez",
			query = "select h from Heroe h Order By nivel Desc"),
	@NamedQuery(name="todosMenosYo",
    	query="select h from Heroe h where h.id!= :yo"),
    @NamedQuery(name="buscarHeroe",
		query="select h from Heroe h where h.nombre= :nombreParam")
})
public class Heroe {
	public static int NUM_ITEMS_EQUIP = 5;
	public static int TAM_INVENT = 25;
	public static double MAX_VIDA = 1000;
	public static double MAX_DEFENSA = 500;
	public static int MAX_FUERZA = 500;
	public static int MAX_VELOCIDAD = 250;
	public static int MAX_PRECISION = 100;
	public static int MAX_NIVEL = 100;
	
	public static double VIDA_POR_PUNTO = 10;
	public static int DEF_POR_PUNTO = 1;
	public static int FUE_POR_PUNTO = 1;
	public static int VEL_POR_PUNTO = 1;
	public static int PREC_POR_PUNTO = 1;

	/* La xp necesaria para subir de nivel es 200*nivelActual 
	 * es decir para subir del 3 al 4 se necesita 600 xp */

	public static int XP_POR_NIVEL = 100;
	private int expSiguienteNivel;

	
	public int getExpSiguienteNivel() {
		return expSiguienteNivel;
	}

	public void setExpSiguienteNivel(int expSiguienteNivel) {
		this.expSiguienteNivel = expSiguienteNivel;
	}

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
	private List<Item> inventario; //id de objetos en el inventario
	
	
	private Item casco;
	private Item espada;
	private Item armadura;
	private Item escudo;
	private Item botas;
	
	
	public Heroe() {}

	public Heroe(String nombre) {
		this.nombre = nombre;
		this.vida = 100;
		this.defensa = 10;
		this.fuerza = 10;
		this.velocidad = 20;
		this.precision = 30;
		this.inventario = new ArrayList<Item>(TAM_INVENT);
		this.nivel = 1;
		this.oro = 200;
		this.xp = 0;
		this.puntosHab = 10;
		this.expSiguienteNivel=XP_POR_NIVEL;
		
		this.casco = null;
		this.espada = null;
		this.armadura = null;
		this.escudo = null;
		this.botas = null;
		
	}
	
	public Heroe(Heroe h){
		this.nombre = h.getNombre();
		this.vida = h.getVida();
		this.defensa = h.getDefensa();
		this.fuerza = h.getFuerza();
		this.velocidad = h.getVelocidad();
		this.precision = h.getPrecision();
		this.inventario = new ArrayList<Item>(TAM_INVENT);
		this.nivel = h.getNivel();
		this.oro = 200;
		this.xp = 0;
		this.puntosHab = 10;
		this.expSiguienteNivel=XP_POR_NIVEL;
		
		this.casco = h.getCasco();
		this.espada = h.getEspada();
		this.armadura = h.getArmadura();
		this.escudo = h.getEscudo();
		this.botas = h.getBotas();
	}
	
	public void sumarObjetos(){
		if(casco != null) sumarItem(casco);
		if(espada != null) sumarItem(espada);
		if(armadura != null) sumarItem(armadura);
		if(escudo != null) sumarItem(escudo);
		if(botas != null) sumarItem(botas);
	}
	
	@ManyToOne(targetEntity = Item.class, fetch= FetchType.EAGER)
	public Item getCasco() {
		return casco;
	}

	public void setCasco(Item casco) {
		this.casco = casco;
		
	}
	public void sumarItem(Item i){
		fuerza+= i.getFuerza();
		vida+= i.getVida();
		defensa+= i.getDefensa();
		velocidad+= i.getVelocidad();
		precision+= i.getPrecision();
	}

	@ManyToOne(targetEntity = Item.class, fetch= FetchType.EAGER)
	public Item getEspada() {
		return espada;
	}

	public void setEspada(Item espada) {
		this.espada = espada;
	}

	@ManyToOne(targetEntity = Item.class, fetch= FetchType.EAGER)
	public Item getArmadura() {
		return armadura;
	}

	public void setArmadura(Item armadura) {
		this.armadura = armadura;
	}

	@ManyToOne(targetEntity = Item.class, fetch= FetchType.EAGER)
	public Item getEscudo() {
		return escudo;
	}

	public void setEscudo(Item escudo) {
		this.escudo = escudo;
	}
	
	@ManyToOne(targetEntity = Item.class, fetch= FetchType.EAGER)
	public Item getBotas() {
		return botas;
	}

	public void setBotas(Item botas) {
		this.botas = botas;
	}
	
	
	public void desequiparItem(Item i){
		switch(i.getTipo()){
		case CASCO:
			this.casco = null;
			break;
		case ESPADA:
			this.espada = null;
			break;
		case ARMADURA:
			this.armadura = null;
			break;
		case ESCUDO:
			this.escudo = null;
			break;
		case BOTAS:
			this.botas = null;
			break;
		}
		inventario.add(i);
	}

	public void equiparItem(Item i){
		Item viejo = null;
		switch(i.getTipo()){
		case CASCO:
			viejo = this.casco;
			this.casco = i;
			break;
		case ESPADA:
			viejo = this.espada;
			this.espada = i;
			break;
		case ARMADURA:
			viejo = this.armadura;
			this.armadura = i;
			break;
		case ESCUDO:
			viejo = this.escudo;
			this.escudo = i;
			break;
		case BOTAS:
			viejo = this.botas;
			this.botas = i;
			break;
		}
		inventario.remove(i);
		if(viejo != null)
			inventario.add(viejo);
	}

	public static String getJsonConstants() {
		return  "{\"MAX_VIDA\" : " + MAX_VIDA + ","
				+"\"MAX_DEFENSA\" : " +  MAX_DEFENSA + ","
				+"\"MAX_FUERZA\" : " + MAX_FUERZA + ","
				+"\"MAX_VELOCIDAD\" : " + MAX_VELOCIDAD + ","
				+"\"MAX_PRECISION\" : " + MAX_PRECISION + "}";
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

	@ManyToMany(targetEntity = Item.class, fetch= FetchType.EAGER)
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

	public void comprarObjeto(Item i) throws Exception{
		if (this.oro < i.getPrecio()) {
			throw new Exception("No tienes dinero suficiente.");
		} else if (this.inventario.size() >= TAM_INVENT) {
			throw new Exception("No tienes hueco en el inventario.");
		} else if (this.nivel < i.getNivel()) {
			throw new Exception("No tienes nivel suficiente para comprar este objeto.");
		} else {
			inventario.add(i);
			this.oro -= i.getPrecio();
		}
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
	
	public boolean recompensa(Bestia b){
		boolean recompensa=false;
		oro+=b.getOro();
		double alea = Math.floor(Math.random() * 100);
		if(alea<=b.getPorcRecompensa() && this.inventario.size() <= TAM_INVENT){
			inventario.add(b.getRecompensa()); 
			recompensa=true;
		} 
		subirExp(b.getExp());
		return recompensa;
	}

	private void subirExp(int exp){
		xp+=exp;
		if(xp>=expSiguienteNivel){
			xp-=expSiguienteNivel;
			nivel++;
			expSiguienteNivel=XP_POR_NIVEL*nivel;
			puntosHab+=10;
		}
	}

	public int recompensaHeroes(Heroe r){
		if(this.nivel <= r.getNivel()){
			subirExp((r.getNivel())*40);
			return r.getNivel()*40;
		}
		return 0;		
	}
	
	
}//Fin de clase
