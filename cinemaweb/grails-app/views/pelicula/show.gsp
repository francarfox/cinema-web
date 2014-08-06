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
				<h3>Pelicula: #${movie.id} - ${movie.nombre}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12" id="data-display">
						<div class="row">
							<div class="col-md-2"><b>Nombre:</b></div>
							<div class="col-md-10">${movie.nombre}</div>
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
	<table class="table">
		<tr>
			<td><h2 style="text-align:center;color:#ffcc00;">Postear un comentario</h2></td>
		</tr>
		<td style="height:100px">
			<g:form action="comentar" id="${movie.id}">
				<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
				<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
			</g:form>
		</td>
	</table>
	<g:render template="comentarioTemp" collection="${movie.obtenerComentarios()}" var="comentario"/>
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