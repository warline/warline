package es.fdi.iw.model;

public class Combate {
	
	private double vidaM;
	private double vidaH;
	private boolean combate=false;
	private final int VMAX=250;

	

	public	void iniciaCombate(Heroe h,Bestia r){
		if(combate==false){
			combate=true;
			lucha(1,h,r);
		}
	}

	private void lucha(int contador,Heroe h, Bestia r){

		if(combate==true){
			if(r.getVida()>0&&h.getVida()>0){
				while(contador%(VMAX-r.getVelocidad())!=0&&contador%(VMAX-h.getVelocidad())!=0){
					contador++;
				}
				if(contador%(VMAX-r.getVelocidad())==0||contador%(VMAX-h.getVelocidad())==0){
					if(contador%(VMAX-h.getVelocidad())==0)r.setVida(r.getVida() - random(h.getFuerza(),r.getVelocidad()));
					if(contador%(VMAX-r.getVelocidad())==0)h.setVida(h.getVida() - random(r.getFuerza(), h.getVelocidad()));
					
						try {
							Thread.sleep(500);
						} catch (InterruptedException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				}
				lucha(contador+1,h,r);
			}
			/*else{
				combate=false;
				if(r.vida==0)$("#dsangrem").toggle("fast");	
				if(h.vida==0)$("#dsangreh").toggle("fast");
			}
			*/
		}
			
	}

	int random(int fuerza, int agilidad){
	int f=(int) Math.floor(Math.random()*(fuerza/2));

	return f+fuerza/2;
	}


}
