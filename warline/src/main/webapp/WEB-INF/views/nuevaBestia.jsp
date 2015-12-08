<%@ include file="fragments/headerGestion.jspf"%>
<!DOCTYPE html>
<html>
<head> <title> Nueva Bestia </title>
<link rel="stylesheet" type="text/css" 
		href="resources/fragments/plantilla.css"/>
<link rel = "stylesheet" type = "text/css" 
		href = "resources/gestion/nuevaBestia.css">
</head> 
<body> 
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Nueva bestia <hr> </div>
			</div>
			<div id = "divIzquierdo">
				<div id = "fotoBestia">
				</div>
				<div id = "panelBotonSubirImagen">
					<button type="submit" id="subirImagen">
								Subir imagen </button>
				</div>
				
			</div> <!-- divIzquierdo -->

			<div id = "divDerecho">
				<form action="registrarBestia" method="POST">
					<p> Nombre: <input type = "text" name = "nombreBestia"/> </p> 
					
					<div id = "panelStatsMonst"> 
					    <p> Estadisticas: </p>
						<div id = "tablaEstadMonst">
							<table>
							<thead>
								<tr>  <td> Nivel </td><td> <input type = "text" name = "nivel" /> </td> </tr>
								<tr>  <td> Vida </td><td> <input type = "text" name = "vida" /> </td>  </tr>
								<tr>  <td> Fuerza </td><td> <input type = "text" name = "fuerza" /> </td>  </tr>
								<tr>  <td> Precision </td><td> <input type = "text" name = "precision"  /> </td> </tr>
								<tr>  <td> Defensa </td><td> <input type = "text" name = "defensa" /> </td>  </tr>
								<tr>  <td> Velocidad </td><td> <input type = "text" name = "velocidad"  /> </td>  </tr>
							</table>
						</div>
					</div>
					
					<div id = "panelRecompensas">
						<div id = "panelExpYOro">
							<table>
								<tr> <td> Experiencia: </td> <td> <input type = "text" name = "exp"/> </td> <td> puntos </td> </tr> 
								<tr> <td> Oro: </td> <td> <input type = "text" name = "oro"/> </td> <td> monedas </td> </tr>
							</table>
						</div>
						<div id = "panelObjetos">
							
						</div>
					</div>
					
					<div id = "panelBotonNuevo">
						<button type="submit">Guardar Bestia </button>
					</div>
				</form>
				


			</div> <!-- divDerecho -->
		</div>
	</div>
	
  </div> <!-- container -->
</body>
</html>
