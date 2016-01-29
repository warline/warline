function activarDesactivarBotones(statsHeroe, constantesHeroe) {
	var botonVida=$("#subirVida");
	var botonFuerza=$("#subirFuerza");
	var botonPrecision=$("#subirPrecision");
	var botonDefensa=$("#subirDefensa");
	var botonVelocidad=$("#subirVelocidad");
	
	if (statsHeroe.puntosHab == 0) {
		botonVida.css("visibility","hidden");
		botonFuerza.css("visibility","hidden");
		botonPrecision.css("visibility","hidden");
		botonDefensa.css("visibility","hidden");
		botonVelocidad.css("visibility","hidden");
	} else {
		
		if (statsHeroe.vida >= constantesHeroe.MAX_VIDA) {
			botonVida.css("visibility","hidden");
		}
		if (statsHeroe.fuerza >= constantesHeroe.MAX_FUERZA) {
			botonFuerza.css("visibility","hidden");
		}
		if (statsHeroe.precision >= constantesHeroe.MAX_PRECISION) {
			botonPrecision.css("visibility","hidden");
		}
		if (statsHeroe.defensa >= constantesHeroe.MAX_DEFENSA) {
			botonDefensa.css("visibility","hidden");
		}
		if (statsHeroe.velocidad >= constantesHeroe.MAX_VELOCIDAD) {
			botonVelocidad.css("visibility","hidden");
		}
	}
}


function aparecePerfil(e, id, fuerza, defensa, velocidad, precision, nivel, vida, precio, tipo, nombre){
	var x = e.clientX;
    var y = e.clientY;
    $(".descripcion").show();
    $("#panelInfo").css({"left": x-10, "top": y+10});
    
    $(".descripcion").show();
	$( document ).tooltip();
	$("#idFuerza").text("Fuerza: " + fuerza);
    $("#idDefensa").text("Defensa: " + defensa);
    $("#idVelocidad").text("Velocidad: " + velocidad);
    $("#idPrecision").text("Precisión: " + precision);
    $("#idNivel").text("Nivel: " + nivel);
    $("#idVida").text("Vida: " + vida);
    $("#idPrecio").text("Precio: " + precio + " monedas");
    $("#idTipo").text("Tipo: " + tipo.toLowerCase());
    $("#idNombre").text(nombre);
    $("#idFoto").attr("src", "objeto/photo?id=" + id);
}

function desaparecePerfil(){
	$(".descripcion").hide(); 
}