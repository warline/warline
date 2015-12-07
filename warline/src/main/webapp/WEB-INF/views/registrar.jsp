<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<title>warline</title>
<link rel="stylesheet" href="resources/registrar/registrar.css" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="resources/fragments/plantilla.css" />
</head>
<body>
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
						<h3>Contraseña:
						<input id="password" name="password" type="password" /></h3>
					</div>
					<div id="field_repassword">
						<h3>Repita la contraseña:
						<input id="repassword" name="repassword" type="password" /></h3>
					</div>
					<br>
					<div id="reg_button">
						<p>
							<button type="submit" class="botonesPrincipales" id="login">
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

 