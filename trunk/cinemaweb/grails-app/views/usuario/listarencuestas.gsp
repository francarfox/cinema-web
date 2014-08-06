<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Encuestas - CinemaWeb</title>
</head>
<body>
	<div class="container">


			<div class="col-md-12">
				<h1><i class="fa fa-dot-circle-o"></i> Encuestas de CinemaWeb</h1>
			</div>

			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Titulo</th>
							<th class="text-center">Opciones</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${circulos}" var="circulo">
							<g:if test="${circulo.encuesta != null}">
							<tr>
								<td class="text-center">${circulo.encuesta.getTitulo()}</td>
								<td class="text-center">
									<g:each in="${circulo.encuesta.opciones}" var="opcion">
										<i class="fa fa-dot-circle-o"></i> ${opcion.getNombre()} 
									</g:each>
								</td>
								<td class="text-center">
									<g:link controller="encuesta" action="delete" id="${circulo.encuesta.id}" params="[circuloid:circulo.id,accion:'admin']" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;"><i class="fa fa-times"></i> Eliminar</g:link>
								</td>	
								</tr>
							</g:if>
						</g:each>
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