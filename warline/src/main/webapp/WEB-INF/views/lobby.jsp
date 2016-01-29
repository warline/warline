<%@ include file="fragments/header.jspf"%>

<script src="resources/perfil/perfil.js"></script>

<link rel="stylesheet" type="text/css" href="resources/combates/lobby.css" />
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id="titulo">
					ARENA
					<hr>
				</div>
			</div>
			
			<div id="divIzquierdo">

				<div id="divIzqSup">
					<div id="divIzqSupIzq">
						<div id="combateAmigo">
							<br>
							<p id="tituloDivs">Reta a otro Héroe:
							<form action="buscarAmigo" method="POST">
								<input name="busqueda" type="text" />
								<p>
									<button type="submit" class="botonesGUsu" id="filtrar">¡Lucha!</button>
							</form>

							<p id="excepciones">
								<c:out value="${falloAmigo.message}"></c:out>
							</p>
						</div>
					</div>

					<div id="divIzqSupDer">
						<div id="combateRandom">
							<br>
							<p id="tituloDivs">Combate aleatorio:
							<form action="combateAleatorio" method="POST">
								<button type="submit" class="botonesGUsu" id="filtrar">¡Lucha ahora!</button>
							</form>
							<p id="excepciones"> <c:out value="${falloAleatorio.message}"></c:out> </p>
						</div>
					</div>
				</div>

				<div id="divIzqInf">
					<div id="divPerfil">
						<div id="statsYimagen">
							<div id="stats">
								<table>
									<caption>Mis estadísticas:</caption>
									<tr>
										<td>Nivel</td>
										<td><c:out value="${user.heroe.nivel}" /></td>
									</tr>
									<tr>
										<td>Vida</td>
										<td><c:out value="${user.heroe.vida}" /></td>
									</tr>
									<tr>
										<td>Fuerza</td>
										<td><c:out value="${user.heroe.fuerza}" /></td>
									</tr>
									<tr>
										<td>Precisión</td>
										<td><c:out value="${user.heroe.precision}" /></td>
									</tr>
									<tr>
										<td>Defensa</td>
										<td><c:out value="${user.heroe.defensa}" /></td>
									</tr>
									<tr>
										<td>Velocidad</td>
										<td><c:out value="${user.heroe.velocidad}" /></td>
									</tr>
								</table>
							</div>
							<div id="imagen">
								<img src="${user.heroe.imagen}" />
							</div>
						</div>

						<div id="equipoHeroe">
							<div id="equipo">
								<table>
									<caption>EQUIPO</caption>
									<tr>
										<td></td>
										<td>
											<c:set var="casc" value="${user.heroe.casco}" scope="session" />
											<c:if test="${not empty casc}">
											<div id="imagenObjeto"
													onmouseover="aparecePerfil(event, '${casc.id}', '${casc.fuerza}', '${casc.defensa}', '${casc.velocidad}', '${casc.precision}', '${casc.nivel}', '${casc.vida}', '${casc.precio}', '${casc.tipo.nombreTipo}', '${casc.nombre}')"
													onmouseout = "desaparecePerfil()">
													<img src="objeto/photo?id=${casc.id}" align="middle"/>
											</div>
											</c:if>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>
											<c:set var="esp" value="${user.heroe.espada}" scope="session" />
											<c:if test="${not empty esp}">
											<div id="imagenObjeto"
													onmouseover="aparecePerfil(event, '${esp.id}', '${esp.fuerza}', '${esp.defensa}', '${esp.velocidad}', '${esp.precision}', '${esp.nivel}', '${esp.vida}', '${esp.precio}', '${esp.tipo.nombreTipo}', '${esp.nombre}')"
													onmouseout = "desaparecePerfil()">
													<img src="objeto/photo?id=${esp.id}">
											</div>
											</c:if>
										</td>
										<td>
											<c:set var="armad" value="${user.heroe.armadura}" scope="session" />
											<c:if test="${not empty armad}">
											<div id="imagenObjeto"
													onmouseover="aparecePerfil(event, '${armad.id}', '${armad.fuerza}', '${armad.defensa}', '${armad.velocidad}', '${armad.precision}', '${armad.nivel}', '${armad.vida}', '${armad.precio}', '${armad.tipo.nombreTipo}', '${armad.nombre}')"
													onmouseout = "desaparecePerfil()">
													<img src="objeto/photo?id=${armad.id}" align="middle"/>
											</div>
											</c:if>
										</td>
										<td>
											<c:set var="esc" value="${user.heroe.escudo}" scope="session" />
											<c:if test="${not empty esc}">
											<div id="imagenObjeto"
													onmouseover="aparecePerfil(event, '${esc.id}', '${esc.fuerza}', '${esc.defensa}', '${esc.velocidad}', '${esc.precision}', '${esc.nivel}', '${esc.vida}', '${esc.precio}', '${esc.tipo.nombreTipo}', '${esc.nombre}')"
													onmouseout = "desaparecePerfil()">
													<img src="objeto/photo?id=${esc.id}" align="middle"/>
											</div>
											</c:if>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<c:set var="bot" value="${user.heroe.botas}" scope="session" />
											<c:if test="${not empty bot}">
											<div id="imagenObjeto"
													onmouseover="aparecePerfil(event, '${bot.id}', '${bot.fuerza}', '${bot.defensa}', '${bot.velocidad}', '${bot.precision}', '${bot.nivel}', '${bot.vida}', '${bot.precio}', '${bot.tipo.nombreTipo}', '${bot.nombre}')"
													onmouseout = "desaparecePerfil()">
													<img src="objeto/photo?id=${bot.id}" align="middle"/>
											</div>
											</c:if>
										</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="nombreHeroe">
								<c:out value="${user.heroe.nombre}"></c:out>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class = "descripcion" id = "panelInfo">
				<div id = "foto">
					<img id = idFoto align="middle"/>
				</div>
				<div id = "divTabla">
				<table id = "statsEquipo">
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
			<div id="divDerecho">
				<table id="topDiez">
						<thead>
							<caption id="toptitle">Mejores luchadores</caption>
							<tr>
								<th> Posición </th>
								<th> Héroe </th>
								<th> Nivel </th>
							</tr>
						<tbody>
							<c:forEach var="t" items="${heroes}" >
							<c:set var="ind" value = "1" scope = "session"/>
							<tr> 
								<td><h2> <c:out value="${ind}" /></h2></td>
								<td><h2> <c:out value="${t.nombre}" /></h2></td>
								<td><h2> <c:out value="${t.nivel}"/></h2></td>
							</tr>
							<c:set var="ind" value = "${ind+1}"/>
							</c:forEach>
						</tbody>	
					
					</table>
					<br>
					<hr>
			</div>
			
		</div>
	</div>
</div>

</body>
</html>