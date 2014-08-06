<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Películas</title>
</head>
<body>
	<div class="container" id="container-simple">
		<g:if test="${session.loggedUserRol == 'ADMIN'}">
			<div class="row" id="button-bar">
				<div class="col-md-2">
					<g:link action="create" class="btn btn-login btn-medium btn-block"><i class="fa fa-plus-square"></i> Nueva Pelicula</g:link>
				</div>
			</div>
		</g:if>
		<div class="row">
			<div class="col-md-12">
				<h2><i class="fa fa-film"></i> Películas</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5" style="width:700px;">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th style="font-size:16px;">Nombre</th>
							<th class="text-center" style="font-size:16px;">Director</th>
							<th class="text-center" style="font-size:16px;">Duracion</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${movies}" var="movie">
						<tr>
							<td><g:link action="show" id="${movie.id}">${movie.nombre}</g:link></td>
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