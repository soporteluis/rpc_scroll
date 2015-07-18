var mod = Backbone.Model.extend();
var Menu = Backbone.Collection.extend({
	model:mod,
	url:'query.cfc?method=menu',
	initialize:function(){	
		//console.log("COLECCION CREADA");
		this.fetch({
			success:function(d){
				//console.log(d.length);
				//console.log(d);
				d.each(function(model){
					//console.log(model.get('ETIQUETA'));
					$(".categorias").append("<button data-variable='"+model.get('VARIABLE')+"'>"+model.get('ETIQUETA')+"</button>");
					var variable = model.get('VARIABLE');
					if(variable=="nacional"){
							$(".mostrar").append("<div id='"+variable+"' class='datos'>");
							var clase=$("#"+variable);
							$(clase).append("<h1>"+model.get('ETIQUETA')+"</h1><hr>");
							for (b=1;b<=10;b++){
								$(clase).append("<input type='text' id='"+variable+b+"' data-categoria='"+model.get('ETIQUETA')+"'>");
							}
						}else{
							$(".mostrar").append("<div id='"+variable+"' class='datos ocultar'>");
							var clase=$("#"+variable);
							$(clase).append("<h1>"+model.get('ETIQUETA')+"</h1><hr>");
							for (b=1;b<=10;b++){
								$(clase).append("<input type='text' id='"+variable+b+"' data-categoria='"+model.get('ETIQUETA')+"'>");
							}
						}
					
				})
				$(".mostrar").append("<div id='mensaje' class='ocultar'></div><button id='guardar'><img src='img/save.png'></button>");
			}
		});
		
	},
	

})
var menuList = new Menu ();  

$(document).ready(function(){
	$(".categorias").on("click","button",function(){
		var accion = $(this).attr("data-variable");
		//alert(accion);
		var objeto = "#"+accion;
		$(".mostrar").hide('slow');
		$(".mostrar div").attr("class","datos ocultar");
		$(objeto).attr("class","datos");
		$(".mostrar").fadeIn("slow");
	})
	/*$("#entrar").click(function(){
		var pass = $("#pass").val();
		alert(pass);
	})*/
/*Crear y Agregar modelo y coleccion para el Insert */
var ModelInsert = Backbone.Model.extend();
var ColInsert = Backbone.Collection.extend({model:ModelInsert});
var Insert = new ColInsert();

/*Fin del Insert*/
	$(".mostrar").on("click","#guardar",function(){
		Insert.reset();
		//var usuario = $("#n_usuario").val();
		$(".mostrar").find("input").each(function(){
			var valor = $(this).val();
			if(valor < 1){
				
			}else{

				var datosInsert = new ModelInsert({categoria:$(this).attr('data-categoria'),valor:$(this).val()});
				Insert.add(datosInsert);
				
			}
		});
		var valores = JSON.stringify(Insert.toJSON());
		var dataLog = Insert;
		if(Insert.toJSON() !=""){
			console.log("datos llenos")
			$.ajax({
			dataType:"json",
			url:"/rpc_scroll/insert.cfc?method=datos",
			data:{data:valores},
			success:function(result){
					if(result == true){
						$("#mensaje").attr("class","true").fadeIn('slow',function(){
							$(this).delay(1500);
							$(this).fadeOut('slow');
						});
						$("#mensaje").empty();
						$("#mensaje").text("DATOS INSERTADOS CON EXITO");
						$("input").val("");
						
						
					}else{
						$("#mensaje").attr("class","false").fadeIn('slow',function(){
							$(this).delay(1500);
							$(this).fadeOut('slow');
						});
						$("#mensaje").empty();
						$("#mensaje").text("ERROR AL INSERTAR LOS DATOS");
					}
				}
			})
			var datosLog = '[{'+'"usuario":"'+$("#n_usuario").attr("data-valor")+'","accion":"Insertar","fecha":"'+$("#fecha").attr("data-valor")+'"}]';
			//var datosLog = '[{'+'"usuario":"'+$("#n_usuario").attr("data-valor")+'","accion":"Insertar"}]';
			console.log(datosLog);
			$.ajax({
				dataType:"json",
				url:"/rpc_scroll/insert.cfc?method=bitacora",
				data:{datoslog:datosLog},
				success:function(result){
					console.log('LOG')
						/*if(result == true){
							$("#mensaje").attr("class","true").fadeIn('slow',function(){
								$(this).delay(1500);
								$(this).fadeOut('slow');
							});
							$("#mensaje").empty();
							$("#mensaje").text("DATOS INSERTADOS CON EXITO");
							$("input").val("");
						}else{
							$("#mensaje").attr("class","false").fadeIn('slow',function(){
								$(this).delay(1500);
								$(this).fadeOut('slow');
							});
							$("#mensaje").empty();
							$("#mensaje").text("ERROR AL INSERTAR LOS DATOS");
						}*/
					}
				})	
		}else{
			$("#mensaje").attr("class","alert").fadeIn('slow',function(){
							$(this).delay(1500);
							$(this).fadeOut('slow');
						});
			$("#mensaje").empty();
			$("#mensaje").text("DEBE LLENAR ALGUN CAMPO");
		}
		
	})
})

var mt = Backbone.Model.extend();
var mo = Backbone.Collection.extend({
	initialize:function(){
		console.log('mo creado');
	}
})
