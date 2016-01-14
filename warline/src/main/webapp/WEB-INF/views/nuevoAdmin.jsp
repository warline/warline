<%@ include file="fragments/headerGestion.jspf"%>

<script src="./ui/external/jquery/jquery.js"></script>
<script src="./ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css"
	href="resources/gestion/nuevoAdmin.css">

	<div id="container">

		<div id="main">
			<div id="capaMadre">
				<div class="cabecera">
					<div id="titulo">
						CREAR NUEVO ADMIN
						<hr>
					</div>
				</div>

			<form action = "crearAdmin" method="POST">
				<div id = "panelNuevoAdmin">
					<table>
						<tbody>
							<tr><td>Correo:</td>
								<td><input type="text" id = "datosAdmin" name="correo" /></td>
							</tr>
							<tr><td>Contraseña: </td>
								<td> <input type="password" id = "datosAdmin" name="password" /> </td>
							</tr>
							<tr><td>Repita contraseña:</td>
								<td><input type="password" id = "datosAdmin" name="repassword" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id = "mensajeError">
					<c:if test="${not empty registrerError}">
						<p> <c:out value="${registrerError}"/> </p>
					</c:if>
				</div>
				<div id = "crearAdmin">
					<button type = "submit">Crear Admin</button> 
				</div>
			</form>
				<div id = "panelVolver">
					<a href = "gestionUsuarios">
						<button>Volver</button>
					</a>
				</div>
		</div>
		</div>
	</div>

</body>
</html>
