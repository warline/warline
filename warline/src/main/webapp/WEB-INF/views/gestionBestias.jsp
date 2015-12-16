<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/headerGestion.jspf"%>


<script src="./ui/external/jquery/jquery.js"></script>
<script src="./ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="./ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />  
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">

	<!--<img id="fondo" src="./fotos/background.png"/>-->
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
						<button class="botonesGUsu" id="a�adir"></button>
					</a>
					<a href = "nuevaBestia">
						<button class="botonesGUsu" id="modificar"></button>
					</a>
					<button class="botonesGUsu" id="eliminar"></button>
					
					<div class="apanel" id = "panelScroll">
						<table>
							<tr>
								<td id="imagen"></td>
								<td>IMAGEN</td>
								<td>NOMBRE</td>
								<td>NIVEL</td>
							</tr>
							<c:forEach var="b" items="${bestias}">
								<tr>
									<td><input type="checkbox"></td>
									<td><img class="bicho"  src="resources/arcade/images/${b.nombre}.jpg"/></td>
									<td><c:out value="${b.nombre}" /></td>
									<td><c:out value="${b.nivel}" /></td>
								</tr>
							</c:forEach>

						</table>
					</div>

				</div>
			</div>
		</div>
		<div id="footer"></div>

	</div>

</body>
</html>