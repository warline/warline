package es.fdi.iw.model;

import javax.persistence.Entity;


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
	public Combate(Personaje a, Personaje b) {
		super();
		
		this.a = new Combatiente(a, a.getVida(),0,new Ataque());
		this.b = new Combatiente(b, b.getVida(),0,new Ataque());;
		this.ultimo=0;
	}
	
	void intercambio(){
		long dt=1000-ultimo;					//tiempo transcurrido desde la ultima actualizacion del combate
		boolean pega=true;
		while(pega && a.getPerso().getVida()>0 && b.getPerso().getVida()>=0){
			pega=false;
			long da=ultimo-a.getUltimo();			//tiempo en el que a pego por ultima vez
			long db= ultimo-b.getUltimo();			//tiempo en el que b pego por ultima vez
			long ta= a.getAtaque().getTiempo()-da;	//tiempo en el que pegara a
			long tb= b.getAtaque().getTiempo()-db;	//tiempo en el que pegara a
			if(ta<=dt){
				pega=true;
				zasca(a.getPerso(),a.getAtaque(),b.getPerso());
				a.setUltimo(ta);
			}
			if(tb<=dt){
				pega=true;
				zasca(b.getPerso(),b.getAtaque(),a.getPerso());
				a.setUltimo(ta);
			}
		}		
	}
	
	void zasca(Personaje p, Ataque a, Personaje b){	
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
	
}
	

