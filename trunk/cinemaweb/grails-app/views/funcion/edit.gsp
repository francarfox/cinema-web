<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Nueva Funcion</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	</style>
	<calendar:resources lang="en"/>
	<!---- cargo el archivo que maneja los selects de cines ---->
	<r:external uri="/js/cine-data_select.js"/>
	<script>
	var decodedData = $('<div/>').html("${cinesData}").text();
	console.log(cinesData);
	var cinesData = $.parseJSON(decodedData);
	console.log(cinesData);
	jQuery(document).ready(function($) {
		//inicializo selectores de cines y salas
		inicializarCines(cinesData,"${dataToDisplay.cine}", "${dataToDisplay.sala}");
		$("select#cine").change(function(event) {
			event.preventDefault();
			changeSalas($(this).val(),cinesData,0)
		});
	});
	</script>
</head>
<body>
<div class="container" id="container-simple">
		<g:if test="${errors}">
					<div class="row">
						<div class="col-md-6">
							<div id="message_error">
								<ul>
								<g:each in="${errors}">
									<li><g:message error="${it}" /></li>
								</g:each>
								</ul>		
							</div>
						</div>
					</div>
			</g:if>
			<div class="row">
				<div class="col-md-8">
					<h4>Funcion# ${funcionID} - ${dataToDisplay.nombre}</h4>
					<g:form action="edit" id="${funcionID}"class="form-horizontal">
						<div class="form-group">
							<label for="nombre" class="col-md-2 col-sm-2 control-label">Nombre:</label>
							<div class="col-md-4">
								<input type="text" class="form-control" name="nombre" value="${dataToDisplay.nombre}">
							</div>
						</div>
						<div class="form-group">
							<label for="cine" class="col-md-2 col-sm-2 control-label">Pelicula:</label>
							<div class="col-md-4">
								<g:select class="form-control" from="${peliculas}" name="pelicula" optionKey="id" optionValue="titulo" value="${dataToDisplay.pelicula}"></g:select>
							</div>
						</div>
						<div class="form-group">
							<label for="cine" class="col-md-2 col-sm-2 control-label">Cine:</label>
							<div class="col-md-4">
								<select name="cine" id="cine" class="form-control"></select>
							</div>
						</div>
						<div class="form-group">
							<label for="sala" class="col-md-2 col-sm-2 control-label">Sala:</label>
							<div class="col-md-4">
								<select name="sala" id="sala" class="form-control"></select>
							</div>
						</div>
						<div class="form-group">
							<label for="precio" class="col-md-2 col-sm-2 control-label">Horario:</label>
							<div class="col-md-2">
								<g:select class="form-control" from="${horarios}" name="horario" value="${dataToDisplay.horario}"></g:select>	
							</div>
						</div>
						<div class="form-group">
							<label for="precio" class="col-md-2 col-sm-2 control-label">Precio:</label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="precio" value="${dataToDisplay.precio}">
							</div>
						</div>
						<div class="form-group">
							<label for="desde" class="col-md-2 col-sm-2 control-label">Desde:</label>
							<div class="col-md-4">
								<calendar:datePicker class="form-control" name="desde" defaultValue="${dataToDisplay.desde}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="hasta" class="col-md-2 col-sm-2 control-label">Hasta:</label>
							<div class="col-md-4">
								<calendar:datePicker class="form-control" name="hasta" defaultValue="${dataToDisplay.hasta}"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<g:link action="show" id="${funcionID}" class="btn btn-default">Cancelar</g:link>
								<button type="submit" class="btn btn-primary">Editar</button>
								<input type="hidden" name="submit" value="1">
							</div>
						</div>
					</g:form>	
				</div>
			</div>
</div>	
</body>
</html>