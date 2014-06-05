<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Cines </title>
</head>
<body>
	<div class="container">
		<div class="row" id="button-bar">
			<div class="col-md-12">
				<g:link action="create" class="btn btn-danger"><i class="fa fa-plus-square"></i> Nuevo Cine</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Cines</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th>Nombre</th>
							<th class="text-center">Ubicacion</th>
							<th class="text-center">Precio Base</th>
							<th class="text-center">Apertura</th>
							<th class="text-center">Cierre</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${cines}" var="cine">
						<tr>
							<td><g:link action="show" id="${cine.id}">${cine.nombre}</g:link></td>
							<td class="text-center">${cine.ubicacion}</td>
							<td class="text-center">$ ${cine.precioBase}</td>
							<td class="text-center">${cine.apertura} hs</td>
							<td class="text-center">${cine.cierre} hs</td>
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>