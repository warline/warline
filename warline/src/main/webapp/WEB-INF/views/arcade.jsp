<%@ include file="fragments/header.jspf"%>

<link rel="stylesheet" type="text/css" href="resources/arcade/arcade.css" />
	<script src="resources/arcade/arcade.js"></script>


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
						<tr>
							<c:forEach var="b" items="${bestias}">
								<td>
									<h2> <c:out value="${b.nombre}" /></h2>
									<img class= bicho src="bestia/photo?id=${b.id}" onClick= "elige(${b.id})"/>
								</td>
						
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<br>
				<br>
				<br>
				<br>
				<form action="arena" method="POST">
					<button name="id" type="submit" id="luchar" value= "${bestias.get(0).id}" >A LUCHAR!</button>
				</form>
			</div>
		</div>
		</div>
	</div>

</body>
</html>

