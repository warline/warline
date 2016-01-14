<%@ include file="fragments/headerGestion.jspf"%>

<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">

	<!--<img id="fondo" src="./fotos/background.png"/>-->
	<div id="container">
		<div id="main">
			<div id="capaMadre">
				<div class="cabecera">
					<div id="titulo">
						GESTION DE BESTIAS
						<hr>
					</div>
				</div>

			<div id="acuerpo">
				<form>
					<div id="find">
						<input type="text" name="filtro">
						<button class="botonesGUsu" id="filtrar">Buscar</button>
					</div>

				</form>

				<a href="nuevaBestia">
					<button class="botonesGUsu" id="anadir"></button>
				</a>
				
				<div class="apanel">
					<table>
						<thead>
							<tr>
								<th id = "imagen">IMAGEN</th>
								<th id = "nombre">NOMBRE</th>
								<th id = "nivel">NIVEL</th>
								<th id = "recompensas">RECOMPENSAS</th>
								<th id = "aux"></th>
								<th id = "aux"></th>
								<th id = "scroll"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="b" items="${bestias}">
								<tr>
									<td id = "imagen"><img class="bicho" src="bestia/photo?id=${b.id}"/></td>
									<td id = "nombre"><c:out value="${b.nombre}" /></td>
									<td id = "nivel"><c:out value="${b.nivel}" /></td>
									<td id = "recompensas"> 
										<c:out value = "${b.oro} monedas" />
										<br/>
										<c:out value = "${b.exp} exp" />
									</td>
									<td id = "aux"> 
										<button class="botonesInternos" id="modificar" value = "${i.id}">
										</button> 
									</td>
									<td id = "aux"> 
										<form action="borrarBestia" method="POST">
											<button name="idBestia" class="botonesInternos" id="eliminar" type = "submit" value = "${b.id}"></button>
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
</div>
</body>
</html>