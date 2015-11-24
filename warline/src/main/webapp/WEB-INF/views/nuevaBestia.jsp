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
				<div id = "fotoObjeto">
				</div>
				<div id = "panelBotonSubirImagen">
					<button type="submit" id="subirImagen">
								Subir imagen </button>
				</div>
				
			</div> <!-- divIzquierdo -->

			<div id = "divDerecho">
			
				<p> Nombre: <input type = "text" id = "nombreObj"/> </p> 
				
				<div id = "panelStatsMonst"> 
				    <p> Estadisticas: </p>
					<div id = "tablaEstadMonst">
						<table>
						<thead>
							<tr>  <td> Nivel </td><td> <input type = "text" id = "nivelMonst" value = "100" /> </td> </tr>
							<tr>  <td> Vida </td><td> <input type = "text" id = "vidaMonst" value = "200" /> </td>  </tr>
							<tr>  <td> Fuerza </td><td> <input type = "text" id = "fuerzaMonst" value = "100" /> </td>  </tr>
							<tr>  <td> Habilidad </td><td> <input type = "text" id = "habMonst" value = "10" /> </td> </tr>
							<tr>  <td> Defensa </td><td> <input type = "text" id = "defMonst" value = "100" /> </td>  </tr>
							<tr>  <td> Velocidad </td><td> <input type = "text" id = "velMonst" value = "50" /> </td>  </tr>
						</table>
					</div>
				</div>
				
				<div id = "panelRecompensas">
					<div id = "panelExpYOro">
						<table>
							<tr> <td> Experiencia: </td> <td> <input type = "text" id = "expMonst"/> </td> <td> xp </td> </tr> 
							<tr> <td> Oro: </td> <td> <input type = "text" id = "oroMonst"/> </td> <td> gold </td> </tr>
						</table>
					</div>
					<div id = "panelObj">
						
					</div>
				</div>
				
				<div id = "panelBotonNuevo">
				<button type="submit" id="guardarMonst">
								Guardar Bestia </button>
				</div>
				
				


			</div> <!-- divDerecho -->
		</div>
	</div>
	
  </div> <!-- container -->
</body>
</html>
