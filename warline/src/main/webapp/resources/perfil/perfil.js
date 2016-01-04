function activarDesactivarBotones(vid, fue, prec, def, vel, puntHab) {
	var botonVida=$("#subirVida");
	var botonFuerza=$("#subirFuerza");
	var botonPrecision=$("#subirPrecision");
	var botonDefensa=$("#subirDefensa");
	var botonVelocidad=$("#subirVelocidad");
	
	if (puntHab == 0) {
		botonVida.css("visibility","hidden");
		botonFuerza.css("visibility","hidden");
		botonPrecision.css("visibility","hidden");
		botonDefensa.css("visibility","hidden");
		botonVelocidad.css("visibility","hidden");
	} else {
		
		if (vid >= 'Heroe.MAX_VIDA') {
			botonVida.css("visibility","hidden");
		}
		if (fue >= Heroe.MAX_FUERZA) {
			botonFuerza.css("visibility","hidden");
		}
		if (prec >= Heroe.MAX_PRECISION) {
			botonPrecision.css("visibility","hidden");
		}
		if (def >= Heroe.MAX_DEFENSA) {
			botonDefensa.css("visibility","hidden");
		}
		if (vel >= Heroe.MAX_VELOCIDAD) {
			botonVelocidad.css("visibility","hidden");
		}
	}
}