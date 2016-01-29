<%@ include file="fragments/headerGestion.jspf"%>
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">

<script>
	function aplicarFiltro() {
		var value = $("#busqueda").val();
		$("table tbody tr").each(function(index) {
			$row = $(this);
			var id = $row.find("td:nth-child(2)").text();
			if (id.indexOf(value) != 0) {
				$row.hide();
			}
			else{
				$row.show();
			}
		});
	};

	function eliminarBestia(id) {
		var data = {idBestia: id}
		$.ajax({
			dataType: "json",
			url: "${prefix}borrarBestia",
			type: "POST",
			data: data,
			success: function(d) {
				eliminarFila(d, id);
			}
		});	
	}

	function eliminarFila(d, id) {
		console.log(d)
		$("#fila_" + id).remove();
	}
	
</script>


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
				<div id="find">
					<input placeholder = "Busqueda por nombre..." id="busqueda" type="text" onkeyup = "aplicarFiltro()"/>
				</div>
				<a href="nuevaBestia">
					<button class="botonesGUsu" id="anadir"></button>
				</a>

				<div class="apanel">
					<table>
						<thead>
							<tr>
								<th id="imagen">IMAGEN</th>
								<th id="nombre">NOMBRE</th>
								<th id="nivel">NIVEL</th>
								<th id="recompensas">RECOMPENSAS</th>
								<th id="aux"></th>
								<th id="aux"></th>
								<th id="scroll"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="b" items="${bestias}">
								<tr id="fila_${b.id}">
									<td id="imagen"><img class="bicho"
										src="bestia/photo?id=${b.id}" /></td>
									<td id="nombre"><c:out value="${b.nombre}" /></td>
									<td id="nivel"><c:out value="${b.nivel}" /></td>
									<td id="recompensas"><c:out value="${b.oro} monedas" /> <br />
										<c:out value="${b.exp} exp" /></td>
									<td id="aux">
										<form action="modificarBestia" method="POST">
											<button name="idBestia" class="botonesInternos"
												id="modificar" type="submit" value="${b.id}"></button>
										</form>
									</td>
									<td id="aux">
										<button name="idBestia" class="botonesInternos" id="eliminar"
											value="${b.id}" onclick="eliminarBestia(${b.id})"></button>
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