package main;
import combate.*;

import java.util.Scanner;



public class Main {

public static void main(String[] args){
	
	Arma[] arsenal= new Arma[4];
	Heroe jugador;
	Heroe enemigo;
	Combate c;
	arsenal[0]=new Espada("Espada Corta",15,10,0,0);//daño,precision,vida, velocidad
	arsenal[1]=new Escudo("Escudo de Metal",0,15,20,-5);
	arsenal[2]=new Daga("Daga de Asesino",5,15,0,10);
	arsenal[3]=new Martillo("Mjölnir",25,10,0,-15);
	jugador= new Heroe("Thor",30 , 205, 30);
	jugador.setDerecha(arsenal[3]);
	enemigo= new Heroe("Loki",15 , 205, 30);
	enemigo.setDerecha(arsenal[2]);
	enemigo.setIzquierda(arsenal[2]);
	c=new Combate(jugador, enemigo);
	c.informacion(jugador, enemigo);
	c.lucha(1,jugador, enemigo);
}



		
}

