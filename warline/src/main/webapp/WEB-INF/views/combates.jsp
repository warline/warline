<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>

<title>Warline</title>
<script src="resources/combates/combates.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<script src="resources/ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="resources\ui\jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/combates/combates.css"/>
</head>
<body>
<!--<img id="fondo" src=".\fotos\background.png"/>-->
<div id="container">
	<div id="main">
		<div id="capaMadreCombate">
				
			<div class="cabecera">
				<div id ="titulo">
					COMBATE
				<hr>
				</div>
			</div>
			<div id="capaHijaCombate"></div>
			<div id="cuerpo">
			
				<div class = "heroe" id=jugador>
					<div class="marco">
				
						<h2>Héroe:</h2>
						<button class="hero" id=personalizado onClick="escoge(this)"> Personalizado </button>
						<button class="hero" id=fuerte onClick="escoge(this)"> Fuerte </button>
						<button class="hero" id=rapido onClick="escoge(this)"> Rápido </button>
						<button class="hero" id=tanque onClick="escoge(this)"> Tanque </button>
						
						<div class="imgh"><img class= "foto" id="iheroe" ></img></div>
						
						<div class="sangre" id="dsangreh"><img class= "foto" id="isangreh" src ="resources\combates\fotos\sangre2.png"></img></div>
						<div class=vidah id="vidaheroemax"></div>
						<div class=vidah id="vidaheroe" ></div>
		
						<button class="bpe" id=exper1  onClick="fuerza(this)">Fuerza (+5)</button>
						<button class="bpe" id=exper2  onClick="defensa(this)">Salud (+50)</button>
						<button class="bpe" id=exper3  onClick="velocidad(this)">Velocidad (+10)</button>	
</div>
					
					<table  class= dinfo id="infoh">
						<tr> <td id ="nivelh"> </td> <td id ="vidah"> </td></tr>
						<tr> <td id ="defensah"> </td> <td id ="fuerzah"> </td></tr>
						<tr> <td id ="velocidadh"> </td> <td id ="precisionh"> </td></tr>
					</table>
						
				</div>
			
				
			
				<div class = "heroe" id=enemigo>
					<div class="marco" id=marcoenemigo>
						<h2>Enemigo:</h2>
						<button class="hero" id=mpersonalizado onClick="escogemalo(this)"> Personalizado </button>
						<button class="hero" id=mfuerte onClick="escogemalo(this)"> Fuerte </button>
						<button class="hero" id=mrapido onClick="escogemalo(this)"> Rápido </button>
						<button class="hero" id=mtanque onClick="escogemalo(this)"> Tanque </button>
						
						<div class="imgm" id="dmalo" ><img class= "foto" id="imalo" ></img></div>
						
						<div class="sangre" id="dsangrem"><img class= "foto" id="isangrem" src ="resources\combates\fotos\sangre.png"></img></div>
						
						<div class=vidam id="vidamalomax" ></div>					
						<div class=vidam id="vidamalo"></div>
						
						<button class="bpem" id=experm1  onClick="fuerza(this)">Fuerza (+5)</button>
						<button class="bpem" id=experm2  onClick="defensa(this)">Salud (+50)</button>
						<button class="bpem" id=experm3  onClick="velocidad(this)">Velocidad (+10)</button>	
						</div>	
					
				
					<table  class= dinfo id="infom">
					<tr> <td id ="nivelm"> </td> <td id ="vidam"> </td></tr>
					<tr> <td id ="defensam"> </td> <td id ="fuerzam"> </td></tr>
					<tr> <td id ="velocidadm"> </td> <td id ="precisionm"> </td></tr>
					</table>
					
				</div>
				<div  id="versus" ><img id="vs" src ="resources\combates\fotos\versus.png"></img></div>
				<!--<div id="can" ><canvas id="canvas"></canvas></div>-->
			</div>
			<button id=lucha onClick="iniciaCombate()"> Luchar </button>
			<br/>
			<button id=reinicia onClick="reinicia()"> Reiniciar </button>
		</div>
	</div>
	<div id="footer">
		
	</div>

</div>

</body>
</html>
