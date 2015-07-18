<!DOCTYPE html>
<cfprocessingdirective pageencoding="utf-8" >
<cfinclude template="key.cfm" >
<html lang="en">

<head>
	<title>Document</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<link rel="stylesheet" href="css/css.css">
	<script src="js/jquery.js"></script>
	<script src="js/Underscore.js"></script>
	<script src="js/backbone.js"></script>
	<script src="js/login.js"></script>
</head>
<body>
<div class="login">
	<section class="title_login">
		Scroll RPC<br>Login
	</section>
	<section class="d_ingreso">

		<input type="text" id="user" placeholder="Usuario">
		<label></label>
		<input type="password" id="pass" placeholder="Contraseña">

		<label id="alerta"></label>
	</section>
	<section class="pie_login">
		<cfset passEnc = "pass">
		

		<cfset PassEnc = Encrypt(passEnc,myKey,'AES/CBC/PKCS5Padding','HEX') />
		<input type="hidden"id="pass1"value="<cfoutput>#PassEnc#</cfoutput>">
		<input type="hidden"id="pass2" value="<cfoutput>#CreateUUID()#</cfoutput>">
			
		<button id="enviar">Entrar</button>
	</section>
	
</div>
<body>
<script src="js/jquery.js" type="text/javascript"></script>
