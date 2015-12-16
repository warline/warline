//nivel, vida, defensa fuerza, velocidad precision

var vidaM;
var vidaH;
var combate=false;
const VMAX=100;




function reinicia(h){
	combate=false;
	$(".sangre").css("display","none");
	
	r.vida=vidaM;
	h.vida=vidaH;
	vidaMalo();
	vidaHeroe();

}

function vidaMalo(r){
	if(r.vida<0)r.vida=0;
	$(".vidam").css( "border","3px solid black");
	var caja2=$("#vidamalomax");
	caja2.css("backgroundColor","red");
	
	var caja1=$("#vidamalo");
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.css("font-size","0.5em");
	caja1.text(r.vida+"/"+(vidaM));
	var vidam= r.vida/(vidaM/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");


}


function vidaHeroe(h){
	if(h.vida<0)h.vida=0;
	
	$(".vidah").css("border","3px solid black");
	var caja1=$("#vidaheroe");
	
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.text((h.vida)+"/"+(vidaH));
	var vidam= h.vida/(vidaH/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");

	var caja2=$("#vidaheroemax");
	caja2.css("backgroundColor","red");
}

function iniciaCombate(h,r){
	if(combate==false){
		combate=true;
		lucha(1,h,r);
		vidaH=h.vida;
		vidaM=r.vida;
		coloresInfo(h,r);
	}
}

function lucha(contador,h,r){

	if(combate==true){
		if(r.vida>0&&h.vida>0){
			while(contador%(VMAX-r.velocidad)!=0&&contador%(VMAX-h.velocidad)!=0){
				contador++;
			}
			if(contador%(VMAX-r.velocidad)==0||contador%(VMAX-h.velocidad)==0){
				if(contador%(VMAX-h.velocidad)==0)r.vida-=random(h.fuerza,r.velocidad);
				if(contador%(VMAX-r.velocidad)==0)h.vida-=random(r.fuerza, h.velocidad);
				vidaMalo(r);
				vidaHeroe(h);	
			}
			setTimeout(function(){lucha(contador+1,h,r);},500);
		}
		else{
			combate=false;
			if(r.vida==0)$("#dsangrem").toggle("fast");	
			if(h.vida==0)$("#dsangreh").toggle("fast");
		}
	}
		
}

function random(fuerza,agilidad){
var f=Math.floor(Math.random()*(fuerza/2));

return f+fuerza/2;
}

function coloresInfo(h,r){
	
	$("td").css("color","white");
	if(h.nivel>r.nivel){
		$("#nivelh").css("color","green");
		$("#nivelm").css("color","red");
	}
	else if(h.nivel<r.nivel){
		$("#nivelh").css("color","red");
		$("#nivelm").css("color","green");
	}
	
	
	if(h.vida>r.vida){
		$("#vidah").css("color","green");
		$("#vidam").css("color","red");
	}
	else if(h.vida<r.vida){
		$("#vidah").css("color","red");
		$("#vidam").css("color","green");
	}
	
	
	if(h.defensa>r.defensa){
		$("#defensah").css("color","green");
		$("#defensam").css("color","red");
	}
	else if(h.defensa<r.defensa){
		$("#defensah").css("color","red");
		$("#defensam").css("color","green");
	}
	
	
	if(h.fuerza>r.fuerza){
		$("#fuerzah").css("color","green");
		$("#fuerzam").css("color","red");
	}
	else if(h.fuerza<r.fuerza){
		$("#fuerzah").css("color","red");
		$("#fuerzam").css("color","green");
	}
	
	
	if(h.velocidad>r.velocidad){
		$("#velocidadh").css("color","green");
		$("#velocidadm").css("color","red");
	}
	else if(h.velocidad<r.velocidad){
		$("#velocidadh").css("color","red");
		$("#velocidadm").css("color","green");
	}
	
	
	if(h.precision>r.precision){
		$("#precisionh").css("color","green");
		$("#precisionm").css("color","red");
	}
	else if(h.precision<r.precision){
		$("#precisionh").css("color","red");
		$("#precisionm").css("color","green");
	}
	
		
}





/*function grafo(){
Datos.datasets.nivel.data=[heroe.fuerza,heroe.vida/10,heroe.velocidad,0,0];
Datos.datasets.vida.data=[malo.fuerza,malo.vida/10,malo.velocidad,0,0];
var contexto=document.getElementById("canvas").getContext("2d");
window.Radar= new Chart(contexto).Radar(Datos);

}*/

