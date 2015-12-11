<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf"%>
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
			
			<div id="arcade">
				<h3>Escoge un rival:</h3>
				<table id="tablaRivales">
				<tr>
				<c:forEach var="b" items="${bestias}">
								
									<td><c:out value="${b.nombre}" />
									<p><c:out value="${b.nivel}" /></td>
								
				</c:forEach>
				</tr>
					<!-- <tr id="arribaRivales">
						<td class="casilla"><div id="ocultar"></div>
							<img id="imagenRival" src="resources/arcade/images/boqueron.jpg" /></td>
						<td class="casilla"><div id="ocultar"></div>
							<img id="imagenRival" src="resources/arcade/images/rata.jpg" /></td>
						<td class="casilla"><div id="ocultar"></div>							
							<img id="imagenRival" src="resources/arcade/images/tejon.jpg" /></td>
						<td class="casilla"><div id="ocultar"></div>							
							<img id="imagenRival" src="resources/arcade/images/komodo.jpg" /></td>
						<td class="casilla"><div id="ocultar"></div>							
							<img id="imagenRival" src="resources/arcade/images/lobo.jpg" /></td>
						<td class="casilla">						
							<img id="imagenRival" src="resources/arcade/images/pantera.jpg" /></td>
					</tr>
					<tr class="nombres">
						<td class="casillaNombre"><h2>BOQUERÓN</h2></td>
						<td class="casillaNombre"><h2>RATAS</h2></td>
						<td class="casillaNombre"><h2>TEJÓN</h2></td>
						<td class="casillaNombre"><h2>KOMODO</h2></td>
						<td class="casillaNombre"><h2>LOBO</h2></td>
						<td class="casillaNombre"><h2>PANTERA</h2></td>
					</tr>
					<tr id="arribaRivales">
						<td class="casilla">				
								<img id="imagenRival" src="resources/arcade/images/oso.png" /></td>
						<td class="casilla">							
								<img id="imagenRival" src="resources/arcade/images/tigre.jpg" /></td>
						<td class="casilla">						
								<img id="imagenRival" src="resources/arcade/images/rhino2.gif" /></td>
						<td class="casilla">							
								<img id="imagenRival" src="resources/arcade/images/elefante.jpg" /></td>
						<td class="casilla">							
								<img id="imagenRival" src="resources/arcade/images/dragon.jpg" /></td>
						<td class="casilla">						
								<img id="imagenRival" src="resources/arcade/images/hydra.png" /></td>
					</tr>
					<tr class="nombres">
						<td class="casillaNombre"><h2>GRIZZLY</h2></td>
						<td class="casillaNombre"><h2>TIGRE</h2></td>
						<td class="casillaNombre"><h2>RHINO</h2></td>
						<td class="casillaNombre"><h2>ELEFANTE</h2></td>
						<td class="casillaNombre"><h2>DRAGÓN</h2></td>
						<td class="casillaNombre"><h2>HYDRA</h2></td>
					</tr>-->
				</table>
				<a href="arena">
					<button id="luchar">¡A LUCHAR!</button>
				</a>
				<br> <br>
			</div>
		</div>
		</div>
	</div>

</body>
</html>

