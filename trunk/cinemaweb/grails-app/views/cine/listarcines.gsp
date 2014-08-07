<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Panel Adminstrador Cine - CinemaWeb</title>
</head>
<body>
	<div class="container">
			<div class="col-md-12">
				<h1 style="margin-bottom:30px;"><i class="fa fa-comments-o"></i> Panel Adminstrador Cine</h1>
			</div>
			<div class="col-md-8">
				<g:link controller="cine" action="create" class="btn btn-warning" style="color:black">Nuevo cine</g:link>
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Nombre</th>
							<th class="text-center">Ubicacion</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:if test="${cines.size() > 0}">
						<g:each in="${cines}" var="cine">
							<tr>
								<td class="text-center"><g:link controller="cine" action="show" id="${cine.id}" style="color:white">${cine.nombre}</g:link></td>
								<td class="text-center">${cine.ubicacion}</td>
								<td class="text-center">
									<g:link controller="cine" action="eliminarcine" id="${cine.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
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