<%@ include file="fragments/headerGestion.jspf"%>
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">

<script>
	function cambioFiltro() {
		var valor = $("#opcionBusqueda").val();
		if (valor == 2) {
		 	$("#busqueda").attr("placeholder", "Busqueda por nombre de objeto...");
		} else if (valor == 3) {
			$("#busqueda").attr("placeholder", "Busqueda por tipo de objeto...");
		} else {
			$("#busqueda").attr("placeholder", "Busqueda por nivel...");
		}
		aplicarFiltro();
	}
	
	function aplicarFiltro() {
		var filtro = $("#opcionBusqueda").val();
		var value = $("#busqueda").val();
		$("table tbody tr").each(function(index) {
			$row = $(this);
			var id = $row.find("td:nth-child(" + filtro + ")").text();
			if (id.indexOf(value) != 0) {
				$row.hide();
			}
			else{
				$row.show();
			}
		});
	}

	function eliminarObjeto(id) {
		var data = {idObjeto: id}
		$.ajax({
			dataType: "json",
			url: "${prefix}borrarObjeto",
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
					GESTION DE OBJETOS
					<hr>
				</div>
			</div>

			<div id="acuerpo">
				<div id="find">
					<input placeholder = "Busqueda por nombre de objeto..." 
						id="busqueda" type="text" onkeyup = "aplicarFiltro()"/>
					
					<select id="opcionBusqueda" onchange="cambioFiltro()">
						<option value = "2"> Nombre </option>
						<option value = "3"> Tipo </option>
						<option value = "4"> Nivel </option>
					</select>
					
					<a href="nuevoObjeto">
						<button class="botonesGUsu" id="anadir"></button>
					</a>
				</div>

				<div class="apanel">
					<table>
						<thead>
							<tr>
								<th id="imagen">IMAGEN</th>
								<th id="nombre">NOMBRE</th>
								<th id="tipo">TIPO</th>
								<th id="nivel">NIVEL</th>
								<th id="aux"></th>
								<th id="aux"></th>
								<th id="scroll"></th>
							</tr>
						<thead>
						<tbody>
							<c:forEach var="i" items="${objetos}">
								<tr id="fila_${i.id}">
									<td id="imagen"><img class="bicho"
										src="objeto/photo?id=${i.id}" align="middle" /></td>
									<td id="nombre"><c:out value="${i.nombre}" /></td>
									<td id="tipo"><c:out value="${i.tipo.nombreTipo}" /></td>
									<td id="nivel"><c:out value="${i.nivel}" /></td>
									<td id="aux">
										<form action="modificarObjeto" method="POST">
											<button name="idObjeto" class="botonesInternos"
												id="modificar" type="submit" value="${i.id}"></button>
										</form>
									</td>
									<td id="aux">
										<button name="idObjeto" class="botonesInternos" id="eliminar"
											value="${i.id}" onclick="eliminarObjeto(${i.id})"></button>
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