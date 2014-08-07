<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Panel Adminstrador Pelicula - CinemaWeb</title>
</head>
<body>
	<div class="container">
			<div class="col-md-12">
				<h1 style="margin-bottom:30px;"><i class="fa fa-film"></i> Panel Adminstrador Pelicula</h1>
			</div>
			<div class="col-md-10">
				<g:link controller="pelicula" action="create" class="btn btn-warning" style="color:black">Nueva pelicula</g:link>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Nombre</th>
							<th class="text-center">Director</th>
							<th class="text-center">Genero</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${peliculas.size() > 0}">
						<g:each in="${peliculas}" var="pelicula">
							<tr>
								<td class="text-center"><g:link controller="pelicula" action="show" id="${pelicula.id}" style="color:white">${pelicula.nombre}</g:link></td>
								<td class="text-center">${pelicula.director}</td>
								<td class="text-center">${generosPelicula[pelicula.genero]}</td>
								<td class="text-center">
									<g:link controller="pelicula" action="eliminarpelicula" id="${pelicula.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
							</tr>
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