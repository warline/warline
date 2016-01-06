<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/headerGestion.jspf"%>



<script src="./ui/external/jquery/jquery.js"></script>
<script src="./ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="./ui/jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
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
							<tr><td>Nombre:</td>
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
				<div id = "panelBotonNuevo">
					<div id = "panelVolver">
						<a href = "gestionUsuarios">
							<button>Volver</button>
						</a>
					</div>
					<div id = "crearAdmin">
						<button type = "submit">Crear Admin</button> 
					</div>
				</div>
			</form>
		</div>
		</div>
	</div>

</body>
</html>
