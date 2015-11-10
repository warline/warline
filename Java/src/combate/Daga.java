package combate;

public class Daga extends Arma{
	public Daga(String nombre,int dano, int prec, int vida, int veloc){
		super(nombre,dano,prec,vida,veloc);
		Ataque[] ataques=new Ataque[3];
		ataques[0]=new Ataque("Tajo Lateral",0.5,1,1);
		ataques[1]=new Ataque("Revés",0.7,0.7,1);
		ataques[2]=new Ataque("Puñalada",0.9,0.5,2);
		
		this.setAtaques(ataques);
	}
}
