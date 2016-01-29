var imagenes=["resources/combates/fotos/aethyr-second.png",
              "resources/combates/fotos/aiglondur.png",
              "resources/combates/fotos/cloaked.png",
              "resources/combates/fotos/galtrid.png",
              "resources/combates/fotos/haldric-mad.png",
              "resources/combates/fotos/jetto.png",
              "resources/combates/fotos/karrag.png",
              "resources/combates/fotos/olurf.png",
              "resources/combates/fotos/sir-gerrick.png"];
var a;
var numPhotos = 9;

function pintarIni(){
	a = numPhotos *10; 
	pintar(a);
}

function pintar(i){
	a=i;
	$("#fizd").attr("src",imagenes[(i-1)%numPhotos]);
	$("#fcen").attr("src",imagenes[i%numPhotos]);
	$("#imagen").attr("value",imagenes[i%numPhotos]);
	$("#fder").attr("src",imagenes[(i+1)%numPhotos]);
}


function rotarder(){
	a++;
	pintar(a);
	
}

function rotarizd(){
	a--;
	if(a <= numPhotos){
	   a = numPhotos *10;
	}
	pintar(a);
	
}