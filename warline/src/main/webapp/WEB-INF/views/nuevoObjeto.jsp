<%@ include file="fragments/headerGestion.jspf"%>
<%@ page import="es.fdi.iw.model.TipoItem"%>

<link rel="stylesheet" type="text/css"
	href="resources/gestion/nuevoObjeto.css">
<script src="resources/gestion/nuevo.js"></script>

<script>
	$(function() {
		var valor = document.getElementById("tipoObj").value;
		mostrarOcultarAtaques(valor);	
	});
	
	function cambio(){
		var valor = document.getElementById("tipoObj").value;
		console.log(valor);
		mostrarOcultarAtaques(valor);
	}
	
</script>

<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id="titulo">
					Nuevo objeto
					<hr>
				</div>
			<form action="registrarItem" enctype="multipart/form-data" method="POST">
				<input type="hidden" name="nombreViejo" value = "${objeto.nombre}"/>
				<input type="hidden" name="idObj" value = "${objeto.id}"/>
				<div id="divIzquierdo">
					<div id="panelImagen">
						<output id="list">
							<c:if test="${not empty objeto}">
								<img  class="bicho" src = "objeto/photo?id=${objeto.id}"/>
							</c:if>
						</output>
					</div>
					<input type="file" id="files" name="photo" />
					<script> 
						document.getElementById('files').addEventListener('change', archivo, false);
					</script>
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
						Tipo de objeto: 
						<select id="tipoObj" name="tipoObj" onchange="cambio()">
							<c:choose>
								<c:when test = "${not empty objeto}">
									<option value = "${objeto.tipo}"> ${objeto.tipo.nombreTipo} </option>
									<c:forEach items = "<%=TipoItem.values()%>" var = "t">
										<c:if test = "${t != objeto.tipo}">
											<option value="${t}">${t.nombreTipo}</option>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items = "<%=TipoItem.values()%>" var = "t">
										<option value="${t}">${t.nombreTipo}</option>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</select>
					</p>
					<div id="ataques">
						<p> Ataques: </p>
						<div id="tablaEstadAtq">
							<table>
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Daño</th>
									<th>Precisión</th>
									<th>Velocidad</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td><input type="text" name="nombreAtq1" value="${objeto.at1.nombre}" /></td>
										<td><input type="text" name="danoAtq1" value="${objeto.at1.porcDano}" /></td>
										<td><input type="text" name="precisionAtq1" value="${objeto.at1.porcPrecision}" /></td>
										<td><input type="text" name="velocidadAtq1" value="${objeto.at1.tiempo}" /></td>
									</tr>
									<tr>
										<td><input type="text" name="nombreAtq2" value="${objeto.at2.nombre}" /></td>
										<td><input type="text" name="danoAtq2" value="${objeto.at2.porcDano}" /></td>
										<td><input type="text" name="precisionAtq2" value="${objeto.at2.porcPrecision}" /></td>
										<td><input type="text" name="velocidadAtq2" value="${objeto.at2.tiempo}" /></td>										
									</tr>
									<tr>
										<td><input type="text" name="nombreAtq3" value="${objeto.at3.nombre}" /></td>
										<td><input type="text" name="danoAtq3" value="${objeto.at3.porcDano}" /></td>
										<td><input type="text" name="precisionAtq3" value="${objeto.at3.porcPrecision}" /></td>
										<td><input type="text" name="velocidadAtq3" value="${objeto.at3.tiempo}" /></td>
									</tr>
							</tbody>
							</table>
						</div>
					</div>
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
										<td>porcPrecision</td>
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
</div>
<!-- container -->
</body>
</html>
