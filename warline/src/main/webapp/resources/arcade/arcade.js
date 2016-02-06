function elige(id, nombre, oro, experiencia, nivel){
	$("button").attr("value",id);
	$(".descripcion").show();
	
    $("#idNombre").text(nombre);
    $("#idOro").text(oro);
    $("#idExperiencia").text(experiencia);
    $("#idNivel").text(nivel);
}