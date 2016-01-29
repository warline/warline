/*function aparece(datosObjeto){
    	
	$(".descripcion").show(); 
	
    $("#idFuerza").text("Fuerza: " + datosObjeto.fuerza);
    $("#idDefensa").text("Defensa: " + datosObjeto.defensa);
    $("#idVelocidad").text("Velocidad: " + datosObjeto.velocidad);
    $("#idPrecision").text("Precisión: " + datosObjeto.precision);
    $("#idNivel").text("Nivel: " + datosObjeto.nivel);
    $("#idVida").text("Vida: " + datosObjeto.vida);
    $("#idPrecio").text("Precio: " + datosObjeto.precio + " monedas");
    $("#idTipo").text("Tipo: " + datosObjeto.tipo);
    $("#idNombre").text(datosObjeto.nombre);
    $("#idFoto").attr("src", "objeto/photo?id=" + datosObjeto.id);
}
*/
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
