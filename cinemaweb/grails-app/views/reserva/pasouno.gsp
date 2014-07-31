<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Reservas - Paso uno</title>
	<style>
	p#funcion-precio{
		margin-bottom: 0px;
		margin-top: 7px;
	}

	div#precio-total-container{
		margin-bottom: 20px;
	}

	div#precio-total-container hr{
		border-top-color: #666363;
	}

	span#precio-total{
		margin-left: 5px;
	}
	</style>
	<script type="text/javascript">
	var decodedData = $('<div/>').html("${funcionesData}").text();
	var funcionesData = $.parseJSON(decodedData);
	console.log(funcionesData)
	$(document).ready(function(){

		$("select#fecha_select").change(function(event) {
			loadCines($(this).val(),funcionesData)
		});

		$("select#cine_select").change(function(){
			changeFuncionesSelector($(this).attr("data-fecha"), $(this).val(),funcionesData);
		});

		$("select#funcion_select").change(function(){
			changePrice($(this).find(':selected').attr('data-precio'));
		});

		$("select#num_asientos").change(function(){
			changeTotalPrice($("select#funcion_select").find(':selected').attr('data-precio'));
		});

		initializeDates(funcionesData);
	});

	function initializeDates(dataFunciones){
		$.each(dataFunciones, function(index, funcionesPorFecha) {
			 $("<option/>").val(funcionesPorFecha.fecha).html(funcionesPorFecha.fecha).appendTo('#fecha_select');
		});
	}

	function loadCines(fecha,dataFunciones){
		//limpio los selectores
		clearFuncionesData();
		if(fecha == -1){
			//pongo en disabled el boton
			toggleNextButton("disabled");
		}else{
			$.each(dataFunciones, function(index, funcionesList) {
				 if(funcionesList.fecha == fecha){
				 	//cargo el select con los cines
				 	$("select#cine_select").attr('data-fecha', fecha);
				 	var first = true;
				 	$.each(funcionesList.funciones, function(cine, funcionesCine) {
				 		 $("<option/>").val(cine).html(funcionesCine[0].nombre).appendTo('select#cine_select');
				 		 if(first){
				 		 	console.log(funcionesCine);
				 		 	console.log("funciones del primero");
				 		 	//cargo las funciones del primero
				 		 	loadFunciones(funcionesCine);
				 		 	first = false;
				 		 }
				 	});
				 }
			});
		}
	}

	function clearFuncionesData(){
		$.each(["cine_select","funcion_select"], function(index, val) {
			 $("select#" + val).empty();
		});
		//limpio los precios tambien
		$("p#funcion-precio").html("-");
		$("span#precio-total").html("-");
	}

	function toggleNextButton(action){
		if(action == "active"){
			$("button#next-step").removeClass('disabled');
		}else{
			$("button#next-step").addClass('disabled');
		}
	}

	
	function changeFuncionesSelector(fecha, id, funcionesData){
		$.each(funcionesData, function(index, val) {
			 if(val.fecha == fecha){
			 	loadFunciones(val.funciones[id]);
			 }
		});
	}


	function loadFunciones(funcionesData){
		//limpio el select de funciones
		$("select#funcion_select").empty();
		var primeraFuncion = true
		$.each(funcionesData,function(index,funcion){
			console.log(funcion);
				$("<option/>").val(funcion.funcionID).html(funcion.horario).attr("data-precio",funcion.precio).appendTo("select#funcion_select");
				if(primeraFuncion){
					//cargo el precio de la primera funcion
					changePrice(funcion.precio);
					primeraFuncion = false;	
				}
		});
				
		//muestro boton
		toggleNextButton("active");
	}

	function changePrice(precio){
		$("p#funcion-precio").html("$ " + precio);
		//cambio el precio total
		changeTotalPrice(precio);
		
	}

	function changeTotalPrice(precio){
		console.log($("select#num_asientos").val());
		console.log(precio);
		var totalPrice = parseInt($("select#num_asientos").val()) * precio;
		console.log(totalPrice);
		$("span#precio-total").html("$ " + totalPrice);
	}

	</script>
</head>
<body>
	<div class="container">
			<div class="row">
			<div class="col-md-12">
				<h3>1 - Selecciona la función<h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h4><b>Pelicula:</b> ${pelicula.titulo}</h4>  
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<g:img dir="/images/cinema-web/peliculas-pics" file="${(pelicula.foto) ? pelicula.foto : 'default.png'}" class="img-rounded show-img" />
			</div>
			<div class="col-md-8">
				<g:form class="form-horizontal">
				<div class="form-group">
					<label for="fecha" class="col-md-2 col-sm-2 control-label">Fecha:</label>
							<div class="col-md-4">
								<select class="form-control" id="fecha_select">
									<option value="-1"> - </option>
								</select>
							</div>
				</div>
				<div class="form-group">
					<label for="cine" class="col-md-2 col-sm-2 control-label">Cine:</label>
							<div class="col-md-4">
								<select class="form-control" id="cine_select"></select>
							</div>
				</div>
				<div class="form-group">
					<label for="funcion" class="col-md-2 col-sm-2 control-label">Horario:</label>
							<div class="col-md-2">
								<select name="funcion" id="funcion_select"  class="form-control"></select>
							</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-md-2 col-sm-2 control-label">Precio:</label>
							<div class="col-md-4">
							 <p id="funcion-precio">-</p>
							</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-md-2 col-sm-2 control-label">Asientos:</label>
							<div class="col-md-2">
								<g:select from="${1..5}" name="num_asientos" id="num_asientos" class="form-control"/>
							</div>
				</div>
				<div class="form group">
					<div class="col-md-7 col-md-offset-2" id="precio-total-container">
						<hr>
						<b>Total:</b> <span id="precio-total">-</span>
					</div>
				</div>
				<div class="form-group">
						<div class="col-md-3 col-md-offset-2">
								<button class="btn btn-block btn-disabled btn-warning disabled" id="next-step">Siguiente</button>
						</div>
				</div>
				</g:form>
			</div>
		</div>
</div>
</body>
</html>