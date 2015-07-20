$(document).ready(function(){
	$("#enviar").click(function(){
		var u = $("#user").val();
		var p = $("#pass").val();
		if(u===""){
			var mensaje="Debe agregar un nombre de Usuario";
			alerta(mensaje,u);
		}else if(p===""){
			var mensaje="Debe agregar una contraseña";
			alerta(mensaje);
		}else{
			$.ajax({
				url:"rpc_scroll/query.cfc?method=login&user="+u+"&pass="+p,
				//http://localhost:8500/rpc_scroll/query.cfc?method=login&user=lgonzalez&pass=Ebenezer07*
				beforeSend:function(){
					//alert(u+" "+p)
				},
				success:function(da){
					if(da == "true"){
						//console.log("logueo correcto con el usuario: "+da[0].NAME);
						window.location.href = "http://localhost:8500/rpc_scroll/menu.cfm";
					}else{
						var mensaje = "Error al procesar los datos del usuario " + u;
						alerta(mensaje)
					}
						
				}
			})
		}
		
	})
	function alerta(mensaje,u){
		$("#alerta").fadeIn('slow',function(){
			$(this).delay(2500);
			$("#alerta").text(mensaje);
			$(this).fadeOut('slow');
		});
	}
})
						