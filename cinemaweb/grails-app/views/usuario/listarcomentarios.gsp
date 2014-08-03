<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Encuestas - CinemaWeb</title>
</head>
<body>
	<div class="container">


			<div class="col-md-12">
				<h1>Comentarios de CinemaWeb</h1>
			</div>
			<h1>Comentarios en Cines</h1>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${cines.comentarios != null}">
						<g:each in="${cines.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center">${comentario.getAutor()}</td>
								<td class="text-center">
									<g:link controller="cine" action="eliminarcomentario" id="${comentario.id}" params="[accion:'admin']" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
								</tr>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4">1</td>
						</tr>
					</tfoot>
				</table>
			</div>
		

			<h1>Comentarios en Peliculas</h1>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${peliculas.comentarios != null}">
						<g:each in="${peliculas.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center">${comentario.getAutor()}</td>
								<td class="text-center">
									<g:link controller="pelicula" action="eliminarcomentario" id="${comentario.id}" params="[accion:'admin']" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
								</tr>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4">1</td>
						</tr>
					</tfoot>
				</table>
			</div>

			<h1>Comentarios en Circulos</h1>
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Comentario</th>
							<th class="text-center">Autor</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${circulos.comentarios != null}">
						<g:each in="${circulos.comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.getMensaje()}</td>
								<td class="text-center">${comentario.getAutor()}</td>
								<td class="text-center">
									<g:link controller="circulo" action="eliminarcomentario" id="${comentario.id}" params="[accion:'admin']" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
								</tr>
						</g:each>
						</g:if>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4">1</td>
						</tr>
					</tfoot>
				</table>
			</div>
	
	</div>
</body>
</html>