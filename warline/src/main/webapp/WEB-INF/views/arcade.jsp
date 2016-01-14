<%@ include file="fragments/header.jspf"%>

<link rel="stylesheet" type="text/css"
	href="resources/arcade/arcade.css" />


	<div id="container">
		<div id="main">
		 <div id="capaMadre">
		 
			<div class="cabecera">
				<div id ="titulo"> ARCADE <hr> </div>
			</div>
			
			<div class= apanel id="arcade">
				<h3>Escoge un rival:</h3>
				<table id="tablaRivales">
				<tbody>
					<c:forEach var="b" items="${bestias}">
						
							<td><h2> <c:out value="${b.nombre}" /></h2>
						
							<p><img class= bicho src="bestia/photo?id=${b.id}"/></td>
						
					</c:forEach>
				</tbody>
				</table>
				<a href="arena">
					<button id="luchar">A LUCHAR!</button>
				</a>
				<br> <br>
			</div>
		</div>
		</div>
	</div>

</body>
</html>

