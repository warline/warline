var imagenes=["resources/combates/fotos/fuerte.png",
              "resources/combates/fotos/tanque.png",
              "resources/combates/fotos/rapido.png",
              "resources/combates/fotos/perso.png"];
var a=50;


function pintar(i){
	$("#fizd").attr("src",imagenes[(i-1)%4]);
	$("#fcen").attr("src",imagenes[i%4]);
	$("#imagen").attr("value",imagenes[i%4]);
	$("#fder").attr("src",imagenes[(i+1)%4]);
	
}

window.onload = setTimeout(function(){pintar(a);},200);


function rotarder(){
	 a++;
	pintar(a);
	
}

function rotarizd(){
	a--;
	pintar(a);
	
}