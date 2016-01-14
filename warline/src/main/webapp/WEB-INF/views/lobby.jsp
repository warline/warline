<%@ include file="fragments/header.jspf" %>
	<link rel="stylesheet" type="text/css" href="resources/combates/lobby.css"/>
	<div id="container">
		<div id="main">
		 <div id="capaMadre">
			<div class="cabecera"> 
				<div id ="titulo"> ARENA <hr> </div>
			</div>
			
			<div id="arcade">
				<div id="arriba">
					<div id="combateRandom">
						<br>
						Combate aleatorio:
						<p><a href="arena"><button id="aleatorio">¡Lucha ahora!</button></a>
					</div>
					
					<div id="combateAmigo">
						<br>
						Reta a algún amigo:
						<p><input type=text id="usuario"></input>
						<p><a href="arena"><button id="amigo">¡Lucha!</button></a>
					</div>
				</div>
				<br>
				<div id="abajo">
					
					<table id="topDiez">
						<tbody>
							<caption id="toptitle"><h2>Mejores luchadores</h2></caption>
							<c:forEach var="t" items="${heroes}" >
						
							<td><h2> <c:out value="${t.nombre}" /></h2>
								<p> <c:out value="${t.nivel}" />
							<!-- <p><img class= bicho src="resources/arcade/images/${b.nombre}.jpg"/>--></td>
						
							</c:forEach>
						</tbody>	
					
					</table>
					<!-- <tr><th scope="row" id ="esquina">  </th><td id ="puesto">#1</td><td id ="puesto">#2</td><td id ="puesto">#3</td><td id ="puesto">#4</td><td id ="puesto">#5</td><td id ="puesto">#6</td><td id ="puesto">#7</td><td id ="puesto">#8</td><td id ="puesto">#9</td><td id ="puesto">#10</td></tr>
					<tr><th scope="row" id="top">Usuario</th><td id="nombre">Dabicho</td><td id="nombre">Francisco</td><td id="nombre">Fernando</td><td id="nombre">Jose Luis</td><td id="nombre">Chema</td><td id="nombre">Henry</td><td id="nombre">Javo</td><td id="nombre">LoPezones</td><td id="nombre">Otro</td><td id="nombre">Otro</td></tr>
					<tr><th scope="row" id="top">Nivel</th><td id="nivel">12</td><td id="nivel">12</td><td id="nivel">11</td><td id="nivel">11</td><td id="nivel">8</td><td id="nivel">8</td><td id="nivel">7</td><td id="nivel">6</td><td id="nivel">5</td><td id="nivel">4</td></tr>
					-->
					<div id="perfil2">
						Perfil
					</div>
					
				</div>
				<br><br>
			</div>
			</div>
	
	</div>



	<div id="footer">
		
	</div>

</div>

</body>
</html>

