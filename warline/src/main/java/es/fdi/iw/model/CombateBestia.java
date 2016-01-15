package es.fdi.iw.model;

public class CombateBestia {
private Combatiente a;
private Bestia b;
private double vidaBestia;
private int tBestia;
private int t;
 
public CombateBestia(Heroe h, Bestia b){
	this.a=new Combatiente(h,h.getVida(),0, new Ataque());
	this.b=b;
	this.vidaBestia=b.getVida();
	this.tBestia=0;
	this.t=1000;
}

public void intercambio(){
	//tiempo transcurrido desde la ultima actualizacion del combate
	boolean pega=true;
	while(pega && a.getHeroe().getVida()>0 && vidaBestia>0){
		pega=false;
		
		long ta= a.getAtaque().getTiempo()-a.getUltimo();	//tiempo en el que pegara a
		long tb= 1000/b.getVelocidad()-tBestia;	//tiempo en el que pegara a
		if(ta<=t){
			pega=true;
			golpe();
			a.setUltimo(t-ta);
		}
		if(tb<=t){
			pega=true;
			zasca();
			tBestia=t-tBestia;
		}
	}		
}

String golpe(){	
	int alea = (int) Math.floor(Math.random()*100);
	if(alea<= (50+a.getHeroe().getPrecision()/2)*a.getAtaque().getPorcPrecision()/100){//vemos si le acierta (con la precision)
		int dano= (int) (a.getHeroe().getFuerza()*a.getAtaque().getPorcDano()); //calcula el daño del ataque
		dano-=b.getDefensa(); //restamos la defensa del otro personaje
		vidaBestia-=dano;//quitamos la vida correspondiente
		//actualizamos el combate
	}
	else{
		//golpe fallido
	}
	return null;
}

void zasca(){
	int alea = (int) Math.floor(Math.random()*100);
	if(alea<= (50+b.getPrecision()/2)/100){//vemos si le acierta (con la precision)
		int dano= (int) (b.getFuerza()); //calcula el daño del ataque
		dano-=a.getHeroe().getDefensa(); //restamos la defensa del otro personaje
		a.setVida(b.getVida()-dano);//quitamos la vida correspondiente
		//actualizamos el combate
	}
	else{
		//golpe fallido
	}
}


}

