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
				<form>
					<!--Filtro:<br> -->
					<div id="find">
						<input type="text" name="filtro">
						<button class="botonesGUsu" id="filtrar">Buscar</button>
					</div>
				</form>
				
				<button class="botonesGUsu" id="admin"></button>
				<button class="botonesGUsu" id="usuario"></button>

				<div class="apanel" id="panelScroll">
					<table>
						<thead>
							<tr>
								<th>USUARIO</th>
								<th>CORREO</th>
								<th>BANEADO</th>
								<th>ROL</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="i" items="${users}">
							<tr>
									<td><c:out value="${i.getHeroe().nombre}" /></td>
									<td><c:out value="${i.login}" /></td>
									<td><c:out value="${i.banned}" /></td>
									<td><c:out value="${i.role}" /></td>
									
									<td>
										<form action="borrarUsuario" method="POST">
											<button name="idUsuario" class="botonesGUsu" id="eliminar" type = "submit" value = "${i.id}"></button>
										</form>
									</td>
									<td>
										<form action="banearUsuario" method="POST">
											<button name="idUsuario" class="botonesGUsu" id="banear" type = "submit" value = "${i.id}"></button>
										</form>
									</td>
									</tr>
							</c:forEach>
						
						</tbody>
					</table>
					<input type="hidden" id="op" name="op"/>
				</div>
			</div>
		</div>
		</div>
	</div>

</body>
</html>
