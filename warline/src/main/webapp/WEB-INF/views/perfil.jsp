<%@ include file="fragments/header.jspf" %>

<script src="resources/perfil/perfil.js"></script>
<script src="resources/armeria/armeria.js"></script>

<link rel = "stylesheet" type = "text/css" href = "resources/perfil/perfil.css">

<script>
	var statsHeroe = {vida: ${user.heroe.vida},
			defensa: ${user.heroe.defensa}, 
			fuerza: ${user.heroe.fuerza},
			velocidad: ${user.heroe.velocidad},
			precision: ${user.heroe.precision}, 
			puntosHab: ${user.heroe.puntosHab}};
	
	var constHeroe = ${constantesHeroe};

	$(function() {
		activarDesactivarBotones(statsHeroe, constHeroe);	
	});
	
	function subirStats(t) {
		var data = {subir: t.value}
		$.ajax({
			dataType: "json",
			url: "${prefix}subirStats",
			type: "POST",
			data: data,
			success: function(d) {
				console.log("Esto funciona", d);
				actualizarStats(d);
			}
		});	
	}
	
	function actualizarStats(d) {
		$("#vida").html(d.vida);
		$("#fuer").html(d.fuerza);
		$("#prec").html(d.precision);
		$("#def").html(d.defensa);
		$("#vel").html(d.velocidad);
		$("#puntosHab").html(d.puntosHab);
		activarDesactivarBotones(d, constHeroe);
	};
	
