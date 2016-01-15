function activarDesactivarBotones(statsHeroe, constantesHeroe) {
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
		
		if (statsHeroe.vida >= constantesHeroe.vida) {
			botonVida.css("visibility","hidden");
		}
		if (statsHeroe.fuerza >= constantesHeroe.fuerza) {
			botonFuerza.css("visibility","hidden");
		}
		if (statsHeroe.precision >= constantesHeroe.precision) {
			botonPrecision.css("visibility","hidden");
		}
		if (statsHeroe.defensa >= constantesHeroe.defensa) {
			botonDefensa.css("visibility","hidden");
		}
		if (statsHeroe.velocidad >= constantesHeroe.velocidad) {
			botonVelocidad.css("visibility","hidden");
		}
	}
}