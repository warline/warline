<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf"%>

<script src="resources/arcade/arcade.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<script src="resources/ui/jquery-ui.js"></script>

<%--<title> Arcade - WarLine </title>--%>
<link rel="stylesheet" type="text/css"
	href="resources/arcade/arcade.css" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />

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
									<img class= bicho src="bestia/photo?id=${b.id}" onClick= elige("${b.nombre}")/>
								</td>
						
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<form action="arena" method="POST">
					<button name="nombre" type="submit" id="luchar" value= "${bestias.get(0).getNombre()}" >A LUCHAR!</button>
				</form>
			</div>
		</div>
		</div>
	</div>

</body>
</html>

