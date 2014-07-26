<html>
<head>index
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Nueva Pelicula</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	</style>
</head>
<body>
	<div class="container">
		<g:if test="${movie}">
	    	<g:hasErrors bean="${movie}">
			<div id="message_error">
				<g:renderErrors bean="${movie}" as="list" />
			</div>
		</g:hasErrors>
	    </g:if>
<div class="row">
	<div class="col-md-8">
		<h4>Nueva Pelicula</h4>
		<g:uploadForm action="create" class="form-horizontal">
		<div class="form-group">
			<label for="titulo" class="col-md-2 col-sm-2 control-label">Titulo:</label>
			<div class="col-md-4">
				<input name="titulo" class="form-control" id="titulo" value="${params.titulo}">
			</div>
		</div>
		<div class="form-group">
			<label for="director" class="col-md-2 col-sm-2 control-label">Director:</label>
			<div class="col-md-4">
				<input name="director" class="form-control" id="director" value="${params.director}">
			</div>
		</div>
		<div class="form-group">
			<label for="sinopsis" class="col-md-2 col-sm-2 control-label">Sinopsis:</label>
			<div class="col-md-6">
				<textarea name="sinopsis" class="form-control" rows="6">${params.sinopsis}</textarea>
			</div>
		</div>
		<div class="form-group">
			<label for="duracion" class="col-md-2 col-sm-2 control-label">Duracion:</label>
			<div class="col-md-2">
				<g:select name="duracion" from="${90..180}" value="${params.duracion ?: 90}" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="trailer" class="col-md-2 col-sm-2 control-label">Trailer Url:</label>
			<div class="col-md-6">
				<input name="trailer" class="form-control" id="trailer" value="${params.trailer}">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-md-2 col-md-offset-2">
				<input type="hidden" name="submit" value="1">
				<g:link controller="pelicula" action="index" class="btn btn-default btn-block">Volver</g:link>
			</div>
			<div class="col-sm-10 col-md-2">
				<button type="submit" class="btn btn-primary btn-block">Crear</button>
				<input type="hidden" name="submit" value="1">
			</div>
		</div>
	</g:uploadForm>
</div>	
</div>	
</div>	
</body>
</html>