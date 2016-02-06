function apareceArmeria(id, fuerza, defensa, velocidad, precision, nivel, vida, precio, tipo, nombre){
	$(".descripcion").show();
	
    $("#idFuerza").text("Fuerza: " + fuerza);
    $("#idDefensa").text("Defensa: " + defensa);
    $("#idVelocidad").text("Velocidad: " + velocidad);
    $("#idPrecision").text("Precisión: " + precision);
    $("#idNivel").text("Nivel: " + nivel);
    $("#idVida").text("Vida: " + vida);
    $("#idPrecio").text("Precio: " + precio + " monedas");
    $("#idTipo").text("Tipo: " + tipo);
    $("#idNombre").text(nombre);
    $("#idFoto").attr("src", "objeto/photo?id=" + id);
}
