<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf" %>

<script src="resources/combates/combates.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<script src="resources/ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="resources\ui\jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/combates/combates.css"/>

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
						<br>
						<h2><c:out value="${user.getHeroe().nombre}"/></h2>
						<hr>
						<div class="imgh"><img class= "foto" id="iheroe" src= "${user.getHeroe().imagen}"></img></div>
						
						<div class="sangre" id="dsangreh"><img class= "foto" id="isangreh" src ="resources/combates/fotos/sangre2.png"></img></div>
						<div class=vidah id="vidaheroemax"></div>
						<div class=vidah id="vidaheroe" ></div>
					
					</div>
					
					<table  class= dinfo id="infoh">
						<tr> <td id ="nivelh">Nivel <c:out value="${user.getHeroe().nivel}" /> </td> <td id ="vidah">Vida <c:out value="${user.getHeroe().vida}" /></td></tr>
						<tr> <td id ="defensah">Defensa <c:out value="${user.getHeroe().defensa}" /> </td> <td id ="fuerzah">Fuerza <c:out value="${user.getHeroe().fuerza}" /> </td></tr>
						<tr> <td id ="velocidadh">Velocidad <c:out value="${user.getHeroe().velocidad}" /> </td> <td id ="precisionh">Precision <c:out value="${user.getHeroe().precision}" /> </td></tr>
					</table>
						
				</div>
			
				<div class = "heroe" id=enemigo>
					<div class="marco" id=marcoenemigo>
						<br>
						<h2><c:out value="${rival.nombre}" /></h2>
						<hr>
						
						<div class="imgm" id="dmalo" ><img class= "foto" id="imalo" src="bestia/photo?id=${rival.id}"></img></div>
						
						<div class="sangre" id="dsangrem"><img class= "foto" id="isangrem" src ="resources/combates/fotos/sangre.png"></img></div>
						
						<div class=vidam id="vidamalomax" ></div>					
						<div class=vidam id="vidamalo"></div>
						
						
						</div>	
					
				
					<table  class= dinfo id="infom">
					<tr> <td id ="nivelh">Nivel <c:out value="${rival.nivel}" /> </td> <td id ="vidah">Vida <c:out value="${rival.vida}" /></td></tr>
						<tr> <td id ="defensah">Defensa <c:out value="${rival.defensa}" /> </td> <td id ="fuerzah">Fuerza <c:out value="${rival.fuerza}" /> </td></tr>
						<tr> <td id ="velocidadh">Velocidad <c:out value="${rival.velocidad}" /> </td> <td id ="precisionh">Precision <c:out value="${rival.precision}" /> </td></tr>
					
					</table>
					
				</div>
				<div  id="versus" ><img id="vs" src ="resources/combates/fotos/versus.png"></img></div>
				<!--<div id="can" ><canvas id="canvas"></canvas></div>-->
			</div>
			<form action="luchar" method="POST">
					<button id=lucha name=formNombre type="submit" value=("${rival.getNombre()}")>Lucha</button>
			</form>
			<br/>
			<button id=reinicia onClick="reinicia(${user.getHeroe()}, ${rival})"> Reiniciar </button>
		</div>
	</div>
	<div id="footer">
		
	</div>

</div>

</body>
</html>
