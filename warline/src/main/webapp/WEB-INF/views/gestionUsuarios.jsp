<%@ include file="fragments/headerGestion.jspf"%>
<link rel="stylesheet" type="text/css"
	href="resources/gestion/gestion.css">

<script>

	function cambioFiltro() {
		var valor = $("#opcionBusqueda").val();
		if (valor == 1) {
		 	$("#busqueda").attr("placeholder", "Busqueda por nombre de heroe...");
		} else if (valor == 2) {
			$("#busqueda").attr("placeholder", "Busqueda por correo...");
		} else if (valor == 3) {
			$("#busqueda").attr("placeholder", "Busqueda por estado...");
		} else {
			$("#busqueda").attr("placeholder", "Busqueda por rol...");
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
	
	function eliminarUsuario(id) {
		var data = {idUsuario: id}
		$.ajax({
			dataType: "json",
			url: "${prefix}borrarUsuario",
			type: "POST",
			data: data,
			success: function(d) {
				eliminarFila(d, id);
			}
		});	
	}

	function eliminarFila(d, id) {
		console.log(d);
		$("#fila_" + id).remove();
	}
	
	function banearUsuario(id) {
		var data = {idUsuario: id}
		$.ajax({
			dataType: "json",
			url: "${prefix}banearUsuario",
			type: "POST",
			data: data,
			success: function(d) {
				modificarEstado(d, id);
			}
		});	
	}
	
	function modificarEstado(d, id) {
		console.log("Estado modificado", d);
		$(".ban_" + id).html(d.baneado);
	}
	
</script>

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
				<div id="find">
					<input placeholder = "Busqueda por nombre de heroe..." id="busqueda" type="text" onkeyup="aplicarFiltro()" />
					
					<select id="opcionBusqueda" onchange="cambioFiltro()">
						<option value = "1"> Usuario </option>
						<option value = "2"> Correo </option>
						<option value = "3"> Baneado </option>
						<option value = "4"> Rol </option>
					</select>
					
					<a href="nuevoAdmin">
						<button class="botonesGUsu" id="admin"></button>
					</a>
				</div>

				<div class="apanel" id="panelScroll">
					<table id="usuarios">
						<thead>
							<tr>
								<th id="nombre">USUARIO</th>
								<th>CORREO</th>
								<th id="aux">BANEADO</th>
								<th id="aux">ROL</th>
								<th id="aux"></th>
								<th id="aux"></th>
								<th id="scroll"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${users}">
								<tr id="fila_${i.id}">
									<td id="nombre"><c:out value="${i.heroe.nombre}" /></td>
									<td><c:out value="${i.login}" /></td>
									<td id="aux" class="ban_${i.id}"><c:out
											value="${i.banned}" /></td>
									<td id="aux"><c:out value="${i.role}" /></td>
									<td id="aux">
										<button class="botonesInternos" id="banear" value="${i.id}"
											onclick="banearUsuario(${i.id})"></button>
									</td>
									<td id="aux">
										<button class="botonesInternos" id="eliminar" value="${i.id}"
											onclick="eliminarUsuario(${i.id})"></button>
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
