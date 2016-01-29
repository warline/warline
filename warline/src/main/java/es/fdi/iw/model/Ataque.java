package es.fdi.iw.model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;

@Entity
public class Ataque {
		private String nombre;
		private double porcDano;
		private double porcPrecision;
		private long tiempo;
		private long id;
		
		@Id
		@GeneratedValue
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getNombre() {
			return nombre;
		}
		public double getPorcDano() {
			return porcDano;
		}
		public void setTiempo(long tiempo) {
			this.tiempo = tiempo;
		}
		public void setPorcDano(double porcDano) {
			this.porcDano = porcDano;
		}
		public void setPorcPrecision(double porcPrecision) {
			this.porcPrecision = porcPrecision;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
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
		
		public Ataque() {
			// TODO Auto-generated constructor stub
		}	
}
