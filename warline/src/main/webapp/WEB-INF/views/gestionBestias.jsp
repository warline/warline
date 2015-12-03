<%@ include file="fragments/headerGestion.jspf"%>
<!DOCTYPE html>
<html>
<head>

<title>Warline</title>
<script src="prueba.js"></script>
<script src=".\ui\external\jquery\jquery.js"></script>
<script src=".\ui\jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href=".\ui\jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />  
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">
</head>
<body>
	<!--<img id="fondo" src=".\fotos\background.png"/>-->
	<div id="container">


		<div id="main">
			<div id="capaMadre">
				<div class="cabecera">
					<div id="titulo">
						GESTION DE BESTIAS
						<hr>
					</div>
				</div>

				<div id="acuerpo">
					<form>
						<!--Filtro:<br> -->
						<div id="find">
							<input type="text" name="filtro">
							<button class="botonesGUsu" id="filtrar">Buscar</button>
						</div>

					</form>
					
					<a href = "nuevaBestia">
						<button class="botonesGUsu" id="añadir"></button>
					</a>
					<a href = "nuevaBestia">
						<button class="botonesGUsu" id="modificar"></button>
					</a>
					<button class="botonesGUsu" id="eliminar"></button>
					
					<div class="apanel">
						<table>
							<tr>
								<td id="imagen"></td>
								<td>IMAGEN</td>
								<td>NOMBRE</td>
								<td>NIVEL</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Boqueron</td>
								<td>3</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Lobo</td>
								<td>7</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Hydra</td>
								<td>45</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>OSO</td>
								<td>30</td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>
		<div id="footer"></div>

	</div>

</body>
</html>