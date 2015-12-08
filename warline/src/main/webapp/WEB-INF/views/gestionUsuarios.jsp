<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/headerGestion.jspf"%>
<!DOCTYPE html>
<html>
<head>

<title>Warline</title>
<script src="prueba.js"></script>
<script src=".\ui\external\jquery\jquery.js"></script>
<script src=".\ui\jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href=".\ui\jquery-ui.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">
</head>
<body>
	<!--<img id="fondo" src=".\fotos\background.png"/>-->
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

					<button class="botonesGUsu" id="banear"></button>
					<button class="botonesGUsu" id="eliminar"></button>
					<button class="botonesGUsu" id ="admin"></button>
					<button class="botonesGUsu" id ="usuario"></button>
					<div class="apanel">
						<table>
							<tr>
								<td></td>
								<td>USUARIO</td>
								<td>CORREO</td>
								<td>BANEADO</td>
								<td>ROL</td>
							</tr>
							    <c:forEach var="i" items="${users}">
    								<tr>
										<td><input type="checkbox"></td>
										<td><c:out value="${i.getHeroe().nombre}"/></td>
										<td><c:out value="${i.login}"/></td>
										<td><c:out value="${i.banned}"/></td>
										<td><c:out value="${i.role}"/></td>
									</tr>
    							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
