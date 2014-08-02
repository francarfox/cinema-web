<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema web - Pelicula</title>
	<style type="text/css">
	.col-md-6{margin: 0px;}
	h4{margin-bottom: 10px}
	</style>
</head>
<body>
	<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-12">
				<h3>Pelicula: #${movie.id} - ${movie.titulo}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12" id="data-display">
						<div class="row">
							<div class="col-md-2"><b>Titulo:</b></div>
							<div class="col-md-10">${movie.titulo}</div>
						</div>
						<div class="row">
							<div class="col-md-2"><b>Director:</b></div>
							<div class="col-md-10">${movie.director}</div>
						</div>
						<div class="row">
							<div class="col-md-2"><b>Sinopsis:</b></div>
							<div class="col-md-10">
								${movie.sinopsis}	
							</div>
						</div>
						<div class="row">
							<div class="col-md-2"><b>Duracion:</b></div>
							<div class="col-md-10">
								${movie.duracion} minutos
							</div>
						</div>	
					</div>
				</div>
				<!--- Trailer ---->
				<div class="row">
					<div class="col-md-12">
						<h4>Trailer</h4>
						<g:if test="${movie.urlTrailer}">
						<iframe 
						src="${movie.urlTrailer}">
					</iframe>
				</g:if>
				<g:else>
				<p><i>No trailer to display</i></p>
			</g:else>
		</div>
	</div>

<!--Comentarios-->
<div id="Comentarios">
	<div class="col-md-12">
		<g:form action="comentar" id="${movie.id}">
			<div class="col-md-2">
			<g:submitButton name="Comentar" class="btn btn-primary btn-block"/>
			</div>
			<g:field type="text" name="mensaje"/>
		</g:form>
	</div>

	<g:render template="comentarioTemp" collection="${movie.comentarios}" var="comentario"/>
</div>

</div>
<div class="col-md-4">
	<div class="row">
		<div class="col-md-12">
			<div class="well" id="actions">
				<h4><b>Actions</b></h4>	
				<div class="row">
					<div class="col-md-6">
						<g:link action="edit" id="${movie.id}" ><i class="fa fa-edit"></i> Editar</g:link>
					</div>
					<div class="col-md-6">
						<g:link action="uploadPic" id="${movie.id}" ><i class="fa fa-file"></i> Cargar Foto</g:link>
					</div>
				</div>
				<div class="row">
				<div class="col-md-12">
						<g:link action="index"><i class="fa fa-list"></i> Peliculas</g:link>
				</div>
				</div>
			</div>
		</div>
	</div>
	<g:if test="${movie.foto}">
		<div class="row">
			<div class="col-md-12">
				<h4><b>Foto</b></h4>	
				<g:img dir="/images/cinema-web/peliculas-pics" file="${movie.foto}" class="img-rounded show-img" />
			</div>
		</div>	
	</g:if>
</div>
</div>
</div>
</body>
</html>