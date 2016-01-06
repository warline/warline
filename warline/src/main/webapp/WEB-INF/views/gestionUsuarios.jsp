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
						GESTION DE USUARIOS
						<hr>
					</div>
				</div>

			<div id="acuerpo">
				<!--Filtro:<br> -->
				<div id="find">
					<input type="text" name="filtro">
					<button class="botonesGUsu" id="filtrar">Buscar</button>
				</div>
				
				<a href = "nuevoAdmin">
					<button class="botonesGUsu" id="admin"></button>
				</a>

				<div class="apanel" id="panelScroll">
				    <form id="selected" method="POST">
					<table id = "usuarios">
						<thead>
							<tr>
								<th id = "nombre">USUARIO</th>
								<th>CORREO</th>
								<th id = "aux">BANEADO</th>
								<th id = "aux">ROL</th>
								<th id = "aux"> </th>
								<th id = "aux"> </th>
								<th id = "scroll"> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${users}">
							<tr>
								<td id = "nombre"><c:out value="${i.getHeroe().nombre}" /></td>
								<td><c:out value="${i.login}" /></td>
								<td id = "aux" ><c:out value="${i.banned}" /></td>
								<td id = "aux"><c:out value="${i.role}" /></td>
								<td id = "aux">
									<form action="banearUsuario" method="POST">
											<button name="idUsuario" class="botonesInternos" id="banear" type = "submit" value = "${i.id}"></button>
									</form> 
								</td>
								<td id = "aux">
									<form action="borrarUsuario" method="POST">
											<button name="idUsuario" class="botonesInternos" id="eliminar" type = "submit" value = "${i.id}"></button>
									</form>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<input type="hidden" id="op" name="op"/>
					</form>
				</div>
			</div>
		</div>
		</div>
	</div>

</body>
</html>
