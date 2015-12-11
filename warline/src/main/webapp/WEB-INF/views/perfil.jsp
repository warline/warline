<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf" %>

<script src="prueba.js"></script>
<script src= "./ui/external/jquery/jquery.js"></script>
<script src="./ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="./ui/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/fragments/plantilla.css"/>
<link rel = "stylesheet" type = "text/css" href = "resources/perfil/perfil.css">
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Perfil <hr> </div>
			</div>
			
			<div id = "divIzquierdo">
				<div id = "panelNombreYFoto">
					<h2> <c:out value="${user.getHeroe().nombre}"/> </h2>
					<div id = "imagenPerfil"><img src = "resources/perfil/fotos/imagenPerfil.jpg"></div>
				</div>
				<div id = "estadisticas">
					<div id = "tablaEstad">
						<table>
						<thead>
							<tr>  <td> Nivel </td><td> <c:out value="${user.getHeroe().nivel}"/> </td>  </tr>
							<tr>  <td> Vida </td><td> <c:out value="${user.getHeroe().vida}"/> </td>  </tr>
							<tr>  <td> Fuerza </td><td> <c:out value="${user.getHeroe().fuerza}"/></td>  </tr>
							<tr>  <td> Precisión </td><td> <c:out value="${user.getHeroe().precision}"/> </td> </tr>
							<tr>  <td> Defensa </td><td> <c:out value="${user.getHeroe().defensa}"/> </td>  </tr>
							<tr>  <td> Velocidad </td><td> <c:out value="${user.getHeroe().velocidad}"/> </td>  </tr>
							<tr>  <td> Oro </td><td> <c:out value="${user.getHeroe().oro}"/> </td>  </tr>
							<tr>  <td> Experiencia </td><td> <c:out value="${user.getHeroe().xp}"/> </td>  </tr>
						</table>
					</div>
					<!--<div id = "diagramaEstad"><img src = "resources/perfil/fotos/stats.png"></div>  -->
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

