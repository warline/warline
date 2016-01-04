package es.fdi.iw.model;


public class Ataque {
	
		
		private String nombre;
		private double porcDano;
		private double porcPrecision;
		private long tiempo;
		
		
		public String getNombre() {
			return nombre;
		}
		public double getPorcDano() {
			return porcDano;
		}
		public double getPorcPrecision() {
			return porcPrecision;
		}
		public long getTiempo() {
			return tiempo;
		}
		
		public Ataque(String nombre, double dano, double precision, long tiempo){
			this.nombre = nombre;
			this.porcDano = dano;
			this.porcPrecision = precision;
			this.tiempo = tiempo;
		}
		
		public void setTurnos(long tiempo) {
			this.tiempo = tiempo;
		}
		public Ataque() {
			// TODO Auto-generated constructor stub
		}
		
		
			
		


}
