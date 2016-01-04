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
						<button class="botonesGUsu" id="añadir"></button>
					</a>
					<a href = "nuevoObjeto">
						<button class="botonesGUsu" id="modificar"></button>
					</a>
				<div class="apanel">
					<table>
						<thead>
							<tr>
								<th>IMAGEN</th>
								<th>NOMBRE</th>
								<th>TIPO</th>
								<th>NIVEL</th>
								<th></th>
							</tr>
						<thead>
						<tbody>
						
							<c:forEach var="i" items="${objetos}">
								<tr>
										<td><img class = "bicho" src = "resources/armeria/images/${i.nombre}.png" align="middle"/> </td>
										<td><c:out value="${i.nombre}" /></td>
										<td><c:out value="${i.tipo}" /></td>
										<td><c:out value="${i.nivel}" /></td>
										<td>
											<form action="borrarObjeto" method="POST">
												<button name="idObjeto" class="botonesGUsu" id="eliminar" type = "submit" value = "${i.id}"></button>
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