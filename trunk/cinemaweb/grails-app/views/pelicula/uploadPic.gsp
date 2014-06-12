<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Pelicula Foto</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	.form-group > p{padding-top: 7px}
	input[name="foto"]{margin-bottom: 20px}
	</style>
</head>
<body>
	<div class="container">
<div class="row">
	<div class="col-md-8">
		<h4>${movie.titulo}: Pic</h4>
		<g:if test="${error}">
		<div class="row">
			<div class="col-md-12">
				<div class="alert alert-danger">
					Ningún archivo selecionado o hubo un error, intentelo nuevamente!
				</div>
			</div>	
		</div>
		</g:if>
		<g:uploadForm action="uploadPic" id="${movie.id}" class="form-horizontal">
		<div class="form-group">
			<label class="col-md-2 col-sm-2 control-label">Foto actual:</label>
			<div class="col-md-6">
				<p style="padding-top: 7px"><i>${movie.foto ?: "No hay foto"}</i></p>
			</div>	
		</div>
		<div class="form-group">
			<div class="col-md-8">
				<input name="foto" type="file"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10 col-md-2">
				<input type="hidden" name="submit" value="1">
				<g:link controller="pelicula" action="show" id="${movie.id}" class="btn btn-default btn-block">Volver</g:link>
			</div>
			<div class="col-sm-10 col-md-2">
				<button type="submit" class="btn btn-primary btn-block">Subir</button>
			</div>
		</div>
	</g:uploadForm>
</div>	
</div>	
</div>	
</body>
</html>