//fuerza. vida .velocidad
var malo=[0,0,0];
var heroe=[0,0,0];
var heroe0=[0,0,0];
const heroe1=[30,205,15];
const heroe2=[15,165,65];
const heroe3=[15,500,8];
var pe=0;
var pem=0;
var vidaM;
var vidaH;
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
			malo[0]+=5;
			pem--;
	}
	infomalo();
}
else{
	if(pe>0){
			heroe[0]+=5;
			pe--;
	}
	info();
}
//grafo();
}

function velocidad(o){
if(o.id=="experm3"){
	if(pem>0){
			malo[2]+=10;
			pem--;
	}
	infomalo();
}
else{
	if(pe>0){
			heroe[2]+=10;
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

function sleep(n){
	var start=new Date().getTime();
	for(var i=0;i<1e7;i++){
		if ((new Date().getTime()-start) > n){break;}
	}
}

function reinicia(){
$(".sangre").css("display","none");
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
	//caja1.progressbar({value: heroe[1]*100/vidaH});
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.css("font-size","0.5em");
	caja1.text(malo[1]+"/"+(vidaM));
	var vidam= malo[1]/(vidaM/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");
	//caja1.css("width",vidam);
	//caja1.progressbar({value:41});
	



}

function vidaHeroe(){
if(heroe[1]<0)heroe[1]=0;
	$(".vidah").css( "border","3px solid black");
	var caja1=$("#vidah");
	// caja1.progressbar({value: heroe[1]*100/vidaH});
	caja1.css("backgroundColor","green");
	caja1.css("position","relative");
	caja1.css("bottom","28px");
	caja1.text(heroe[1]+"/"+(vidaH));
	var vidam= heroe[1]/(vidaH/70);
	vidam+="%";
	caja1.animate({width:vidam},"normal");
	// caja1.css("width",vidam);

	

var caja2=$("#vidahmax");
caja2.css("backgroundColor","red");
}

function lucha(contador){
	//$("#versus").css("display","block");
	//$(".sangre").draggable();
	if(malo[1]>0&&heroe[1]>0){
		while(contador%(VMAX-malo[2])!=0&&contador%(VMAX-heroe[2])!=0){
			contador++;
		}
		if(contador%(VMAX-malo[2])==0||contador%(VMAX-heroe[2])==0){
			if(contador%(VMAX-heroe[2])==0)malo[1]-=random(heroe[0],malo[2]);
			if(contador%(VMAX-malo[2])==0)heroe[1]-=random(malo[0], heroe[2]);
			vidaMalo();
			vidaHeroe();	
		}
		setTimeout(function(){lucha(contador+1);},500);
	}
	else{
	 if(malo[1]==0)$("#dsangrem").toggle("fast");	
	 if(heroe[1]==0)$("#dsangreh").toggle("fast");
	}
	
		
}

function random(fuerza,agilidad){
var f=Math.floor(Math.random()*(fuerza/2));

return f+fuerza/2;
}

function fondo(){
	var ran=Math.floor(Math.random()*16777215).toString(16);
	document.bgColor= '+'+ran;
}

function escogemalo(h){
$(".imgm").slideUp("slow");
if(h.id=="mpersonalizado"){
	malo=heroe0.slice(0);
	pem=15;
	var botones=$(".bpem");
	botones.css("display",'block');
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
	pe=15;
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
info();

}

function infomalo(){
vidaM= malo[1];
vidaMalo();
$("#infomalo").css("display","block");
$("#infomalo").text("Fuerza, vida y velocidad: "+(malo[0]+","+malo[1]+","+malo[2]));
}

function info(){
vidaH= heroe[1];
vidaHeroe();
$("#info").css("display","block");
$("#info").text("Fuerza, vida y velocidad: "+(heroe[0]+","+heroe[1]+","+heroe[2]));
}

/*function grafo(){
Datos.datasets[0].data=[heroe[0],heroe[1]/10,heroe[2],0,0];
Datos.datasets[1].data=[malo[0],malo[1]/10,malo[2],0,0];
var contexto=document.getElementById("canvas").getContext("2d");
window.Radar= new Chart(contexto).Radar(Datos);

}*/

