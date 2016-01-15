<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/headerGestion.jspf"%>
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
<link rel="stylesheet" type="text/css"
	href="resources/gestion/nuevaBestia.css">
<script src="resources/gestion/nuevo.js"></script>
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id="titulo">
					Nueva bestia
					<hr>
				</div>
			</div>
			<form method="POST" enctype="multipart/form-data" action="registrarBestia">
				<div id="divIzquierdo">
					<div id="panelBotonSubirImagen">
						<input type="file" id="files" name="photo" /> <br />
						<output id="list"></output>
						<script> document.getElementById('files').addEventListener('change', archivo, false);</script>

					</div>
				</div>
				<!-- divIzquierdo -->

				<div id="divDerecho">

					<p>
						Nombre: <input type="text" name="nombreBestia" />
					</p>

					<div id="panelStatsMonst">
						<p>Estadisticas:</p>
						<div id="tablaEstadMonst">
							<table>
								<thead>
									<tr>
										<td>Nivel</td>
										<td><input type="text" name="nivel" /></td>
									</tr>
									<tr>
										<td>Vida</td>
										<td><input type="text" name="vida" /></td>
									</tr>
									<tr>
										<td>Fuerza</td>
										<td><input type="text" name="fuerza" /></td>
									</tr>
									<tr>
										<td>Precision</td>
										<td><input type="text" name="precision" /></td>
									</tr>
									<tr>
										<td>Defensa</td>
										<td><input type="text" name="defensa" /></td>
									</tr>
									<tr>
										<td>Velocidad</td>
										<td><input type="text" name="velocidad" /></td>
									</tr>
							</table>
						</div>
					</div>

					<div id="panelRecompensas">
						<div id="panelExpYOro">
							<table>
								<tr>
									<td>Experiencia:</td>
									<td><input type="text" name="exp" /></td>
									<td>puntos</td>
								</tr>
								<tr>
									<td>Oro:</td>
									<td><input type="text" name="oro" /></td>
									<td>monedas</td>
								</tr>
							</table>
						</div>
						<!-- <div id="panelObjetos"></div> -->
					</div>
				</div>
				<!-- divDerecho -->
				
				<div id = "crearBestia">
					<button type="submit">Guardar bestia</button>
				</div>
			</form>
			
				<div id = "panelVolver">
					<a href = "gestionBestias">
						<button>Volver</button>
					</a>
				</div>
						
				<div id = "mensajeError">
					<c:if test="${not empty bestiaError}">
						<p id = "mensajeError">
							<c:out value="${bestiaError}" />
						</p>
					</c:if>
				</div>
		</div>
	</div>
</div>
<!-- container -->
</body>
</html>
