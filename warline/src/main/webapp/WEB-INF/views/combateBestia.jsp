<%@ include file="fragments/header.jspf"%>

<link rel="stylesheet" type="text/css"
	href="resources/combates/combates.css" />
<script src="resources/combates/combateBestia.js"></script>
<script src="resources/perfil/perfil.js"></script>
<script>

$(function() {
	mostrarVidas(${combate});
	$("#lucha").click(function(e) {
		e.preventDefault();	
		$("#lucha").css("visibility", "hidden");
		combatir(${combate}); 
	});
});

function combatir(d) {
	mostrarVidas(d);
	if (d.resumen)
		textoFlota(d.resumen);
	
	if (!d.gan) {
		//var id = $(this).attr("id").substring("b_".length);
		var t = window.setInterval(function() {
			var at = $("#seleccionado").attr("value");
			
			$.ajax({
				dataType : "json",
				url : "luchar",
				type : "POST",
				data:"at="+at,
				success : function(d) {
					if (d.gan) {
						window.clearInterval(t);
					}
					mostrarVidas(d);
					textoFlota(d.resumen);
					
				}
			})
		}, 1000);
	}
}
</script>

<div id="container">
	<div id="main">
		<div id="capaMadreCombate">

			<div class="cabecera">
				<div id="titulo">
					COMBATE
					<hr>
				</div>
			</div>
			<div id="capaHijaCombate"></div>
			<div id="cuerpo">

				<div class="heroe" id=jugador>
					<div class="marco">
						<br>
						<h2>
							<c:out value="${user.heroe.nombre}" />
						</h2>
						<hr>
						<div class="imgh">
							<img class="foto" id="iheroe" src="${user.heroe.imagen}"></img>
						</div>

							<div class="sangre" id="dsangreh">
								<img class="foto" id="isangreh" src="resources/combates/fotos/sangre2.png"></img>
							</div>
						<div class=vidah id="vidaheroemax"></div>
						<div class=vidah id="vidaheroe"></div>
						<div class="textoFlotante" id="textoBueno"></div>

					</div>

					<table class=dinfo id="infoh">
						<tr>
							<td id="nivelh"></td>
							<td id="vidah"></td>
						</tr>
						<tr>
							<td id="defensah"></td>
							<td id="fuerzah"></td>
						</tr>
						<tr>
							<td id="velocidadh"></td>
							<td id="precisionh"></td>
						</tr>
					</table>
					<div id=ataques>
						<button onClick= cambioAtaque(1) class=ataquer id=ataq1 ></button>
						<button onClick= cambioAtaque(2) class=ataquer id=ataq2 ></button>
						<button onClick= cambioAtaque(3) class=ataquer id=ataq3 ></button>
						<button class="pointlessButton" id="seleccionado" value= "1"></button>
					</div>

				</div>

				<div class="heroe" id=enemigo>
					<div class="marco" id=marcoenemigo>
						<br>
						<h2>
							<c:out value="${rival.nombre}" />
						</h2>
						<hr>

						<div class="imgm" id="dmalo">
							<img class="foto" id="imalo" src="bestia/photo?id=${rival.id}"></img>
						</div>
							<div class="sangre" id="dsangrem">
								<img class="foto" id="isangrem"
									src="resources/combates/fotos/sangre.png"></img>
							</div>
						<div class=vidam id="vidamalomax"></div>
						<div class=vidam id="vidamalo"></div>
						<div class="textoFlotante" id="textoMalo"></div>

					</div>


					<table class=dinfo id="infom">
						<tr><td id="nivelm"></td><td id="vidam"></td></tr>
						<tr><td id="defensam"></td><td id="fuerzam"></td></tr>
						<tr><td id="velocidadm"></td><td id="precisionm"></td></tr>
					</table>
				</div>
					
				<div class = "apanel" id = "recompensa">
					<p> Recompensas: </p>
					<p> Recibiste <c:out value = "${rival.oro}"></c:out> monedas de oro. </p>
					<p> Ganaste <c:out value = "${rival.exp}"></c:out> puntos de exp. </p>
					<div id = "filarecompensa">
						<img src = "objeto/photo?id=${rival.recompensa.id}" 
						onmouseout = "desaparecePerfil()"
						onmouseover = "aparecePerfil(event, '${rival.recompensa.id}', '${rival.recompensa.fuerza}', '${rival.recompensa.defensa}', '${rival.recompensa.velocidad}', '${rival.recompensa.precision}', '${rival.recompensa.nivel}', '${rival.recompensa.vida}', '${rival.recompensa.precio}', '${rival.recompensa.tipo.nombreTipo}', '${rival.recompensa.nombre}')"/>
					</div>
					<form id="volver" action="arcade" method="GET">
						<div id = "panelBoton">
							<button id="volverArcade">Volver atras</button>
						</div>
					</form>
					
				</div>
				
			</div>
			<form id="luchaMatic" action="luchar" method="POST">
				<button id="lucha">¡A LUCHAR!</button>
			</form>
			<br>
			
		</div>
			<div class = "descripcion" id = "panelInfo">
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
	</div>
</div>

</body>
</html>
