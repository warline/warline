package combate;

public class Ataque {
	
		
		private String nombre;
		private double porcDano;
		private double porcPrecision;
		private int turnos;
		
		
		public String getNombre() {
			return nombre;
		}
		public double getPorcDaño() {
			return porcDano;
		}
		public double getPorcPrecision() {
			return porcPrecision;
		}
		public int getTurnos() {
			return turnos;
		}
		
		public Ataque(String nombre, double dano, double precision, int turnos){
			this.nombre = nombre;
			this.porcDano = dano;
			this.porcPrecision = precision;
			this.turnos = turnos;
		}
		
		public void setTurnos(int turnos) {
			this.turnos = turnos;
		}
		public Ataque() {
			// TODO Auto-generated constructor stub
		}
		
		
			
		


}
