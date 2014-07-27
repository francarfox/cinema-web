<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Perfil Foto</title>
	<style type="text/css">
	.col-md-6{margin:0px;}
	.form-group > p{padding-top: 7px}
	input[name="foto"]{margin-bottom: 20px}
	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>Subir foto al ${circulo.nombre}</h1>
			
			<div class="col-md-4">
			</div>

			<div class="col-md-7">
				<g:if test="${error}">
					<div class="alert alert-danger">
						Ningún archivo selecionado o hubo un error, intentelo nuevamente!
					</div>
				</g:if>

				<g:uploadForm action="uploadPic" id="${circulo.id}" class="form-horizontal">
					<div class="form-group">
						<div class="col-md-5" style="margin-left:0px;">
							<p style="margin-bottom:15px;"><strong>Foto actual:</strong>  <i>${circulo.foto ?: "No hay foto"}</i></p>
							<g:if test="${circulo.foto}">
								<g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" />
							</g:if>
						</div>
					</div>
					<div class="form-group">
						<input class="btn btn-lg btn-large btn-crearcirculo" name="foto" type="file"/>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-lg btn-large btn-crearcirculo" style="margin-left:120px;"><i class="fa fa fa-picture-o"></i> Subir</button>
				</div>
			</div>	

			<div class="col-sm-10 col-md-2">
				<input type="hidden" name="submit" value="1">
				<g:link action="showAdmin" id="${circulo.id}" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa fa-reply"></i> Volver</g:link>
			</div>
			</g:uploadForm>
		</div>	
	</div>	
</body>
</html>