</script>
 
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Perfil <hr> </div>
			</div>
			
			<div id = "divIzquierdo">
				<div id = "panelNombreYFoto">
					<h2> <c:out value="${user.heroe.nombre}"/> </h2>
					<div id = "imagenPerfil"><img src = "${user.heroe.imagen}"/></div>
				</div>
				<div id = "estadisticas">
					<div id = "tablaEstad">
						<table>
							<tr>  <td> Nivel </td><td> <c:out value="${user.heroe.nivel}"/> </td>
							<tr>  <td> Vida </td><td id = "vida"> <c:out value="${user.heroe.vida}"/> </td>
								  <td> <button id="subirVida" value = "subirVida" onclick = "subirStats(subirVida)"> + </button> </td> 
							</tr>
							<tr>  <td> Fuerza </td><td id = "fuer"> <c:out value="${user.heroe.fuerza}"/> </td>
								  <td> <button id ="subirFuerza" value = "subirFue" onclick = "subirStats(subirFuerza)"> + </button> </td>
					        </tr>
							<tr>  <td> Precisión </td><td id = "prec"> <c:out value="${user.heroe.precision}"/> </td>
								  <td> <button id = "subirPrecision" value = "subirPrec" onclick = "subirStats(subirPrecision)"> + </button> </td>
							</tr>
							<tr>  <td> Defensa </td><td id = "def"> <c:out value="${user.heroe.defensa}"/> </td>
								  <td> <button id = "subirDefensa" value = "subirDef" onclick = "subirStats(subirDefensa)"> + </button> </td>
							</tr>
							<tr>  <td> Velocidad </td><td id = "vel"> <c:out value="${user.heroe.velocidad}"/> </td>
								  <td> <button id = "subirVelocidad" value = "subirVel" onclick = "subirStats(subirVelocidad)"> + </button> </td>
						    </tr>

							<tr>  <td> Oro </td><td> <c:out value="${user.heroe.oro}"/> </td>  </tr>
							<tr>  <td> Experiencia </td><td> <c:out value="${user.heroe.xp}"/> / <c:out value="${user.heroe.expSiguienteNivel}"></c:out></td>  </tr>
							<tr>  <td> Puntos de Habilidad: </td><td id = "puntosHab"> <c:out value="${user.heroe.puntosHab}"/> </td>  </tr>
						</table>
					</div>
				</div>
			</div> <!-- divIzquierdo -->
			
			<div id = "divDerecho">
				<div id = "equipo">
				<table>
				<caption> EQUIPO </caption>
				<tr>
					<td></td>
					<td>
					<div id = "imagenObjeto"> 
						<c:set var = "casc" value = "${user.heroe.casco}" scope = "session"/>
						<form action="desequiparObjeto" method="POST">
						<c:if test="${not empty casc}">
						
							<button name="idObjeto" type = "submit" value = "${casc.id}" 
									onmouseout = "desaparecePerfil()" 
									onmouseover = "aparecePerfil(event, '${casc.id}', '${casc.fuerza}', '${casc.defensa}', '${casc.velocidad}', '${casc.precision}', '${casc.nivel}', '${casc.vida}', '${casc.precio}', '${casc.tipo.nombreTipo}', '${casc.nombre}')" >
								<img src = "objeto/photo?id=${casc.id}" align="middle"/>
							</button> 
						
						</c:if>
						</form>
					</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>
					<div id = "imagenObjeto"> 
						<c:set var = "esp" value = "${user.heroe.espada}" scope = "session"/>
						<form action="desequiparObjeto" method="POST">
						<c:if test="${not empty esp}">
						
							<button name="idObjeto" type = "submit" value = "${esp.id}" 
										onmouseout = "desaparecePerfil()" 
										onmouseover = "aparecePerfil(event, '${esp.id}', '${esp.fuerza}', '${esp.defensa}', '${esp.velocidad}', '${esp.precision}', '${esp.nivel}', '${esp.vida}', '${esp.precio}', '${esp.tipo.nombreTipo}', '${esp.nombre}')" >
								<img src = "objeto/photo?id=${esp.id}" align="middle"/>
							</button> 
						
						</c:if>
						</form>
					</div>
					</td>
					<td>
					<div id = "imagenObjeto"> 
						<c:set var = "armad" value = "${user.heroe.armadura}" scope = "session"/>
						<form action="desequiparObjeto" method="POST">
						<c:if test="${not empty armad}">
						
							<button name="idObjeto" type = "submit" value = "${armad.id}" 
										onmouseout = "desaparecePerfil()" 
										onmouseover = "aparecePerfil(event, '${armad.id}', '${armad.fuerza}', '${armad.defensa}', '${armad.velocidad}', '${armad.precision}', '${armad.nivel}', '${armad.vida}', '${armad.precio}', '${armad.tipo.nombreTipo}', '${armad.nombre}')" >
								<img src = "objeto/photo?id=${armad.id}" align="middle"/>
							</button> 
						
						</c:if>
						</form>
					</div>
					</td>
					<td>
					<div id = "imagenObjeto"> 
						<c:set var = "esc" value = "${user.heroe.escudo}" scope = "session"/>
						<form action="desequiparObjeto" method="POST">
						<c:if test="${not empty esc}">
						
							<button name="idObjeto" type = "submit" value = "${esc.id}" 
										onmouseout = "desaparecePerfil()" 
										onmouseover = "aparecePerfil(event, '${esc.id}', '${esc.fuerza}', '${esc.defensa}', '${esc.velocidad}', '${esc.precision}', '${esc.nivel}', '${esc.vida}', '${esc.precio}', '${esc.tipo.nombreTipo}', '${esc.nombre}')" >
								<img src = "objeto/photo?id=${esc.id}" align="middle"/>
							</button> 
						
						</c:if>
						</form>
					</div>
					</td>						
				</tr>
				<tr>
					<td></td>
					<td>
					<div id = "imagenObjeto"> 
						<c:set var = "bot" value = "${user.heroe.botas}" scope = "session"/>
						<form action="desequiparObjeto" method="POST">
						<c:if test="${not empty bot}">
						
							<button name="idObjeto" type = "submit" value = "${bot.id}" 
										onmouseout = "desaparecePerfil()" 
										onmouseover = "aparecePerfil(event, '${bot.id}', '${bot.fuerza}', '${bot.defensa}', '${bot.velocidad}', '${bot.precision}', '${bot.nivel}', '${bot.vida}', '${bot.precio}', '${bot.tipo.nombreTipo}', '${bot.nombre}')" >
								<img src = "objeto/photo?id=${bot.id}" align="middle"/>
							</button> 
						
						</c:if>
						</form>
					</div>
					</td>
					<td></td>
				</tr>	
				</table>
			</div>
			<div id = "inventario">
			<table>
				<caption> INVENTARIO </caption>
				<c:forEach var="i" items="${user.heroe.inventario}">
					<c:set var = "k" value = "0" scope = "session"/>
					<c:if test="${k%5 == 0}"> <tr> </c:if>
							<td>
								<div id = "imagenObjeto" 
										onmouseout = "desaparecePerfil()" 
										onmouseover = "aparecePerfil(event, '${i.id}', '${i.fuerza}', '${i.defensa}', '${i.velocidad}', '${i.precision}', '${i.nivel}', '${i.vida}', '${i.precio}', '${i.tipo.nombreTipo}', '${i.nombre}')" >
									<form action="equiparObjeto" method="POST">
										<button name="idObjeto" type = "submit" value = "${i.id}"><img src = "objeto/photo?id=${i.id}" align="middle"/></button> 
									</form>
									
								</div>
							</td>
					<c:set var = "k" value = "${k+1}"/>
				</c:forEach>
				<c:forEach begin = "${user.heroe.inventario.size()}" end = "24" varStatus="loop">
					<c:if test="${loop.index%5 == 0}"> <tr> </c:if>
					<td></td>
				</c:forEach>	
			</table>
			</div>
			<div class = "descripcion" id = "panelInfo">
				<div id = "foto">
					<img id = idFoto align="middle"/>
				</div>
				<div id = "divTabla">
				<table id = "stats">
					<caption id = "idNombre"></caption>
					<tr>
					<td>
						<p id = "idFuerza"> 
						<p id = "idDefensa"> 
						<p id = "idVelocidad"> 
						<p id = "idPrecision">
					</td>
					<td> 
						<p id = "idNivel">
						<p id = "idVida">
						<p id = "idTipo">
						<p id = "idPrecio">
					</td>
					</tr>
				</table>	
				</div>	
			</div>
			</div> <!-- divDerecho -->
		</div>
	</div>
	
  </div> <!-- container -->
</body>
</html>

