package arcade;

import java.util.ArrayList;

public class Arcade {
	private ArrayList<Bestia> lista;
	
	public Arcade(){
		lista = new ArrayList<Bestia>();
	}
	
	public boolean anadirBestia(int f, int d, int vid, int p, int vel, int n, String name, int x, int o){
		Bestia b = new Bestia(f, d, vid, p, vel, n, name, x, o);
		
		return lista.add(b);
	}
	
	public void eliminarBestia(String bestia){
		
		for(int i=0; i<lista.size();i++)
			if(bestia.equals(lista.get(i).getNombre()))
				lista.remove(i);
			
	}
	
	public void modificarBestia(int f, int d, int vid, int p, int vel, int n, String name, int x, int o){
		int i = buscaBestia(name);
		Bestia b = lista.get(i);
		
		if(f != 0)
			b.setFuerza(f);
		if(d != 0)
			b.setDefensa(d);
		if(vid != 0)
			b.setVida(vid);
		if(p != 0)
			b.setPrecision(p);
		if(vel != 0)
			b.setVelocidad(vel);
		if(n != 0)
			b.setNivel(n);
		if(!name.equals(""))
			b.setNombre(name);
		if(x != 0)
			b.setExp(x);
		if(o != 0)
			b.setOro(o);
		
		lista.set(i, b);
	}

	private int buscaBestia(String name) {
		int i=0;
		boolean encontrado=false;
		
		while(!encontrado && i<lista.size()){
			if(lista.get(i).getNombre().equals(name)){
				encontrado=true;
			}
		}
		
		return i;
	}


}
