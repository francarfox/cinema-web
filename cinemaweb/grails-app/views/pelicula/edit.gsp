<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Editar Película</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	</style>
</head>
<body>
	<div class="container" id="container-simple">
		<g:if test="${movie}">
	    	<g:hasErrors bean="${movie}">
			<div id="message_error">
				<g:renderErrors bean="${movie}" as="list" />
			</div>
		</g:hasErrors>
	    </g:if>
<div class="row">
	<div class="col-md-8">
		<h3><i class="fa fa-edit"></i> Editar Película</h3>
		<g:form action="edit" id="${movie.id}" class="form-horizontal">
		<div class="form-group">
			<label for="nombre" class="col-md-2 col-sm-2 control-label">Nombre:</label>
			<div class="col-md-4">
				<input name="nombre" class="form-control" id="nombre" value="${movie.nombre}">
			</div>
		</div>
		<div class="form-group">
			<label for="director" class="col-md-2 col-sm-2 control-label">Director:</label>
			<div class="col-md-4">
				<input name="director" class="form-control" id="director" value="${movie.director}">
			</div>
		</div>
		<div class="form-group">
			<label for="genero" class="col-md-2 col-sm-2 control-label">Genero:</label>
			<div class="col-md-3">
				<g:select name="genero" from="${generos}" value="${movie.genero}" optionKey="key" optionValue="value" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="sinopsis" class="col-md-2 col-sm-2 control-label">Sinopsis:</label>
			<div class="col-md-6">
				<textarea name="sinopsis" class="form-control" rows="6">${movie.sinopsis}</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="duracion" class="col-md-2 col-sm-2 control-label">Duracion:</label>
			<div class="col-md-2">
				<g:select name="duracion" from="${90..180}" value="${movie.duracion ?: 90}" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-md-2 col-md-offset-2">
				<input type="hidden" name="submit" value="1">
				<g:link controller="pelicula" action="show" id="${movie.id}" class="btn btn-default btn-medium btn-block">Volver</g:link>
			</div>
			<div class="col-sm-10 col-md-2">
				<button type="submit" class="btn btn-login btn-medium btn-block">Editar</button>
			</div>
		</div>
	</g:form>
</div>	
</div>	
</div>	
</body>
</html>