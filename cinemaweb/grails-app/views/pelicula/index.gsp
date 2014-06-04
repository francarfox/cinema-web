<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Peliculas</title>
</head>
<body>
	<div class="container">
		<div class="row" id="button-bar">
			<div class="col-md-12">
				<g:link action="create" class="btn btn-danger"><i class="fa fa-plus-square"></i> Nueva Pelicula</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Peliculas</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th>Titulo</th>
							<th class="text-center">Director</th>
							<th class="text-center">Duracion</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${movies}" var="movie">
						<tr>
							<td><g:link action="show" id="${movie.id}">${movie.titulo}</g:link></td>
							<td class="text-center">${movie.director}</td>
							<td class="text-center">${movie.duracion} m</td>	
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>