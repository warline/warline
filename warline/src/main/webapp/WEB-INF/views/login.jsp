<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<title>warline</title>
<link rel="stylesheet" href="resources/login/style.css" type="text/css"
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
		<div id="page_menu">
			DESCRIPCIÓN
			<hr>
		</div>
		<div id="page_forms">
			<div id="userlogin">
				<div id="userlogin_header">
					<h1>Conectate</h1>
					<hr>
				</div>
				<c:if test="${empty param.user or empty param.password}">
					<c:out value="Debe rellenar los campos" />
				</c:if>
				<c:if test="${not empty param.user and not empty param.password}">
					<c:if test="${param.user == 'admin' and param.pass == 'god'}">
						<jsp:forward page="arena.jsp" />
					</c:if>
				</c:if>
				<form action="login" method="POST">
					<div id="field_username">
						<h3>correo:</h3>
						<br> <input id="correo" name="user" type="text" />
					</div>
					<div id="field_password">
						<h3>contraseña:</h3>
						<br> <input id="password" name="password" type="password" />
					</div>
					
					<div id="log_button">
						<p>
							<button type="submit" class="botonesPrincipales" id="login">
								login</button>
						</p>
					</div>
				</form>
				<div id="userlogin_links">
					<h3>correo:</h3>
					<br>
					<div id="field_username">
						<strong><span>correo:</span></strong> <input id="correoR"
							type="text" />
					</div>
					<h3>nombre:</h3>
					<br>
					<div id="field_username">
						<strong><span>nombre:</span></strong> <input id="nombre"
							type="text" />
					</div>
					<h3>contraseña:</h3>
					<br>
					<div id="field_password">
						<strong><span>contraseÃ±a:</span></strong> <input
							type="password" id="passwordR"/>
					</div>
					<div id="log_button">
						<p>
							<a href="#">
								<button class="botonesPrincipales" id="login">
									Registrarse</button>
							</a>
						</p>
					</div>
					<br>
					<h2>
						<a id="acercade" href="perfil">Acerca de</a>
					</h2>
				</div>
			</div>
		</div>
		<div id="clearthis_contentbody"></div>
	</div>
</body>
</html>
