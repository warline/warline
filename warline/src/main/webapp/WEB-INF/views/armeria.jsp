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
							<c:set var = "j" value = "0" scope = "session"/>
							<c:if test="${j%5 == 0}"> <tr> </c:if>
							<td> <img src = "resources/armeria/images/${i.nombre}.png" align="middle"/> </td>
							<c:set var = "j" value = "${j+1}"/>
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
