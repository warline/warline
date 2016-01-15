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
						<button class="botonesGUsu" id="anadir"></button>
					</a>

				<div class="apanel">
					<table>
						<thead>
							<tr>
								<th id = "imagen">IMAGEN</th>
								<th id = "nombre">NOMBRE</th>
								<th id = "tipo">TIPO</th>
								<th id = "nivel">NIVEL</th>
								<th id = "aux"></th>
								<th id = "aux"></th>
								<th id = "scroll"></th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="i" items="${objetos}">
								<tr>
									<td id = "imagen"><img class = "bicho" src = "objeto/photo?id=${i.id}" align="middle"/> </td>
									<td id = "nombre"><c:out value="${i.nombre}" /></td>
									<td id = "tipo"><c:out value="${i.tipo}" /></td>
									<td id = "nivel"><c:out value="${i.nivel}" /></td>
									<td id = "aux"> 
										<form action="modificarObjeto" method="POST">
											<button name="idObjeto" class="botonesInternos" id="modificar" type = "submit" value = "${i.id}">
											</button>
										</form> 
									</td>
									<td id = "aux"> 
										<form action="borrarObjeto" method="POST">
											<button name="idObjeto" class="botonesInternos" id="eliminar" type = "submit" value = "${i.id}"></button>
										</form> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			</div>
		</div>
		<div id="footer"></div>

	</div>

</body>
</html>