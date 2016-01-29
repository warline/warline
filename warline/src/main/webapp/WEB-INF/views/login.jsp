<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<title>warline</title>
<link rel="stylesheet" href="resources/login/login.css" type="text/css"
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
		<div id="combate">
			<img id="foto1" src="resources/login/images/enano.png"></img> 
			<img id="foto2" src="resources/login/images/dragon.png"></img>
		</div>
		<div id="page_forms">
			<div id="userlogin">
				<div id="page_menu">
					Conectate
					<hr>
				</div>
				<form action="login" method="POST">
					<div id="field_username">
						<h3>
							Correo: <input id="correo" name="login" type="text" />
						</h3>
					</div>
					<div id="field_password">
						<h3>
							Contraseña: <input id="password" name="password" type="password" />
						</h3>
					</div>
					<br> <br>
					<div id="log_button">
						<p>
							<button type="submit" class="botonesPrincipales" id="login">
								Log in</button>
						</p>
					</div>
				</form>
				<c:if test="${not empty loginError}">
					<p id="excepciones"><c:out value="${loginError}"/></p>
				</c:if>
				<div id="userlogin_links">
					<h2>
						<a id="registrar" href="registrar">Registrate ahora</a>
					</h2>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
