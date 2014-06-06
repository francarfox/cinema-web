<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Comentarios - CinemaWeb</title>
</head>
<body>
	<div class="container">		
		<div class="row">
			<div class="col-md-12">
				<h2>Mis Comentarios</h2>
			</div>
		</div>
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Autor</th>
							<th class="text-center">Mensaje</th>
							<th class="text-center">Fecha</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${comentarios}" var="comentario">
							<tr>
								<td class="text-center"><g:link action="show" id="${comentario.id}"><i class="fa fa-comments"></i> ${comentario.autor}</g:link></td>
								<td class="text-center">${comentario.mensaje}</td>
								<td class="text-center">${comentario.fecha}</td>
								<td class="text-center">
									<g:link action="show" id="${comentario.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;">Ver <i class="fa fa-check"></i></g:link>
								</td>	
							</tr>
						</g:each>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4">1</td>
						</tr>
					</tfoot>
				</table>
		</div>
		<div class="col-md-4 pnl-circulo">
			<g:form action="">
				<g:field type="text" placeholder="Buscar Comentarios" class="form-control form-busqueda" name="busquedacirculo" />
				<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
			</g:form>
		</div>

	</div>
</body>
</html>