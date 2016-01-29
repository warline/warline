package es.fdi.iw.model;

public enum TipoItem {
	CASCO("Casco"), 
	ESPADA("Espada"),
	ARMADURA("Armadura"), 
	ESCUDO("Escudo"),
	BOTAS("Botas");
	
	private String nombreTipo;
	
	private TipoItem(String nombreTipo) {
		this.nombreTipo = nombreTipo;
	}
	
	public String getNombreTipo() {
		return this.nombreTipo;
	}
}
