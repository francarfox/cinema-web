<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Salas</title>
</head>
<body>
	<div class="container">
		<div class="row" id="button-bar">
			<div class="col-md-12">
				<g:link url="/cinemaweb" class="btn btn-danger"><i class="fa fa-home"></i> Pagina Principal</g:link>
				<g:link action="create" class="btn btn-danger"><i class="fa fa-plus-square"></i> Nueva Sala</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Salas</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Cine</th>
							<th class="text-center adjust-to-content">Filas</th>
							<th class="text-center adjust-to-content">Columnas</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${salas}" var="sala">
						<tr>
							<td><g:link action="show" id="${sala.id}">${sala.nombre}</g:link></td>
							<td>
								<g:if test="${sala.cine}">
									<g:link controller="cine" action="show" id="${sala.cine.id}">${sala.cine.nombre}</g:link>
								</g:if>
								<g:else>
									"-"
								</g:else>
							</td>	
							<td class="text-center">${sala.filas}</td>
							<td class="text-center">${sala.columnas}</td>	
						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>