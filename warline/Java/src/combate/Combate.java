package combate;

import java.util.Scanner;

public class Combate {
	private Scanner in = new Scanner(System.in);
	private Arma[] arsenal= new Arma[4];
	private Heroe jugador;
	private Heroe enemigo;
	private static final int VMAX=100;
	private Ataque ae=new Ataque("inicial",0,0,0);
	private Ataque aj=new Ataque("inicial",0,0,0);
	
	
	public Combate(Heroe jugador, Heroe enemigo){
		this.jugador=jugador;
		this.enemigo=enemigo;
	}
	
	public void lucha(int contador, Heroe jugador,Heroe enemigo){
		
		
		
		if(enemigo.getVida()>0&&jugador.getVida()>0){
			while(contador%(VMAX-enemigo.getVelocidad())!=0&&contador%(VMAX-jugador.getVelocidad())!=0){
				contador++;
			}
			if(contador%(VMAX-enemigo.getVelocidad())==0||contador%(VMAX-jugador.getVelocidad())==0){
				
				if(contador%(VMAX-jugador.getVelocidad())==0){
					if(aj.getTurnos()==0 || aj.getTurnos()==1){
						if(aj.getTurnos()==1)
							enemigo.setVida(enemigo.getVida()-jugador.getFuerza()*aj.getPorcDaño());
						seleccionaAtaque(jugador);
						if(aj.getTurnos()==1)
							enemigo.setVida(enemigo.getVida()-jugador.getFuerza()*aj.getPorcDaño());
					}
					
					if(aj.getTurnos()!=1){
						aj.setTurnos(aj.getTurnos()-1);	
						System.out.println(aj.getNombre()+ " en "+ aj.getTurnos());
					}
				}
				if(contador%(VMAX-enemigo.getVelocidad())==0){
					if(ae.getTurnos()==0 || ae.getTurnos()==1){
						if(ae.getTurnos()==1)
							jugador.setVida(jugador.getVida()-enemigo.getFuerza()*ae.getPorcDaño());
						seleccionaAtaque(enemigo);
						if(ae.getTurnos()<=1)
							jugador.setVida(jugador.getVida()-enemigo.getFuerza()*ae.getPorcDaño());  
					}
		
					
					if(ae.getTurnos()!=1){
						ae.setTurnos(ae.getTurnos()-1);
						System.out.println(ae.getNombre()+ " en "+ ae.getTurnos());
					}
				}	
				informacion(jugador, enemigo);
				}
			lucha(contador+1,jugador,enemigo);
		}

	}

	public void asigna(Heroe h1,Heroe h2){
		
		
	}

	public	void informacion(Heroe jugador, Heroe enemigo){
			System.out.println();
			System.out.println("Vida de "+jugador.getNombre()+": "+jugador.getVida()+"                   Vida de "+enemigo.getNombre()+": "+enemigo.getVida());
			System.out.println();
		}
		
	public void seleccionaAtaque(Heroe h){
			Ataque a=new Ataque("m",0,0,0);
			System.out.println("Turno de "+h.getNombre());
			System.out.println("Escoge un ataque");
			String c=in.nextLine();
			if(c.equals("0"))
				a=h.getDerecha().getAtaques()[0];
			else if(c.equals("1"))
				a=h.getDerecha().getAtaques()[1];
			else if(c.equals("2"))
				a=h.getDerecha().getAtaques()[2];
			
			if(h.equals(jugador)){
				aj=a;
			}
			else
				ae=a;
		}
}
