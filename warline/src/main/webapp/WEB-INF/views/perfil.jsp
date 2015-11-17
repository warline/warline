<%@ include file="fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head> <title> Perfil </title>
<script src="prueba.js"></script>
<script src= ".\ui\external\jquery\jquery.js"></script>
<script src=".\ui\jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href=".\ui\jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/fragments/plantilla.css"/>
</head> <link rel = "stylesheet" type = "text/css" href = "resources/perfil/perfil.css">
<body> 
<div id="container">

	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Perfil <hr> </div>
			</div>
			
			<div id = "divIzquierdo">
				<div id = "panelNombreYFoto">
					<h2> Nombre del jugador </h2>
					<div id = "imagenPerfil"><img src = "resources/perfil/fotos/imagenPerfil.jpg"></div>
				</div>
				<div id = "estadisticas">
					<div id = "tablaEstad">
						<table>
						<thead>
							<tr>  <td> Nivel </td><td> 89 </td>  </tr>
							<tr>  <td> Vida </td><td> 100 </td>  </tr>
							<tr>  <td> Fuerza </td><td> 25 + (30)</td>  </tr>
							<tr>  <td> Habilidad </td><td> 25 + (5) </td> </tr>
							<tr>  <td> Defensa </td><td> 50 + (8) </td>  </tr>
							<tr>  <td> Velocidad </td><td> 50 + (12) </td>  </tr>
						</table>
					</div>
					<div id = "diagramaEstad"><img src = "resources/perfil/fotos/stats.png"></div>
				</div>
			</div> <!-- divIzquierdo -->

			<div id = "divDerecho">
				<div id = "equipo">
				<table>
				<caption> EQUIPO </caption>
					<tr> <td></td><td></td><td></td> </tr>
					<tr> <td></td><td></td><td></td> </tr>
					<tr> <td></td><td></td><td></td> </tr>
				</table>
			</div>
					<div id = "inventario">
					<table>
					<caption> INVENTARIO </caption>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
					</table>
					</div>
			</div> <!-- divDerecho -->
		</div>
	</div>
	
	<div id = "footer"></div>
	
  </div> <!-- container -->
</body>
</html>

