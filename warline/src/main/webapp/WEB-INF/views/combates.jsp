<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>

<title>Warline</title>
<script src="resources/combates/prueba.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<script src="resources/ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="resources\ui\jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/combates/style2.css"/>
</head>
<body>
<!--<img id="fondo" src=".\fotos\background.png"/>-->
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div id="capaHija"></div>	
			<div class="cabecera">
				<div id ="warline">
					COMBATE
				<hr>
				</div>
			</div>
			<div id="cuerpo">
				<div class = "heroe" id=jugador>
					<div class="marco">
				
						<h2>Escoge tu héroe:</h2>
						<button class="hero" id=personalizado onClick="escoge(this)"> Personalizado </button>
						<button class="hero" id=fuerte onClick="escoge(this)"> Fuerte </button>
						<button class="hero" id=rapido onClick="escoge(this)"> Rápido </button>
						<button class="hero" id=tanque onClick="escoge(this)"> Tanque </button>
						
						<div class="imgh" id="dperso" ><img class= "foto" id="iperso" src ="resources\combates\fotos\perso.png"></img></div>
						<div class="imgh" id="dfuerte"><img class= "foto" id="ifuerte" src ="resources\combates\fotos\fuerte.png"></img></div>
						<div class="imgh" id="drapido" ><img class= "foto" id="irapido" src ="resources\combates\fotos\rapido.png"></img></div>
						<div class="imgh" id="dtanque"><img class= "foto" id="itanque" src ="resources\combates\fotos\tanque.png"></img></div>
						<div class="sangre" id="dsangreh"><img class= "foto" id="isangreh" src ="resources\combates\fotos\sangre2.png"></img></div>
						<div class=vidah id="vidahmax"></div>
						<div class=vidah id="vidah" ></div>
		
						<input class="bpe" type="button" id=exper1 value="Fuerza (+5)" onClick="fuerza(this)"/>
						<input class="bpe" type="button" id=exper2 value="Salud (+50)" onClick="defensa(this)"/>
						<input class="bpe" type="button" id=exper3 value="Velocidad (+10)" onClick="velocidad(this)"/>
					</div>
					
					<p><a> <div class=info id="info"> </div></a> </p>
						
				</div>
			
				
			
				<div class = "heroe" id=enemigo>
					<div class="marco" id=marcoenemigo>
						<h2>Escoge al enemigo:</h2>
						<button class="hero" id=mpersonalizado onClick="escogemalo(this)"> Personalizado </button>
						<button class="hero" id=mfuerte onClick="escogemalo(this)"> Fuerte </button>
						<button class="hero" id=mrapido onClick="escogemalo(this)"> Rápido </button>
						<button class="hero" id=mtanque onClick="escogemalo(this)"> Tanque </button>
						
						<div class="imgm" id="dpersom" ><img class= "foto" id="iperso" src ="resources\combates \fotos\perso.png"></img></div>
						<div class="imgm" id="dfuertem"><img class= "foto" id="ifuerte" src ="resources\combates\fotos\fuerte.png"></img></div>
						<div class="imgm" id="drapidom" ><img class= "foto" id="irapido" src ="resources\combates\fotos\rapido.png"></img></div>
						<div class="imgm" id="dtanquem"><img class= "foto" id="itanque" src ="resources\combates\fotos\tanque.png"></img></div>
						<div class="sangre" id="dsangrem"><img class= "foto" id="isangrem" src ="resources\combates\fotos\sangre.png"></img></div>
						
						<div class=vidam id="vidamalomax"></div>					
						<div class=vidam id="vidamalo" ></div>
						<p><a><div class=info id="infomalo"> </div></a> </p>
						<input class="bpem" type="button" id=experm1 value="Fuerza (+5)" onClick="fuerza(this)"/>
						<input class="bpem" type="button" id=experm2 value="Salud (+50)" onClick="defensa(this)"/>
						<input class="bpem" type="button" id=experm3 value="Velocidad (+10)" onClick="velocidad(this)"/>	
					</div>	
				</div>
			
				<div  id="versus" ><img id="vs" src =".\fotos\versus.png"></img></div>
				<!--<div id="can" ><canvas id="canvas"></canvas></div>-->
			</div>
			<input type="button" id=lucha value="Luchar " onClick="lucha(1)"/> 
			<br/>
			<input type="button" id=reinicia value="Reiniciar" onClick="reinicia()"/>
		</div>
	</div>
	<div id="footer">
		
	</div>

</div>

</body>
</html>
