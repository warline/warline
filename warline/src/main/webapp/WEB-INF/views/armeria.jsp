<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="fragments/header.jspf" %>

<script src= "./ui/external/jquery/jquery.js"></script>
<script src="./ ui/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="./ui/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="resources/fragments/plantilla.css"/>
<link rel="stylesheet" type="text/css" href="resources/armeria/armeria.css"/>

<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> ARMERIA <hr> </div>
			</div>

			<div id="acuerpo">
				<div class = "apanel" id = "ainventario">
					<table>
						<caption> INVENTARIO </caption>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>
						<tr> <td></td><td></td><td></td><td></td><td></td> </tr>		
					</table>
					<p id = "adinero"> Monedas: <c:out value="${user.getHeroe().oro}" /></p></div>
				<div class = "apanel" id = "avendedor">
					<table>
						<caption> ARMERIA </caption>
						<c:forEach var="i" items="${items}">
								<tr>
									<!-- <td><img class="bicho" src = "${b.imagen}"/></td> -->
									<td><c:out value="${i.nombre}" /></td>
									<td><c:out value="${i.precio} monedas" /></td>
									<td><c:out value="${i.tipo}" /></td>
								</tr>
							</c:forEach>	
					</table>
				</div>
				<div class = "apanel" id = "aobjeto">
					<div class = "panelObjeto" id = "panelObjetoDcha">
						<p> Fuerza: 10 </p>
						<p> Velocidad: 5 </p>
						<p> Defensa: 0 </p>
						<p> Vida: 0 </p>
					</div>
					<div class = "panelObjeto" id = "panelObjetoIzda"></div>
					
				</div>
			
			</div>
		</div>
	</div>


	<div id="footer">
		
	</div>

</div>

</body>
</html>
