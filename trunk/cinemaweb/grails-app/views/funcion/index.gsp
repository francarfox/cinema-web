<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Funciones </title>
</head>
<body>
	<div class="container">
		<div class="row" id="button-bar">
			<div class="col-md-12">
				<g:link action="create" class="btn btn-danger"><i class="fa fa-plus-square"></i> Nueva Funcion</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Funciones</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th>Nombre</th>
							<th class="text-center">Pelicula</th>
							<th class="text-center">Cine</th>
							<th class="text-center">Horario</th>
							<th class="text-center">Precio</th>
							<th class="text-center">Desde</th>
							<th class="text-center">Hasta</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${funciones}" var="funcion">
						<tr>
							<td><g:link action="show" id="${funcion.id}">${funcion.nombre}</g:link></td>
							<td class="text-center">${funcion.pelicula.titulo}</td>
							<td class="text-center">${funcion.cine.nombre}</td>
							<td class="text-center">${funcion.horario} hs</td>
							<td class="text-center">$ ${funcion.precio}</td>
							<td class="text-center">${funcion.desde}</td>
							<td class="text-center">${funcion.hasta}</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>