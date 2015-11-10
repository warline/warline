//nivel, vida, defensa fuerza, velocidad precision
var malo=[0,0,0,0,0,0];
var heroe=[0,0,0,0,0,0];
var heroe0=[0,0,0,0,0,0];
const heroe1=[2,205,5,30,15,20];
const heroe2=[2,165,2,15,65,15];
const heroe3=[2,500,8,15,8,20];
var pe=0;
var pem=0;
var vidaM;
var vidaH;
var combate=false;
const VMAX=100;

/*var Datos={
	labels:["Fuerza","Vida","Velocidad","Defensa","Agilidad"],
	datasets:[
		{
		fillColor:"rgba(0,220,0,0.5)",
		strokeColor: "rgba(0,220,0,0.8)",
		highlightFill:"rgba(0,220,0,0.75)",
		highlightStroke:"rgba(0,220,0,1)",
		data:[0,0,0,0,0]	
		},
		
		{
		fillColor:"rgba(220,0,0,0.5)",
		strokeColor: "rgba(220,0,0,0.8)",
		highlightFill:"rgba(220,0,0,0.75)",
		highlightStroke:"rgba(220,0,0,1)",
		data:[0,0,0,0,0]	
		}
	]
}*/


function fuerza(o){
if(o.id=="experm1"){
	if(pem>0){
			malo[3]+=5;
			pem--;
	}
	infomalo();
}
else{
	if(pe>0){
			heroe[3]+=5;
			pe--;
	}
	info();
}
//grafo();
}

function velocidad(o){
if(o.id=="experm3"){
	if(pem>0){
			malo[4]+=10;
			pem--;
	}
	infomalo();
}
else{
	if(pe>0){
			heroe[4]+=10;
			pe--;
	}
	info();
}
//grafo();
}

function defensa(o){
if(o.id=="experm2"){
	if(pem>0){
			malo[1]+=50;
			pem--;
	}
	infomalo();
}
else{
	if(pe>0){
			heroe[1]+=50;
			pe--;
	}
	info();
}
//grafo();
}

function reinicia(){
combate=false;
$("#versus").css("display","none");
$(".sangre").css("display","none");
if(pe>0)
	$(".bpe").css("display","inline");
if(pem>0)
	$(".bpem").css("display","inline");

malo[1]=vidaM;
heroe[1]=vidaH;
vidaMalo();
vidaHeroe();

}

