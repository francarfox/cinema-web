<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Comentarios Admin - CinemaWeb</title>
</head>
<body>
	<div class="container">


			<div class="col-md-12">
				<h1 style="margin-bottom:30px;"><i class="fa fa-comments-o"></i> Comentarios de CinemaWeb</h1>
			</div>
			<h2>Comentarios en Cines</h2>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th class="text-center">Comentó en</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${cines.comentarios != null}">
						<g:each in="${cines}" var="cine">
							<g:each in="${cine.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center"><g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.getAutor().getUserId()}</g:link></td>
								<td class="text-center">${comentario.comentable.getNombre()}</td>
								<td class="text-center">
									<g:link controller="cine" action="eliminarcomentario" id="${cine.id}" params="[comentarioid:comentario.id]" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
							</tr>
							</g:each>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		
			<h2>Comentarios en Películas</h2>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th class="text-center">Comentó en</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${peliculas.comentarios != null}">
						<g:each in="${peliculas}" var="pelicula">
							<g:each in="${pelicula.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center"><g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.getAutor().getUserId()}</g:link></td>
								<td class="text-center">${comentario.comentable.getNombre()}</td>
								<td class="text-center">
									<g:link controller="pelicula" action="eliminarcomentario" id="${pelicula.id}" params="[comentarioid:comentario.id]" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
							</tr>
							</g:each>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4"></td>
						</tr>
					</tfoot>
				</table>
			</div>

			<h2>Comentarios en Círculos</h2>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th class="text-center">Comentó en</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${circulos.comentarios != null}">
						<g:each in="${circulos}" var="circulo">
							<g:each in="${circulo.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center"><g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.getAutor().getUserId()}</g:link></td>
								<td class="text-center">${comentario.comentable.getNombre()}</td>
								<td class="text-center">
									<g:link controller="circulo" action="eliminarcomentario" id="${circulo.id}" params="[comentarioid:comentario.id]" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
							</tr>
							</g:each>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4"></td>
						</tr>
					</tfoot>
				</table>
			</div>

	</div>
</body>
</html>