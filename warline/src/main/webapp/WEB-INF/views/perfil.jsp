<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf" %>

<script src= "resources/ui/external/jquery/jquery.js"></script>
<script src="resources/ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="resources\ui\jquery-ui.css"/>

<script src="resources/perfil/perfil.js"></script>
<link rel="stylesheet" type="text/css" href="resources/fragments/plantilla.css"/>
<link rel = "stylesheet" type = "text/css" href = "resources/perfil/perfil.css">

<script type="text/javascript">
	var vid = '${user.getHeroe().getVida()}';
	var fue = '${user.getHeroe().getFuerza()}';
	var prec = '${user.getHeroe().getPrecision()}';
	var def = '${user.getHeroe().getDefensa()}';
	var vel = '${user.getHeroe().getVelocidad()}';
	var puntHab = '${user.getHeroe().getPuntosHab()}';
	window.onload = setTimeout(function(){activarDesactivarBotones(vid, fue, prec, def, vel, puntHab)},50);
</script>

<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Perfil <hr> </div>
			</div>
			
			<div id = "divIzquierdo">
				<div id = "panelNombreYFoto">
					<h2> <c:out value="${user.getHeroe().nombre}"/> </h2>
					<div id = "imagenPerfil"><img src = "${user.getHeroe().imagen}"/></div>
				</div>
				<div id = "estadisticas">
					<div id = "tablaEstad">
					<form method = POST action = "subirStats">
						<table>
							<tr> <td> <input hidden="submit" name="id" value="${user.id}" /> </td> </tr>
							<tr>  <td> Nivel </td><td> <c:out value="${user.getHeroe().nivel}"/> </td>
							<tr>  <td> Vida </td><td> <c:out value="${user.getHeroe().vida}"/> </td>
								  <td> <button id="subirVida" name = "subir" value = "subirVida" type="submit"> + </button> </td> 
							</tr>
							<tr>  <td> Fuerza </td><td> <c:out value="${user.getHeroe().fuerza}"/> </td>
								  <td> <button name = "subir" value = "subirFue" id ="subirFuerza" type="submit"> + </button> </td>
					        </tr>
							<tr>  <td> Precisión </td><td> <c:out value="${user.getHeroe().precision}"/> </td>
								  <td> <button name = "subir" value = "subirPrec" id = "subirPrecision" type="submit"> + </button> </td>
							</tr>
							<tr>  <td> Defensa </td><td> <c:out value="${user.getHeroe().defensa}"/> </td>
								  <td> <button name = "subir" value = "subirDef" id = "subirDefensa" type="submit"> + </button> </td>
							</tr>
							<tr>  <td> Velocidad </td><td> <c:out value="${user.getHeroe().velocidad}"/> </td>
								  <td> <button name = "subir" value = "subirVel" id = "subirVelocidad" type="submit"> + </button> </td>
						    </tr>

							<tr>  <td> Oro </td><td> <c:out value="${user.getHeroe().oro}"/> </td>  </tr>
							<tr>  <td> Experiencia </td><td> <c:out value="${user.getHeroe().xp}"/> </td>  </tr>
							<tr>  <td> Puntos de Habilidad: </td><td> <c:out value="${user.getHeroe().puntosHab}"/> </td>  </tr>
						</table>
					</form> 
					</div>
				</div>
			</div> <!-- divIzquierdo -->

			<div id = "divDerecho">
				<div id = "equipo">
				<table>
				<caption> EQUIPO </caption>
						<c:forEach var="i" items="${user.getHeroe().getEquipo()}">
							<c:set var = "j" value = "0" scope = "session"/>
							<c:if test="${j%3 == 0}"> <tr> </c:if>
									<td> <div class = "imagenObjeto" >
									<img src = "resources/armeria/images/${i.nombre}.png" align="middle"/> </div> </td>
							
							<c:set var = "j" value = "${j+1}"/>
						</c:forEach>
						<c:forEach begin = "${user.getHeroe().getEquipo().size()}" end = "8" varStatus="loop">
							<c:if test="${loop.index%3 == 0}"> <tr> </c:if>
							<td></td>
						</c:forEach>	
				</table>
			</div>
					<div id = "inventario">
					<table>
						<caption> INVENTARIO </caption>
						<c:forEach var="i" items="${user.getHeroe().getInventario()}">
							<c:set var = "k" value = "0" scope = "session"/>
							<c:if test="${k%5 == 0}"> <tr> </c:if>
									<td>
										<div class = "imagenObjeto" onClick = "${user.getHeroe().equipar(i)}">
											<img src = "resources/armeria/images/${i.nombre}.png" align="middle" />
										</div> 
									</td>
							<c:set var = "k" value = "${k+1}"/>
						</c:forEach>
						<c:forEach begin = "${user.getHeroe().getInventario().size()}" end = "24" varStatus="loop">
							<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
							<td></td>
						</c:forEach>	
					</table>
					</div>
			</div> <!-- divDerecho -->
		</div>
	</div>
	
  </div> <!-- container -->
</body>
</html>

