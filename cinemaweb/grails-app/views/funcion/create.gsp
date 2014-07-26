<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Nueva Pelicula</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	</style>
	<calendar:resources lang="en"/>
</head>
<body>
<div class="container">
		<g:if test="${!canCreate}">
	   		<div class="row">
	   			<div class="col-md-4">
	   				<div id="message_error">
	   					<b>Oops!! parace que hay algo que falta.</b><br>
	   					chequea que hayan cines, salas y peliculas.
	   				</div>
	   			</div>
	   		</div>
	   	</g:if>
		
		<g:else>
			<div class="row">
				${cineData}
				<div class="col-md-8">
					<h4>Nueva funcion</h4>
					<g:form action="create" class="form-horizontal">
						<div class="form-group">
							<label for="nombre" class="col-md-2 col-sm-2 control-label">Nombre:</label>
							<div class="col-md-4">
								<input type="text" class="form-control" name="nombre">
							</div>
						</div>
						<div class="form-group">
							<label for="precio" class="col-md-2 col-sm-2 control-label">Precio:</label>
							<div class="col-md-4">
								<input type="text" class="form-control" name="precio">
							</div>
						</div>
						<div class="form-group">
							<label for="precio" class="col-md-2 col-sm-2 control-label">Horario:</label>
							<div class="col-md-2">
								<g:select class="form-control" from="${horarios}" name="horario"></g:select>	
							</div>
						</div>
						<div class="form-group">
							<label for="desde" class="col-md-2 col-sm-2 control-label">Desde:</label>
							<div class="col-md-4">
								<calendar:datePicker class="form-control" name="desde" defaultValue="${new Date()}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="hasta" class="col-md-2 col-sm-2 control-label">Hasta:</label>
							<div class="col-md-4">
								<calendar:datePicker class="form-control" name="hasta" defaultValue="${new Date()}"/>
							</div>
						</div>
					</g:form>	
				</div>
			</div>
		</g:else>
</div>	
</body>
</html>