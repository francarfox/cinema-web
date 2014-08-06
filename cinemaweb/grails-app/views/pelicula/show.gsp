<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema web - Película</title>
	<style type="text/css">
	.col-md-6{margin: 0px;}
	h4{margin-bottom: 10px}
	</style>
</head>
<body>
	<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-12">
				<h3><i class="fa fa-film"></i> Película: #${movie.id} - ${movie.nombre}</h3>
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
						<br />
						<h3><i class="fa fa-youtube"></i> Trailer</h3>
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
<div class="col-md-12">
	<br />
	<h3><i class="fa fa-star"></i> Puntuación</h3>
	<h5><strong>${movie.nombre} posee ${movie.puntos} puntos.</strong></h5>
	<g:if test="${session.loggedUser != null}">
	<g:form action="puntuar" id="${movie.id}">
	<table class="table" style="width:200px;">
		<tr>
			<td><g:select from="${[1,2,3,4,5,6,7,8,9,10]}" class="form-control" name="puntos"/></td>
			<td>
				<input type="hidden" name="submit" value="1">
				<g:submitButton class="btn btn-login " name="Puntuar"/>
			</td>
		<tr>
	</table>
	</g:form>
	</g:if>
	<g:else>
		<h5><i class="fa fa-exclamation-triangle"></i> Debe estar logueado para poder comentar | <g:link controller="usuario" action="login">Login</g:link></h5>
	</g:else>
	<br />
	<h3><i class="fa fa-comments-o"></i> Comentarios</h3>
</div>
<div id="Comentarios">
	<table class="table">
		<tbody>
			<tr>
				<td style="height:350px">
					<g:render template="comentarioTemp" collection="${movie.obtenerComentarios()}" var="comentario"/>
				</td>
			</tr>
		</tbody>
	</table>
	<g:if test="${session.loggedUser != null}">
		<table class="table">
			<td style="height:100px">
				<g:form action="comentar" id="${movie.id}">
				<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;margin-top:15px;color:black;" />
				<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
			</g:form>
			</td>
		</table>
	</g:if>
	<g:else>
		<h4 style="text-align:center;"><i class="fa fa-exclamation-triangle"></i> Debe estar logueado para poder comentar | <g:link controller="usuario" action="login">Login</g:link></h4>
	</g:else>
</div>


</div>
<div class="col-md-4">
	<div class="row">
		<div class="col-md-12">
			<div class="well" id="actions">
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
				<h3><i class="fa fa-file"></i> Foto</h3>	
				<g:img dir="/images/cinema-web/peliculas-pics" file="${movie.foto}" class="img-rounded show-img" />
			</div>
		</div>	
	</g:if>
</div>
</div>
</div>
</body>
</html>