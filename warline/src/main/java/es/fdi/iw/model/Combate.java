package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
	@NamedQuery(name="combate",
			query="select h from Combate h where h.id= :idParam"),
	@NamedQuery(name="delCombate",
	query="delete from Combate h where h.id= :idParam")
})
public class Combate {
	
	long id;
	private Combatiente a;
	private Combatiente b;
	long ultimo;

	public long getUltimo() {
		return ultimo;
	}
	public void setUltimo(long ultimo) {
		this.ultimo = ultimo;
	}
	public Combate(Heroe a, Heroe b) {
		super();
		
		this.a = new Combatiente(a, a.getVida(),0,new Ataque());
		this.b = new Combatiente(b, b.getVida(),0,new Ataque());;
		this.ultimo=System.currentTimeMillis();
	}
	
public	void intercambio(){
		long dt=1000-ultimo;					//tiempo transcurrido desde la ultima actualizacion del combate
		boolean pega=true;
		while(pega && a.getHeroe().getVida()>0 && b.getHeroe().getVida()>=0){
			pega=false;
			long da=ultimo-a.getUltimo();			//tiempo en el que a pego por ultima vez
			long db= ultimo-b.getUltimo();			//tiempo en el que b pego por ultima vez
			long ta= a.getAtaque().getTiempo()-da;	//tiempo en el que pegara a
			long tb= b.getAtaque().getTiempo()-db;	//tiempo en el que pegara a
			if(ta<=dt){
				pega=true;
				zasca(a.getHeroe(),a.getAtaque(),b.getHeroe());
				a.setUltimo(ta);
			}
			if(tb<=dt){
				pega=true;
				zasca(b.getHeroe(),b.getAtaque(),a.getHeroe());
				a.setUltimo(ta);
			}
		}		
	}
	
	void zasca(Heroe p, Ataque a, Heroe b){	
		int alea = (int) Math.floor(Math.random()*100);
		if(alea<= (50+p.getPrecision()/2)*a.getPorcPrecision()/100){//vemos si le acierta (con la precision)
			int dano= (int) (p.getFuerza()*a.getPorcDano()); //calcula el daño del ataque
			dano-=b.getDefensa(); //restamos la defensa del otro personaje
			b.setVida(b.getVida()-dano);//quitamos la vida correspondiente
			//actualizamos el combate
		}
		else{
			//golpe fallido
		}
	}
	
	@OneToOne(targetEntity = Combatiente.class, fetch= FetchType.EAGER)
	public Combatiente getA() {
		return a;
	}
	public void setA(Combatiente a) {
		this.a = a;
	}
	
	@OneToOne(targetEntity = Combatiente.class, fetch= FetchType.EAGER)
	public Combatiente getB() {
		return b;
	}
	public void setB(Combatiente b) {
		this.b = b;
	}
	@Id
	@GeneratedValue
	long getId(){
		return id;
	}
	
	void setId(long id){
		this.id=id;
	}
	
	
}
	

