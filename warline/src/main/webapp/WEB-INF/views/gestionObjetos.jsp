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
						GESTION DE OBJETOS
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
					
					<a href = "nuevoObjeto">
						<button class="botonesGUsu" id="a�adir"></button>
					</a>
					<a href = "nuevoObjeto">
						<button class="botonesGUsu" id="modificar"></button>
					</a>
					<button class="botonesGUsu" id="eliminar"></button>
					
					<div class="apanel">
						<table>
							<tr>
								<td id="imagen"></td>
								<td>IMAGEN</td>
								<td>NOMBRE</td>
								<td>TIPO</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Espada del Olimpo</td>
								<td>Espada</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Casco de Gladiador</td>
								<td>Casco</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Botas de Tela</td>
								<td>Botas</td>
							</tr>
							<tr>
								<td id="imagen"><input type="checkbox"></td>
								<td></td>
								<td>Malla de Hierro</td>
								<td>Armadura</td>
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