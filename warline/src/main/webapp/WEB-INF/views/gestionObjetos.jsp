<%@ include file="fragments/header.jspf" %>
<!DOCTYPE html>
<html>
<head>

<title>Warline</title>
<script src="prueba.js"></script>
<script src= ".\ui\external\jquery\jquery.js"></script>
<script src=".\ui\jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href=".\ui\jquery-ui.css"/>
<link rel="stylesheet" type="text/css" 
		href="resources/fragments/plantilla.css"/>
<link rel = "stylesheet" type = "text/css" 
		href = "resources/gestion/gestion.css">
</head>
<body>
<!--<img id="fondo" src=".\fotos\background.png"/>-->
<div id="container">
	
	<div id="header">
		
		<div id="userbar">	
			<img id="cabe" src=".\fotos\bannerVersion3.png"/>
		</div>
 
	</div>

	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> GESTION DE OBJETOS <hr> </div>
			</div>

			<div id="acuerpo">
			<form>
				<!--Filtro:<br> -->
				<div id = "find">
					<input type="text" name="filtro">
					<button class = "botonesGUsu" id = "filtrar">Buscar</button>
				</div>
				
			</form>
			
			<button class = "botonesGUsu" id = "añadir"></button>
			<button class = "botonesGUsu" id = "modificar"></button>
			<button class = "botonesGUsu" id = "eliminar"></button>
			<div class = "apanel">
				<table>
					<tr> <td id = "imagen"></td><td>IMAGEN</td><td>NOMBRE</td><td>TIPO</td> </tr>
					<tr> <td id = "imagen"><input type="checkbox"></td><td></td><td>Espada del Olimpo</td><td>Espada</td> </tr>
					<tr> <td id = "imagen"><input type="checkbox"></td><td></td><td>Casco de Gladiador</td><td>Casco</td> </tr>
					<tr> <td id = "imagen"><input type="checkbox"></td><td></td><td>Botas de Tela</td><td>Botas</td> </tr>
					<tr> <td id = "imagen"><input type="checkbox"></td><td></td><td>Malla de Hierro</td><td>Armadura</td> </tr>
				</table>
			</div>
			
			</div>
		</div>
	</div>

	<div id="sidebar">
		<h2>Menu principal</h2>
		<p><button class = "botonesPrincipales" id = "usuarios"> Usuarios </button>
		<p><button class = "botonesPrincipales" id = "objetos"> Objetos </button>
		<p><button class = "botonesPrincipales" id = "arenas"> Arenas </button>
		<p><button class = "botonesPrincipales" id = "arcade"> Arcade </button>
		<p><button class = "botonesPrincipales" id = "salir"> Salir </button>
	</div>

	<div id="footer">
		
	</div>

</div>

</body>
</html>