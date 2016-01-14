<%@ include file="fragments/header.jspf" %>


<script src="resources/armeria/armeria.js"></script>
<link rel="stylesheet" type="text/css" href="resources/armeria/armeria.css"/>

<script>
var listaDeObjetos = ${listaDeObjetos};
[[10, 18, 12, 14, 15], [], []]; 
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
						<c:forEach var="i" items="${user.getHeroe().getInventario()}">
							<c:set var = "k" value = "0" scope = "session"/>
							<c:if test="${k%5 == 0}"> <tr> </c:if>
									<td>
										<div id = "imagenObjeto" onmouseover = "desaparece('${i.getFuerza()}', '${i.getDefensa()}', '${i.getVelocidad()}', '${i.getPrecision()}', '${i.getNivel()}', '${i.getVida()}', '${i.getPrecio()}', '${i.getTipo()}', '${i.getNombre()}')" > 
											<form action="venderObjeto" method="POST">
												<button name="idObjeto" type = "submit" value = "${i.id}"><img src = "resources/armeria/images/${i.nombre}.png" align="middle"/></button> 
											</form>
										</div>
									</td>
							<c:set var = "k" value = "${k+1}"/>
						</c:forEach>
						<c:forEach begin = "${user.getHeroe().getInventario().size()}" end = "24" varStatus="loop">
							<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
							<td></td> <!-- Celdas de inventario vacias -->
						</c:forEach>	
					</table>
					<p class = "adinero" id = "monedas"> Monedas: <c:out value="${user.getHeroe().oro}" /></p></div>
					
				<div class = "apanel" id = "avendedor">
					<table>
						<caption> ARMERIA </caption>
						<c:forEach var="i" items="${items}">
							<c:set var = "j" value = "0" scope = "session"/>
							<c:if test="${j%5 == 0}"> <tr> </c:if>
									<td>
										<div id = "imagenObjeto" onmouseover = "desaparece('${i.getFuerza()}', '${i.getDefensa()}', '${i.getVelocidad()}', '${i.getPrecision()}', '${i.getNivel()}', '${i.getVida()}', '${i.getPrecio()}', '${i.getTipo()}', '${i.getNombre()}')" > 
											<form action="comprarObjeto" method="POST">
												<button name="idObjeto" type = "submit" value = "${i.id}"><img src = "resources/armeria/images/${i.nombre}.png" align="middle"/></button> 
											</form>
										</div>
									</td>
							<c:set var = "j" value = "${j+1}"/>
						</c:forEach>
						<c:forEach begin = "${items.size() }" end = "24" varStatus="loop">
							<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
							<td></td>
						</c:forEach>
					</table>
					<p class = "adinero" id = "errorDinero">
						<c:if test="${not empty errorCompra}">
							<c:out value="${errorCompra}"/>
						</c:if>
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
