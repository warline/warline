package combate;

public class Martillo extends Arma{
	public Martillo(String nombre,int dano, int prec, int vida, int veloc){
		super(nombre,dano,prec,vida,veloc);
		Ataque[] ataques=new Ataque[3];
		ataques[0]=new Ataque("Golpe Lateral",0.5,1,2);
		ataques[1]=new Ataque("Golpe Vertical",0.7,0.7,2);
		ataques[2]=new Ataque("Torbellino",0.9,0.5,2);
		
		this.setAtaques(ataques);
	}
}
