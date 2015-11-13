$(document).on('ready',documentolisto);

function documentolisto(){
	/*
	$("tr:odd").css("background-color", "#ddd"); // filas impares
    $("tr:even").css("background-color", "#ccc"); // filas pares
	$("th").css("background-color", "#000");
	*/
	$(".detalle").click(function(){
		var dni=$(this).parent().parent().children().first().text();
		$("#contenidoDetalle").text("AQUI SE MOSTRARA TODO EL DETALLE DEL DNI:"+dni);
	});
	$(".editar").click(function(){
		var dni=$(this).parent().parent().children().first().text();
		$("#contenidoEditar").text("AQUI SE MOSTRARA TODO EL DETALLE DEL DNI:"+dni);
	});
	$(".eliminar").click(function(){
		var columna=$(this).parent().parent();
		var dni=columna.children().first().text();
		columna.hide(500);
		console.log("el dni eliminado es: "+dni);
		
	});
	
}