function mostrarVidas(combate){
	vidaHeroe(combate);
	vidaMalo(combate);
	coloresInfo(combate);
	if(combate.a.h.espada) ataques(combate.a.h);
	else $("#ataques").css("display", "none");
}

var vidaM;
var vidaH;
var combate=false;
const VMAX=100;

function vidaMalo(comb){
	$(".vidam").css( "border","3px solid black");
	var caja2=$("#vidamalomax");
	caja2.css("backgroundColor","red");
	
	var caja1=$("#vidamalo");
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.css("font-size","0.5em");
	caja1.text(comb.vidaBestia+"/"+comb.b.vida);
	
	
	//console.log("golpe es", comb);
	var vidam= comb.vidaBestia/(comb.b.vida/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");
	if(comb.vidaBestia<=0){
		setTimeout(function(){
			if(comb.recompensa){
				$("#filarecompensa").show();
				$("#recompensa").css("height","300px");
			}
			else{
				$("#filarecompensa").hide();
				$("#recompensa").css("height","200px");
			}
			$("#recompensa").show();
		},600);
		$("#dsangrem").css("display","inline");
	}
}

function ataques(heroe){
	$("#ataques").css("display", "block");
	$("#ataq1").attr("value", heroe.espada.at1.id);
	$("#ataq2").attr("value", heroe.espada.at2.id);
	$("#ataq3").attr("value", heroe.espada.at3.id);
	$("#ataq1").text(heroe.espada.at1.nombre);
	$("#ataq2").text(heroe.espada.at2.nombre);
	$("#ataq3").text(heroe.espada.at3.nombre);
}


function vidaHeroe(comb){
	
	$(".vidah").css("border","3px solid black");
	var caja1=$("#vidaheroe");
	
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");

	caja1.text(comb.a.vida+"/"+comb.a.h.vida);
	var vidam= comb.a.vida/(comb.a.h.vida/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");

	var caja2=$("#vidaheroemax");
	caja2.css("backgroundColor","red");
	if(comb.a.vida<=0)$("#dsangreh").css("display","inline");
}

function textoFlota(res){

	for(var i=0; i<res.a.length; i++){
		$(".imgh").animate({left: "300px"}, 300/res.a.length);
		$(".imgh").animate({left: "100px"}, 300/res.a.length);
		var textoF = $("#textoMalo");
		textoF.animate({top: "300px", opacity: 1}, 3/res.a.length);
		textoF.text(res.a[i].texto + " (-" + res.a[i].dano + ")");
		textoF.animate({top: "150px", opacity: 0.5}, 600/res.a.length);
		textoF.animate({ opacity: 0}, 100/res.a.length);
	}
	for(var j=0; j<res.b.length; j++){
		$(".imgm").animate({left: "-100px"}, 300/res.b.length);
		$(".imgm").animate({left: "100px"}, 300/res.b.length);
		var textoF = $("#textoBueno");
		textoF.animate({top: "300px", opacity: 1}, 3/res.b.length);
		textoF.text(res.b[j].texto + " (-" + res.b[j].dano + ")");
		textoF.animate({top: "150px", opacity: 0.5}, 600/res.b.length);
		textoF.animate({ opacity: 0}, 100/res.b.length);
	}
}

function coloresInfo(comb){
	
	$("#nivelh").text("Nivel: " + comb.a.h.nivel);
	$("#nivelm").text("Nivel: " + comb.b.nivel);
	$("#vidah").text("Vida: " + comb.a.h.vida);
	$("#vidam").text("Vida: " + comb.b.vida);
	$("#defensah").text("Defensa: " + comb.a.h.defensa);
	$("#defensam").text("Defensa: " + comb.b.defensa);
	$("#fuerzah").text("Fuerza: " + comb.a.h.fuerza);
	$("#fuerzam").text("Fuerza: " + comb.b.fuerza);
	$("#precisionh").text("Precision: " + comb.a.h.precision);
	$("#precisionm").text("Precision: " + comb.b.precision);
	$("#velocidadh").text("Velocidad: " + comb.a.h.velocidad);
	$("#velocidadm").text("Velocidad: " + comb.b.velocidad);
	
	$("td").css("color","white");
	if(comb.a.h.nivel>comb.b.nivel){
		$("#nivelh").css("color","green");
		$("#nivelm").css("color","red");
	}
	else if(comb.a.h.nivel<comb.b.nivel){
		$("#nivelh").css("color","red");
		$("#nivelm").css("color","green");
	}
	
	
	if(comb.a.h.vida>comb.b.vida){
		$("#vidah").css("color","green");
		$("#vidam").css("color","red");
	}
	else if(comb.a.h.vida<comb.b.vida){
		$("#vidah").css("color","red");
		$("#vidam").css("color","green");
	}
	
	
	if(comb.a.h.defensa>comb.b.defensa){
		$("#defensah").css("color","green");
		$("#defensam").css("color","red");
	}
	else if(comb.a.h.defensa<comb.b.defensa){
		$("#defensah").css("color","red");
		$("#defensam").css("color","green");
	}
	
	
	if(comb.a.h.fuerza>comb.b.fuerza){
		$("#fuerzah").css("color","green");
		$("#fuerzam").css("color","red");
	}
	else if(comb.a.h.fuerza<comb.b.fuerza){
		$("#fuerzah").css("color","red");
		$("#fuerzam").css("color","green");
	}
	
	
	if(comb.a.h.velocidad>comb.b.velocidad){
		$("#velocidadh").css("color","green");
		$("#velocidadm").css("color","red");
	}
	else if(comb.a.h.velocidad<comb.b.velocidad){
		$("#velocidadh").css("color","red");
		$("#velocidadm").css("color","green");
	}
	
	
	if(comb.a.h.precision>comb.b.precision){
		$("#precisionh").css("color","green");
		$("#precisionm").css("color","red");
	}
	else if(comb.a.h.precision<comb.b.precision){
		$("#precisionh").css("color","red");
		$("#precisionm").css("color","green");
	}
	
}

function cambioAtaque(at){
		$("#seleccionado").attr("value", at);
}