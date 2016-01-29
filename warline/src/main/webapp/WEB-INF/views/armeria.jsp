<%@ include file="fragments/header.jspf" %>


<script src="resources/armeria/armeria.js"></script>
<link rel="stylesheet" type="text/css" href="resources/armeria/armeria.css"/>

<script type = "text/javascript">

function venderAjax(id){
	var data = { idObjeto: id }; 
	$.ajax({
		dataType: "json",
		url: "${prefix}venderObjeto",
		type: "POST",
		data: data,
		success: function(d) {
			refreshArmeria(d);
		},
		fail: function(d) {
			console.log("Qué injusta es la vida!", d);
		}
	})		
	
}

function comprarAjax(id,idUser) {
	// en un manejador de eventos jquery, el "this" inicial es el elemento DOM sobre el que se lanza el evento
	// por tanto, $(this) es el elemento JQuery que lo envuelve 
	// el id del libro cuyos autores buscamos
	var data = { idObjeto: id, idUser: idUser }; 
	$.ajax({
		dataType: "json",
		url: "${prefix}comprarAjax",
		type: "POST",
		data: data,
		success: function(d) {
			refreshArmeria(d);
		},
		fail: function(d) {
			console.log("Qué injusta es la vida!", d);
		}
	})	
	
}

function actualizaDinero(){
	$.ajax({
		dataType: "json",
		url: "${prefix}actualizaDinero",
		type: "POST",
		success: function(d) {
			refrescaDinero(d);
		},
		fail: function(d) {
			console.log("Qué injusta es la vida!", d);
		}
	})	
}
function refrescaDinero(d){
	$(".adineroAjax").html("Monedas: " + d.dinero);
}

function refreshArmeria(items){
	for(var i = 0; i < 25; i++){
		$("#button_"+i).attr("onclick","");
		$("#button_"+i).parent().attr("onmouseover","");
		$("#imgV_"+i).remove();
	}
	for(var i = 0; i < items.length; i++){
		var imagen = $("<img/>");
		imagen.attr("src","objeto/photo?id="+items[i].id);
		imagen.attr("id","imgV_"+i);
		$("#button_"+i).append(imagen);
		$("#button_"+i).parent().attr("onmouseover","apareceArmeria('"+ items[i].id + "','"+ items[i].fuerza +"','"
				+ items[i].defensa +"','"+ items[i].velocidad + "','" + items[i].precision + "','" + items[i].nivel +
				"','" + items[i].vida + "','" + items[i].precio +
				"','" + items[i].tipo + "','" + items[i].nombre +"')");
		$("#button_"+i).attr("onclick","venderAjax("+items[i].id+")");
	}
	actualizaDinero();
}

</script>

<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> ARMERIA <hr> </div>
			</div>

			<div id="acuerpo">
				<div class = "apanel" id = "ainventario">
					<table>
						<caption> INVENTARIO </caption>
						<c:set var = "punt" value = "0" scope = "session"/>
						<c:forEach var="i" items="${user.heroe.inventario}">
							<c:set var = "k" value = "0" scope = "session"/>
							<c:if test="${k%5 == 0}"> <tr> </c:if>
									<td>
										<div id = "imagenObjeto" onmouseover = "apareceArmeria('${i.id}', '${i.fuerza}', '${i.defensa}', '${i.velocidad}', '${i.precision}', '${i.nivel}', '${i.vida}', '${i.precio}', '${i.tipo.nombreTipo}', '${i.nombre}')" > 
												<button id = "button_${punt}" name="idObjeto" onclick = "venderAjax('${i.id}')">
													<img id="imgV_${punt}" src = "objeto/photo?id=${i.id}" align="middle"/>
												</button> 
										</div>
									</td>
							<c:set var = "k" value = "${k+1}"/>
							<c:set var = "punt" value = "${punt+1}"/>
						</c:forEach>
						<c:forEach begin = "${user.heroe.inventario.size()}" end = "24" varStatus="loop">
							<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
							<td>
								<div id = "imagenObjeto" onmouseover="">
								    <button id = "button_${loop.index}" name="idObjeto" type = "submit" value = "${i.id}" onclick="">
									</button>
								</div>
							</td> <!-- Celdas de inventario vacias -->
						</c:forEach>	
					</table>
					<p class = "adineroAjax" id = "monedas"> Monedas: <c:out value="${user.heroe.oro}" /></p></div>
					
				<div class = "apanel" id = "avendedor">
					<table>
						<caption> ARMERIA </caption>
						<c:forEach var="i" items="${items}">
							<c:set var = "j" value = "0" scope = "session"/>
							<c:if test="${j%5 == 0}"> <tr> </c:if>
									<td>
										<div id = "imagenObjeto" onmouseover = "apareceArmeria('${i.id}', '${i.fuerza}', '${i.defensa}', '${i.velocidad}', '${i.precision}', '${i.nivel}', '${i.vida}', '${i.precio}', '${i.tipo.nombreTipo}', '${i.nombre}')" > 
											<c:if test = "${i.nivel > user.heroe.nivel }">
												<div id = "bloqueado"></div>
											</c:if>
												<button name="idObjeto" onclick="comprarAjax('${i.id}','${user.id}')" >
													<img src = "objeto/photo?id=${i.id}" align="middle"/>
												</button> 
										</div>
									</td>
							<c:set var = "j" value = "${j+1}"/>
						</c:forEach>
						<c:forEach begin = "${items.size()}" end = "24" varStatus="loop">
							<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
							<td></td>
						</c:forEach>
					</table>
					<div id="excepcion">
					<p class = "adinero" id="excepciones">
						<c:out value="${errorCompra.message}"></c:out>
					</p></div>
				</div>
				<div class = "apanel" id = "aobjeto">
					<div class = "panelObjeto" id = "panelObjetoDcha">
						<div class = "descripcion" id = "estadisticas">
							<table id = "stats">
							<caption id = "idNombre"> </caption>
							<tr><td id = "idFuerza"> </td><td id = "idNivel"> </td></tr>
							<tr><td id = "idDefensa"> </td><td id = "idVida"></td></tr>
							<tr><td id = "idVelocidad"> </td><td id = "idTipo"></td></tr>
							<tr><td id = "idPrecision"> </td><td id = "idPrecio"></td></tr>
							</table>
						</div>
					</div>
					<div class = "panelObjeto" id = "panelObjetoIzda">
						<div class = "descripcion" id = "foto">
							<img id = idFoto align="middle"/>
						</div>
					</div>			
				</div>
		</div>
	</div>
</div>
</div>
</body>
</html>
