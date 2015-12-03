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
						GESTION DE USUARIOS
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

					<button class="botonesGUsu" id="banear"></button>
					<button class="botonesGUsu" id="eliminar"></button>
					<button class="botonesGUsu" id ="admin"></button>
					<button class="botonesGUsu" id ="usuario"></button>
					<div class="apanel">
						<table>
							<tr>
								<td></td>
								<td>USUARIO</td>
								<td>CORREO</td>
								<td>ROL</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JAVI</td>
								<td>javi@ucm.es</td>
								<td>Usuario</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>HENRY</td>
								<td>henry@ucm.es</td>
								<td>Administrador</td>

							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>CHEMA</td>
								<td>elreyenelnorte@ucm.es</td>
								<td>Rey en el Norte</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>JAVO</td>
								<td>javo@ucm.es</td>
								<td>Usuario</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>DAVID</td>
								<td>david@ucm.es</td>
								<td>Usuario</td>
							</tr>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>
