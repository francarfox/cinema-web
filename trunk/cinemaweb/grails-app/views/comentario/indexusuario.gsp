<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Comentarios - CinemaWeb</title>
</head>
<body>
	<div class="container">		
		<div class="col-md-12">
			<h2><i class="fa fa-comments-o"></i> Mis Comentarios</h2>
		</div>
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Mensaje</th>
							<th class="text-center">Fecha</th>
							<th class="text-center">Comentado en</th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${comentarios}" var="comentario">
							<tr>
								<td class="text-center">${comentario.mensaje}</td>
								<td class="text-center">${comentario.fecha}</td>
								<td class="text-center">${comentario.comentable.getNombre()}</td>	
							</tr>
						</g:each>
					</tbody>
					<tfoot>
						<tr>
							<td class="text-center" colspan="4"></td>
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