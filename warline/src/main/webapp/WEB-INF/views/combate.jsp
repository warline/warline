<%@ include file="fragments/header.jspf" %>

<link rel="stylesheet" type="text/css" href="resources/combates/combates.css"/>
<script src="resources/combates/combateHeroe.js"></script>

<script>
/* 	$(function() {
		mostrarVidas('${combate}');
		if ('${resumen}')
			textoFlota('${resumen}');
		var comb= JSON.parse('${combate}');
		if(!comb.gan){
			window.setTimeout(function() {
				$("#luchaMatic").submit();
			}, 600);
		}
	});
	 */
	 $(function() {
			mostrarVidas(${combate});
			$("#lucha").click(function(e) {
				e.preventDefault();	
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
						url : "luchaHeroe",
						type : "POST",
						data:"at="+at,
						success : function(d) {
							console.log(d);
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
				<div id ="titulo">
					COMBATE
				<hr>
				</div>
			</div>
			<div id="capaHijaCombate"></div>
			<div id="cuerpo">
			
				<div class = "heroe" id=jugador>
					<div class="marco">
						<br>
						<h2><c:out value="${user.heroe.nombre}"/></h2>
						<hr>
						<div class="imgh"><img class= "foto" id="iheroe" src= "${user.heroe.imagen}"></img></div>
						
							<div class="sangre" id="dsangreh">
								<img class= "foto" id="isangreh" src ="resources/combates/fotos/sangre2.png"></img>
							</div>
						<div class=vidah id="vidaheroemax"></div>
						<div class=vidah id="vidaheroe" ></div>
						<div class="textoFlotante" id="textoBueno"></div>		
					
					</div>
					
					<table  class= dinfo id="infoh">
						<tr> <td id ="nivelh"></td> <td id ="vidah"></td></tr>
						<tr> <td id ="defensah"></td> <td id ="fuerzah"></td></tr>
						<tr> <td id ="velocidadh"></td> <td id ="precisionh"></td></tr>
					</table>
					<div id=ataques>
							<button onClick= cambioAtaque(1) class=ataquer id=ataq1></button>
							<button onClick= cambioAtaque(2) class=ataquer id=ataq2></button>
							<button onClick= cambioAtaque(3) class=ataquer id=ataq3></button>
							<button class="pointlessButton" id="seleccionado" value= "1"></button>
					</div>
				</div>
			
				<div class = "heroe" id=enemigoUsuario>
					<div class="marco" id=marcoenemigo>
						<br>
						<h2><c:out value="${rival.nombre}" /></h2>
						<hr>
						
						<div class="imgm" id="dmalo" >
							<img class= "foto" id="imalo" src="${rival.imagen}"></img>
						</div>
						<c:if test= "${ganador=='heroe'}">
							<div class="sangre" id="dsangrem">
								<img class= "foto" id="isangrem" src ="resources/combates/fotos/sangre2.png"></img>
							</div>
						</c:if>
						<div class=vidam id="vidamalomax" ></div>					
						<div class=vidam id="vidamalo"></div>						
						<div class="textoFlotante" id="textoMalo"></div>
						
						
						</div>	
					
				
					<table  class= dinfo id="infom">
					<tr> <td id ="nivelm"></td> <td id ="vidam"></td></tr>
						<tr> <td id ="defensam"></td> <td id ="fuerzam"></td></tr>
						<tr> <td id ="velocidadm"></td> <td id ="precisionm"></td></tr>
					
					</table>
					
				</div>
				
			</div>
			<form id="luchaMatic" action="luchaHeroe" method="POST">
				<button id="lucha">¡A LUCHAR!</button>				
			</form>
			<br/>
			
		</div>
	</div>
	<div id="footer">
		
	</div>

</div>

</body>
</html>
