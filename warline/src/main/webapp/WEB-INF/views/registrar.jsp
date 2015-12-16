<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<script src="resources/registrar/registrar.js"></script>
<script src= "resources/ui/external/jquery/jquery.js"></script>
<link rel="stylesheet" href="resources/registrar/registrar.css" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />

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
					<div id="field_username">
						<h3>Correo:
						<input id="correo" name="correo" type="text" /></h3>
					</div>
					<div id="field_nombre">
						<h3>Nombre:
						<input id="nombre" name="nombre" type="text" /></h3>
					</div>
					<div id="field_password">
						<h3>Contrase�a:
						<input id="password" name="password" type="password" /></h3>
					</div>
					<div id="field_repassword">
						<h3>Repita la contrase�a:
						<input id="repassword" name="repassword" type="password" /></h3>
					</div>
					<input id="imagen" name ="imagen" type="hidden" />
					<div class="imgheroe" id="imgizd" onClick="rotarizd()"><img class= "foto" id="fizd" ></img> </div>
					<div class="imgheroe" id="imgcen"> <img class= "foto" id="fcen" ></img></div>
					<div class="imgheroe" id="imgder"onClick="rotarder()"><img class= "foto" id="fder" ></img> </div>
					<br>
					<div id="reg_button">
						<p>
							<button type="submit" class="botonesPrincipales" id="registrar">
								Registrarse</button>
						</p>
					</div>
					<c:if test="${not empty registrerError}">
						<c:out value="${registrerError}"/>
					</c:if>
				</form>
				
				</div>
			</div>
			</div>
		</div>
		<div id="clearthis_contentbody"></div>
</body>
</html>

 