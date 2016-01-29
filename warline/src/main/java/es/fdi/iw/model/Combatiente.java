package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
	@NamedQuery(name="combatiente",
			query="select h from Combatiente h where h.id= :idParam"),
	@NamedQuery(name="delCombatiente",
	query="delete from Combatiente h where h.id= :idParam")
})
public class Combatiente {

	Heroe h;
	double vida;
	long ultimo;
	Ataque ataque;
	long id;
	
	public Combatiente(Heroe h, long ultimo, Ataque ataque) {
		super();
		this.h = h;
		this.h.sumarObjetos();
		this.vida = h.getVida();
		this.ultimo = ultimo;
		if(h.getEspada() != null)
			this.ataque = h.getEspada().getAt1();
		else
			this.ataque = ataque;
		id=h.getId();
	}
	
	@Id
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}


	@OneToOne(targetEntity = Heroe.class, fetch= FetchType.EAGER)
	public Heroe getHeroe() {
		return h;
	}
	public void setHeroe(Heroe h) {
		this.h = h;
	}
	public double getVida() {
		return vida;
	}
	public void setVida(double vida) {
		this.vida = vida;
	}
	public long getUltimo() {
		return ultimo;
	}
	public void setUltimo(long ultimo) {
		this.ultimo = ultimo;
	}
	@OneToOne(targetEntity = Ataque.class, fetch= FetchType.EAGER)
	public Ataque getAtaque() {
		return ataque;
	}
	public void setAtaque(Ataque ataque) {
		this.ataque = ataque;
	}

	public void ataqueAleatorio() {
		int aleaJactaEst = (int) Math.floor(Math.random() * 3);
		
		if(this.h.getEspada() != null){
			
			switch(aleaJactaEst){
			case 0:
				setAtaque(this.h.getEspada().getAt1());
				break;
			case 1:
				setAtaque(this.h.getEspada().getAt2());
				break;
			case 2:
				setAtaque(this.h.getEspada().getAt3());
				break;
			}
		}
	}

	
}
