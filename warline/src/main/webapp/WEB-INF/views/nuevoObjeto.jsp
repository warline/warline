<%@ include file="fragments/headerGestion.jspf"%>

<link rel="stylesheet" type="text/css"
	href="resources/gestion/nuevoObjeto.css">
<script src="resources/gestion/nuevo.js"></script>

<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id="titulo">
					Nuevo objeto
					<hr>
				</div>
				<form action="registrarItem" enctype="multipart/form-data" method="POST">
				<input type="hidden" name="idObj" value = "${objeto.id}"/>
				<div id="divIzquierdo">
					<div id="panelBotonSubirImagen">
						<input type="file" id="files" name="photo" />
						<output id="list"></output>
						<script> document.getElementById('files').addEventListener('change', archivo, false);</script>

					</div>


					<!--  <div id="panelDisponibilidad">
						<p>
							<input type="checkbox" id="disponible"> </input> Disponible en
							armeria
						</p>
					</div>-->

				</div>
				<!-- divIzquierdo -->

				<div id="divDerecho">

					<p>
						Nombre: <input type="text" name="nombreObj" value = "${objeto.nombre}"/>
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
										<td><input type="text" name="nivelObj" value="${objeto.nivel}" /></td>
									</tr>
									<tr>
										<td>Vida</td>
										<td><input type="text" name="vidaObj" value="${objeto.vida}" /></td>
									</tr>
									<tr>
										<td>Fuerza</td>
										<td><input type="text" name="fuerzaObj" value="${objeto.fuerza}" /></td>
									</tr>
									<tr>
										<td>Precision</td>
										<td><input type="text" name="precisionObj" value="${objeto.precision}" />
										</td>
									</tr>
									<tr>
										<td>Defensa</td>
										<td><input type="text" name="defObj" value="${objeto.defensa}" /></td>
									</tr>
									<tr>
										<td>Velocidad</td>
										<td><input type="text" name="velObj" value="${objeto.velocidad}" /></td>
									</tr>
									<tr>
										<td>Precio</td>
										<td><input type="text" name="precioObj" value="${objeto.precio}" /></td>
									</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- divDerecho -->
				
				<div id = "crearObjeto">
					<button type="submit">Guardar objeto</button>
				</div>
			</form>
			
				<div id = "panelVolver">
					<a href = "gestionObjetos">
						<button>Volver</button>
					</a>
				</div>
					
				<div id = "mensajeError">
					<c:if test="${not empty objetoError}">
						<p id = "mensajeError">
							<c:out value="${objetoError}" />
						<p>
					</c:if>
				 </div>		
		</div>
	</div>

</div>
<!-- container -->
</body>
</html>
