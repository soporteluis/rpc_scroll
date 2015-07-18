<cfinclude template="session.cfm" >
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Scroll RPC</title>
	<link rel="icon" type="image/png" href="img/favicon.png" />
	<link rel="stylesheet" href="css/css.css">
	  
	<script src="js/jquery.js"></script>
	<script src="js/Underscore.js"></script>
	<script src="js/backbone.js"></script>
	<script src="js/acciones.js"></script>
</head>
<body>
	<div class="contenedor">
		<div class="header">
			<header>
				<section class="logo">
					<img src="img/header_logo.png" alt="">
				</section>
				<section class="scroll">SCROLL</section>
			</header>
			<div class="datosusuarios">
				<div class="data"><cfoutput><b>Nombre: </b>#session.Nombre#<br><b>Dep.: </b>#session.descripcion#<br><b>Email: </b>#session.mail#</cfoutput></div>	
				<div class="cerrar"><a href="cerrar.cfm"><img src="img/cerrar.png" title="Cerrar Sesion"></a>
					<input type="hidden" id="n_usuario" data-valor="<cfoutput>#session.Nombre#</cfoutput>">
					<input type="hidden" id="fecha" data-valor="<cfoutput>Fecha: #Day(Now())#/#Month(Now())#/#Year(Now())#, Hora: HR:#Hour(Now())# - Min:#Minute(Now())#</cfoutput>">
				</div>
			</div>
		</div>
		<div class="line"></div>
		
		<div class="contenido">
			<section class="categorias">
				
			</section>
			<section class="mostrar">
			</section>
		</div>
		
		
	</div>
	</div>
	
</body>

</html>