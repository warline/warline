package es.ucm.model;

import com.google.gson.Gson;

public class Heroe {
	String nombre;
	String email;
	int puntosDeVida;
	
	public static void main(String ... args){
		Heroe h = new Heroe();
		h.nombre = "Luis";
		h.puntosDeVida = 100;
		Gson gson = new Gson();
		System.out.println(gson.toJson(h));
		
		Heroe g = gson.fromJson("{\"nombre\":\"Luis\",\"puntosDeVida\":100}", Heroe.class);
		g.email = "l.u@is";
		System.out.println(gson.toJson(g));
	}
}
