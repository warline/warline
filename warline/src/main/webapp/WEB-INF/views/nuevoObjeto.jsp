<%@ include file="fragments/headerGestion.jspf"%>
<!DOCTYPE html>
<html>
<head> <title> Nuevo_Objeto </title>
<link rel="stylesheet" type="text/css" 
		href="resources/fragments/plantilla.css"/>
<link rel = "stylesheet" type = "text/css" 
		href = "resources/gestion/nuevoObjeto.css">
</head> 
<body> 
<div id="container">
	<div id="main">
		<div id="capaMadre">
			<div class="cabecera">
				<div id ="titulo"> Nuevo objeto <hr> </div>
			</div>
			<div id = "divIzquierdo">
				<div id = "fotoObjeto">
				</div>
				<div id = "panelBotonSubirImagen">
					<button type="submit" id="subirImagen">
								Subir imagen </button>
				</div>
				
				<div id = "panelDisponibilidad">
					<p> 
						<input type="checkbox" id="disponible"> </input>
						Disponible en armeria
					</p>
				</div>
				
			</div> <!-- divIzquierdo -->

			<div id = "divDerecho">
			
				<p> Nombre: <input type = "text" id = "nombreObj"/> </p> 
				
				<p> Tipo de objeto: 
					<select name="tipoObj">
						<option value="1">Espada</option> 
						<option value="2">Casco</option> 
						<option value="3">Botas</option>
						<option value="4">Armadura</option> 
					</select>
				</p>
				
				<div id = "panelStatsObj"> 
				    <p> Estadisticas: </p>
					<div id = "tablaEstadObj">
						<table>
						<thead>
							<tr>  <td> Nivel </td><td> <input type = "text" id = "nivelObj" value = "10" /> </td> </tr>
							<tr>  <td> Vida </td><td> <input type = "text" id = "vidaObj" value = "0" /> </td>  </tr>
							<tr>  <td> Fuerza </td><td> <input type = "text" id = "fuerzaObj" value = "25" /> </td>  </tr>
							<tr>  <td> Habilidad </td><td> <input type = "text" id = "habObj" value = "5" /> </td> </tr>
							<tr>  <td> Defensa </td><td> <input type = "text" id = "defObj" value = "0" /> </td>  </tr>
							<tr>  <td> Velocidad </td><td> <input type = "text" id = "velObj" value = "-2" /> </td>  </tr>
						</table>
					</div>
				</div>
				
				<div id = "panelBotonNuevo">
				<a href = gestionObjetos>
					<button type="submit" id="guardarObj">
									Guardar objeto </button>
				</a>
				</div>



			</div> <!-- divDerecho -->
		</div>
	</div>
	
  </div> <!-- container -->
</body>
</html>
