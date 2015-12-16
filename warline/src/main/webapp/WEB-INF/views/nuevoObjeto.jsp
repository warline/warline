<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/headerGestion.jspf"%>
<!DOCTYPE html>
<html>
<head>
<title>Nuevo_Objeto</title>
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
<link rel="stylesheet" type="text/css"
	href="resources/gestion/nuevoObjeto.css">
</head>
<body>
	<div id="container">
		<div id="main">
			<div id="capaMadre">
				<div class="cabecera">
					<div id="titulo">
						Nuevo objeto
						<hr>
					</div>
				</div>
				<div id="divIzquierdo">
					<div id="fotoObjeto"></div>
					<div id="panelBotonSubirImagen">
						<button type="submit" id="subirImagen">Subir imagen</button>
					</div>

					<div id="panelDisponibilidad">
						<p>
							<input type="checkbox" id="disponible"> </input> Disponible en
							armeria
						</p>
					</div>

				</div>
				<!-- divIzquierdo -->

				<div id="divDerecho">
					<form action="registrarItem" method="POST">
						<p>
							Nombre: <input type="text" name="nombreObj" />
						</p>

						<p>
							Tipo de objeto: <select name="tipoObj">
								<option value="ESPADA">Espada</option>
								<option value="CASCO">Casco</option>
								<option value="BOTAS">Botas</option>
								<option value="ARMADURA">Armadura</option>
							</select>
						</p>

						<div id="panelStatsObj">
							<p>Estadisticas:</p>
							<div id="tablaEstadObj">
								<table>
									<thead>
										<tr>
											<td>Nivel</td>
											<td><input type="text" name="nivelObj" value="10" /></td>
										</tr>
										<tr>
											<td>Vida</td>
											<td><input type="text" name="vidaObj" value="0" /></td>
										</tr>
										<tr>
											<td>Fuerza</td>
											<td><input type="text" name="fuerzaObj" value="25" /></td>
										</tr>
										<tr>
											<td>Habilidad</td>
											<td><input type="text" name="precisionObj" value="5" />
											</td>
										</tr>
										<tr>
											<td>Defensa</td>
											<td><input type="text" name="defObj" value="0" /></td>
										</tr>
										<tr>
											<td>Velocidad</td>
											<td><input type="text" name="velObj" value="-2" /></td>
										</tr>
										<tr>
											<td>Precio</td>
											<td><input type="text" name="precioObj" value="100" />
											</td>
										</tr>
								</table>
							</div>
						</div>

						<div id="panelBotonNuevo">
							<a href=gestionObjetos>
								<button type="submit" id="guardarObj">Guardar objeto</button>
							</a>
						</div>

					</form>

					<c:if test="${not empty objetoError}">
						<c:out value="${objetoError}" />
					</c:if>



				</div>
				<!-- divDerecho -->
			</div>
		</div>

	</div>
	<!-- container -->
</body>
</html>
