package es.fdi.iw.model;

import java.util.ArrayList;

public class CombateBestia {

	private Bestia b;

	private double vidaBestia;
	private long tBestia;
	private int t;
	private String ganador;
	private boolean gan;
	private int i;
	private Zascadas resumen;

	public Bestia getB() {
		return b;
	}

	public CombateBestia(Heroe h, Bestia b) {
		this.a = new Combatiente(h, 0, new Ataque("Puñetazo", 80, 100, 400));
		this.b = b;
		this.vidaBestia = b.getVida();
		this.tBestia = 0;
		this.t = 600;
		ganador = "no";
		setGan(false);
		i = 0;
	}

	public static class Golpe {
		private String texto;
		private int dano;

		public Golpe(String texto, int dano) {
			this.texto = texto;
			this.dano = dano;
		}
	}


	private Combatiente a;

	public Combatiente getA() {

		return a;
	}

	public void setA(Combatiente a) {
		this.a = a;
	}

	private static class Zascadas {
		private ArrayList<Golpe> a = new ArrayList<Golpe>();
		private ArrayList<Golpe> b = new ArrayList<Golpe>();

		public void addA(Golpe s) {
			a.add(s);
		}

		public void addB(Golpe s) {
			b.add(s);
		}

		public ArrayList<Golpe> getA() {
			return a;
		}

		public ArrayList<Golpe> getB() {
			return b;
		}
	}

	public void actualizaCombate() {
		// tiempo transcurrido desde la ultima actualizacion del combate
		i++;
		boolean pega = true;
		Zascadas zs = new Zascadas();
		long ta = a.getAtaque().getTiempo() + (a.getUltimo()); // tiempo en el que pegara a.
		// Podríamos restarle la velocidad (milisegundos)
		long tb = b.getAtaque().getTiempo() + (tBestia);
		while (pega && a.getHeroe().getVida() > 0 && vidaBestia > 0) {
			pega = false;
			if (ta <= t * i) {
				pega = true;
				zs.addA(golpe());
				a.setUltimo(ta);
				ta = a.getAtaque().getTiempo() + (a.getUltimo());
			}

			if (tb <= t * i) {
				pega = true;
				zs.addB(zasca());
				tBestia = tb;
				tb = b.getAtaque().getTiempo() + (tBestia);
			}
		}
		
		setResumen(zs);
	}

	public Golpe golpe() {
		Golpe golpe = new Golpe("Fallo", 0);
		int alea = (int) Math.floor(Math.random() * 100);
		if (alea <= (50 + (a.getHeroe().getPrecision() / 2) * (a.getAtaque().getPorcPrecision() / 100))) {
			// vemos si le acierta (con la precision)
			int dano = (int) (a.getHeroe().getFuerza() * a.getAtaque().getPorcDano() / 100); // calcula el daño del ataque
			if(b.getDefensa() / Heroe.MAX_DEFENSA > 0.75)
				dano -= dano*0.75;
			else
				dano -= dano * (b.getDefensa() / Heroe.MAX_DEFENSA); 
			// restamos la defensa del otro personaje
			golpe.texto = a.getAtaque().getNombre();
			if (dano > 0) {
				vidaBestia -= dano;// quitamos la vida correspondiente
				golpe.dano = dano;
				// actualizamos el combate
				hayGanador();
			}
		}
		return golpe;
	}

	public Golpe zasca() {
		Golpe golpe = new Golpe("Fallo", 0);

		int alea = (int) Math.floor(Math.random() * 100);
		if (alea <= (50 + b.getPrecision() / 2)) {// vemos si le acierta (con la
													// precision)
			int dano = (int) (b.getFuerza() * b.getAtaque().getPorcDano()); 
			// calcula el daño del ataque
			if(a.getHeroe().getDefensa() / Heroe.MAX_DEFENSA > 0.75)
				dano -= dano*0.75;
			else
				dano -= dano * (a.getHeroe().getDefensa() / Heroe.MAX_DEFENSA); 
			// restamos la defensa del otro personaje
			golpe.texto = b.getAtaque().getNombre();
			if (dano > 0) {
				a.setVida(a.getVida() - dano);// quitamos la vida correspondiente
				golpe.dano = dano;
				// actualizamos el combate
				hayGanador();
				System.err.println(a.getHeroe().getNombre() + "= " + a.getVida());
			}
		}
		return golpe;
	}

	public void hayGanador() {
		if (a.getVida() <= 0 || vidaBestia <= 0) {
			setGan(true);
			ganador = "bestia";
			if (vidaBestia <= 0) {
				if(a.getVida()<=0 && a.getUltimo() > tBestia){
					ganador = "bestia";
					vidaBestia=1;
				}
				else if(a.getVida()<=0){
					ganador = "heroe";
					a.setVida(1);
				}else
					ganador = "heroe";
			}
			if(ganador == "heroe") vidaBestia=0;
			else if(ganador == "bestia") a.setVida(0);
		}
	}

	
	public String getGanador() {
		return ganador;
	}
	
	public void setGanador(String ganador) {
		this.ganador = ganador;
	}
	
	public boolean isGan() {
		return gan;
	}
	
	public void setGan(boolean gan) {
		this.gan = gan;
	}

	public Zascadas getResumen() {
		return resumen;
	}

	public void setResumen(Zascadas resumen) {
		this.resumen = resumen;
	}

}
