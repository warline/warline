package combate;

public class Escudo extends Arma{
	public Escudo(String nombre,int dano, int prec, int vida, int veloc){
		super(nombre,dano,prec,vida,veloc);
		Ataque[] ataques=new Ataque[3];
		ataques[0]=new Ataque("Golpe Frontal",0.5,0.9,2);
		ataques[1]=new Ataque("Bloqueo",0.7,0.7,2);
		ataques[2]=new Ataque("Golpe de Canto",0.9,0.5,2);
		
		this.setAtaques(ataques);
	}
}