function vidaMalo(){
	if(malo[1]<0)malo[1]=0;
	$(".vidam").css( "border","3px solid black");
	var caja2=$("#vidamalomax");
	caja2.css("backgroundColor","red");
	
	var caja1=$("#vidamalo");
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.css("font-size","0.5em");
	caja1.text(malo[1]+"/"+(vidaM));
	var vidam= malo[1]/(vidaM/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");


}


function vidaHeroe(){
if(heroe[1]<0)heroe[1]=0;
	$(".vidah").css( "border","3px solid black");
	var caja1=$("#vidaheroe");
	
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.text(heroe[1]+"/"+(vidaH));
	var vidam= heroe[1]/(vidaH/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");

	

var caja2=$("#vidaheroemax");
caja2.css("backgroundColor","red");
}

function iniciaCombate(){
	if(combate==false){
		$(".bpe").css("display","none");
		$(".bpem").css("display","none");
		$("#versus").css("display","block");
		combate=true;
		lucha(1);
		
	}
}

function lucha(contador){

	if(combate==true){
		if(malo[1]>0&&heroe[1]>0){
			while(contador%(VMAX-malo[4])!=0&&contador%(VMAX-heroe[4])!=0){
				contador++;
			}
			if(contador%(VMAX-malo[4])==0||contador%(VMAX-heroe[4])==0){
				if(contador%(VMAX-heroe[4])==0)malo[1]-=random(heroe[3],malo[4]);
				if(contador%(VMAX-malo[4])==0)heroe[1]-=random(malo[3], heroe[4]);
				vidaMalo();
				vidaHeroe();	
			}
			setTimeout(function(){lucha(contador+1);},500);
		}
		else{
			combate=false;
			if(malo[1]==0)$("#dsangrem").toggle("fast");	
			if(heroe[1]==0)$("#dsangreh").toggle("fast");
		}
	}
		
}

function random(fuerza,agilidad){
var f=Math.floor(Math.random()*(fuerza/2));

return f+fuerza/2;
}


function escogemalo(h){
$(".imgm").slideUp("slow");
if(h.id=="mpersonalizado"){
	malo=heroe0.slice(0);
	pem=12;
	var botones=$(".bpem");
	botones.css("display",'inline');
	var imgs=$("#dpersom");
	
}
else if(h.id=="mfuerte"){
	malo=heroe1.slice(0);
	pem=0;
	var botones=$(".bpem");
	botones.css("display",'none');
	var imgs=$("#dfuertem");
}
else if(h.id=="mrapido"){
	malo=heroe2.slice(0);
	pem=0;
	var botones=$(".bpem");
	botones.css("display",'none');
	var imgs=$("#drapidom");
}
else if(h.id=="mtanque"){
	malo=heroe3.slice(0);
	pem=0;
	var botones=$(".bpem");
	botones.css("display",'none');
	var imgs=$("#dtanquem");
}
//grafo();
imgs.toggle("slow");
infomalo();
}

function escoge(h){


$(".imgh").slideUp("slow");
if(h.id=="personalizado"){
	heroe=heroe0.slice(0);
	pe=12;
	var botones=$(".bpe");
	botones.css("display",'inline');
	var imgs=$("#dperso");
	
}
else if(h.id=="fuerte"){
	heroe=heroe1.slice(0);
	pe=0;
	var botones=$(".bpe");
	botones.css("display",'none');
	var imgs=$("#dfuerte");
}
else if(h.id=="rapido"){
	heroe=heroe2.slice(0);
	pe=0;
	var botones=$(".bpe");
	botones.css("display",'none');
	var imgs=$("#drapido");
}
else if(h.id=="tanque"){
	heroe=heroe3.slice(0);
	pe=0;
	var botones=$(".bpe");
	botones.css("display",'none');
	var imgs=$("#dtanque");
}

//grafo();
imgs.toggle("slow");
infoheroe();

}


function info(){
	infoheroe();
	infomalo();
}


function infomalo(){
vidaM= malo[1];
vidaMalo();
$("#infom").css("display","block");
$("#nivelm").text("Nivel "+malo[0]);
$("#vidam").text("Vida "+malo[1]);
$("#defensam").text("Defensa "+malo[2]);
$("#fuerzam").text("Fuerza "+malo[3]);
$("#velocidadm").text("Velocidad "+malo[4]);
$("#precisionm").text("Precision "+malo[5]);
coloresInfo();
}

function infoheroe(){
vidaH= heroe[1];
vidaHeroe();
$("#infoh").css("display","block");
$("#nivelh").text("Nivel "+heroe[0]);
$("#vidah").text("Vida "+heroe[1]);
$("#defensah").text("Defensa "+heroe[2]);
$("#fuerzah").text("Fuerza "+heroe[3]);
$("#velocidadh").text("Velocidad "+heroe[4]);
$("#precisionh").text("Precision "+heroe[5]);
coloresInfo();
}

function coloresInfo(){
	
	$("td").css("color","white");
	if(heroe[0]>malo[0]){
		$("#nivelh").css("color","green");
		$("#nivelm").css("color","red");
	}
	else if(heroe[0]<malo[0]){
		$("#nivelh").css("color","red");
		$("#nivelm").css("color","green");
	}
	
	
	if(heroe[1]>malo[1]){
		$("#vidah").css("color","green");
		$("#vidam").css("color","red");
	}
	else if(heroe[1]<malo[1]){
		$("#vidah").css("color","red");
		$("#vidam").css("color","green");
	}
	
	
	if(heroe[2]>malo[2]){
		$("#defensah").css("color","green");
		$("#defensam").css("color","red");
	}
	else if(heroe[2]<malo[2]){
		$("#defensah").css("color","red");
		$("#defensam").css("color","green");
	}
	
	
	if(heroe[3]>malo[3]){
		$("#fuerzah").css("color","green");
		$("#fuerzam").css("color","red");
	}
	else if(heroe[3]<malo[3]){
		$("#fuerzah").css("color","red");
		$("#fuerzam").css("color","green");
	}
	
	
	if(heroe[4]>malo[4]){
		$("#velocidadh").css("color","green");
		$("#velocidadm").css("color","red");
	}
	else if(heroe[4]<malo[4]){
		$("#velocidadh").css("color","red");
		$("#velocidadm").css("color","green");
	}
	
	
	if(heroe[5]>malo[5]){
		$("#precisionh").css("color","green");
		$("#precisionm").css("color","red");
	}
	else if(heroe[5]<malo[5]){
		$("#precisionh").css("color","red");
		$("#precisionm").css("color","green");
	}
	
		
}





/*function grafo(){
Datos.datasets[0].data=[heroe[3],heroe[1]/10,heroe[4],0,0];
Datos.datasets[1].data=[malo[3],malo[1]/10,malo[4],0,0];
var contexto=document.getElementById("canvas").getContext("2d");
window.Radar= new Chart(contexto).Radar(Datos);

}*/

