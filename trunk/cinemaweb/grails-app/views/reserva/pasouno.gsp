<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Reservas - Paso uno</title>
	<style>
	p#funcion-precio{
		margin-bottom: 0px;
		margin-top: 7px;
	}
	</style>
	<script type="text/javascript">
	var decodedData = $('<div/>').html("${funcionesData}").text();
	var funcionesData = $.parseJSON(decodedData);
	console.log(funcionesData)
	$(document).ready(function(){

		$("select#cine_select").change(function(){
			loadFunciones($(this).val(), funcionesData);
		});

		$("select#funcion_select").change(function(){
			changePrice($(this).attr("data-price"));
		});

		loadCinesSelector(funcionesData);
	});

	function loadCinesSelector(funcionesData){
		$.each(funcionesData,function(index,cineData){
			//tomo el primero de cada grupo
			$("<option/>").val(cineData.cineID).html(cineData.nombre).appendTo("#cine_select");
		});
		loadFunciones(funcionesData[0].cineID,funcionesData);
	}

	function loadFunciones(cineID,funcionesData){
		//limpio el select de funciones
		$("select#funcion_select").empty(); 
		$.each(funcionesData,function(index,cineData){
			if(cineData.cineID == cineID){
				$.each(cineData.funciones,function(index,funcion){
				$("<option/>").val(funcion.funcionID).html(funcion.horario).attr("data-precio",funcion.precio).appendTo("select#funcion_select");
				});
				//cargo el precio de la primera funcion
				changePrice(cineData.funciones[0].precio);
			}
		});
	}

	function changePrice(precio){
		$("p#funcion-precio").html("$ " + precio);
	}

	</script>
</head>
<body>
	<div class="container">
			<div class="row">
			<div class="col-md-12">
				<h3>1 - Selecciona el cine<h3>
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
					<label for="cine" class="col-md-2 col-sm-2 control-label">Cine:</label>
							<div class="col-md-4">
								<select name="cine" class="form-control" id="cine_select"></select>
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
							 <p id="funcion-precio">$ x</p>
							</div>
				</div>
				<div class="form-group">
					<label for="nombre" class="col-md-2 col-sm-2 control-label">Asientos:</label>
							<div class="col-md-2">
								<g:select from="${1..5}" name="num_asientos" class="form-control"/>
							</div>
				</div>
				</g:form>
			</div>
		</div>
</div>
</body>
</html>