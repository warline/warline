<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="resources/registrar/registrar.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<link rel="stylesheet" href="resources/registrar/registrar.css" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />

<script>
$(function() {
	pintarIni();
});
</script>

	<div id="header">
		<div id="userbar">
			<img id="cabe" src="resources/fragments/fotos/BannerVersion3.png" />
		</div>
	</div>
		
	<div id="container">
		<div id="page_forms">
				<div id="userlogin">
					<div id="page_menu">
					Registrarse
					<hr>
				</div>
				
				<div id="userlogin_links">
				
				<form action="registro" method="POST">
					<div id = "panelForm">
						<div id="field_username">
							<h3>Correo:
							<input id="correo" name="correo" type="text" value="javo"/></h3>
						</div>
						<div id="field_nombre">
							<h3>Nombre:
							<input id="nombre" name="nombre" type="text" value= "Aquiles"/></h3>
						</div>
						<div id="field_password">
							<h3>Contraseña:
							<input id="password" name="password" type="password" value= "heroe"/></h3>
						</div>
						<div id="field_repassword">
							<h3>Repita la contraseña:
							<input id="repassword" name="repassword" type="password" value= "heroe"/></h3>
						</div>
					</div>
					<input id="imagen" name ="imagen" type="hidden" />
					<div id = "imagenesHeroe">
						<div class="imgizq" onClick="rotarizd()">
							<img class= "foto" id="fizd" ></img> 
						</div>
						<div class="imgcent"> 
							<img class= "foto" id="fcen" ></img>
						</div>
						<div class="imgder" onClick="rotarder()">
							<img class= "foto" id="fder" ></img> 
						</div>
					</div>
					<c:if test="${not empty registrerError}">
						<p id="excepciones"><c:out value="${registrerError}"/></p>
					</c:if>
					<div id="reg_button">
						<p>
							<button type="submit" class="botonesPrincipales" id="registrar">
								Registrarse</button>
						</p>
						
					</div>
				</form>
				<p>
					<a href = "login">
						<button class="botonesPrincipales" id="registrar" >
							Volver
						</button>
					</a>
				</p>
				</div>
			</div>
			</div>
		</div>
</body>
</html>

 