<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="fragments/header.jspf"%>
<!DOCTYPE html>
<html>
<head>
<%--<title> Arcade - WarLine </title>--%>
<link rel="stylesheet" type="text/css"
	href="resources/arcade/warlineArcade.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
</head>
<body>
	<div id="container">
		<div id="main">
			<div id="transparencia"></div>
			<div id="encabezado">
				<div id="warline">
					ARCADE
					<hr>
				</div>
			</div>
			<div id="arcade">
				<p>
				<h3>Escoge un rival:</h3>
				</p>
				<table id="tablaRivales">
					<tr id="arribaRivales">
						<td class="casilla"><div id="ocultar"></div>
							<button class="arcade" type="button" value="Boquerón">Lvl.1</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/boqueron.jpg" />
							</p></td>
						<td class="casilla"><div id="ocultar"></div>
							<button class="arcade" type="button" value="Ratas">Lvl.2</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/rata.jpg" />
							</p></td>
						<td class="casilla"><div id="ocultar"></div>
							<button class="arcade" type="button" value="Tejón">Lvl.3</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/tejon.jpg" />
							</p></td>
						<td class="casilla"><div id="ocultar"></div>
							<button class="arcade" type="button" value="Komodo">Lvl.4</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/komodo.jpg" />
							</p></td>
						<td class="casilla"><div id="ocultar"></div>
							<button class="arcade" type="button" value="Lobo">Lvl.5</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/lobo.jpg" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Pantera">Lvl.6</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/pantera.jpg" />
							</p></td>
					</tr>
					<tr class="nombres">
						<td class="casillaNombre"><p>
							<h2>BOQUERÓN</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>RATAS</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>TEJÓN</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>KOMODO</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>LOBO</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>PANTERA</h2>
							</p></td>
					</tr>
					<tr id="arribaRivales">
						<td class="casilla"><button class="arcade" type="button"
								value="Oso">Lvl.7</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/oso.png" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Tigre">Lvl.8</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/tigre.jpg" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Rhino">Lvl.9</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/rhino2.gif" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Elefante">Lvl.10</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/elefante.jpg" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Dragon">Lvl.11</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/dragon.jpg" />
							</p></td>
						<td class="casilla"><button class="arcade" type="button"
								value="Hydra">Lvl.12</button>
							<p>
								<img id="imagenRival" src="resources/arcade/images/hydra.png" />
							</p></td>
					</tr>
					<tr class="nombres">
						<td class="casillaNombre"> <p>
							<h2>GRIZZLY</h2>
							</p>
						</td>
						<td class="casillaNombre"><p>
							<h2>TIGRE</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>RHINO</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>ELEFANTE</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>DRAGÓN</h2>
							</p></td>
						<td class="casillaNombre"><p>
							<h2>HYDRA</h2>
							</p></td>
					</tr>
				</table>
				<br> <br>
				<button id="luchar" type="button" onClick="<!--ruta al combate-->">¡A
					LUCHAR!</button>
				<br> <br>
			</div>
		</div>



		<div id="footer"></div>

	</div>

</body>
</html>

