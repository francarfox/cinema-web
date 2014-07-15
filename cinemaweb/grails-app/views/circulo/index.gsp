<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Circulos - CinemaWeb</title>
</head>
<body>
	<div class="container">
		
		<g:if test="${message}">
	    	<div id="message_error">${message}</div>
	    </g:if>
	    <g:if test="${messageV}">
		   	<div id="message_val">${messageV}</div>
		</g:if>
		
		<div class="row">
			<div class="col-md-12">
				<h2>Circulos de Amistad</h2>
			</div>
		</div>
		
			<div class="col-md-8">
				<table class="table">
					<thead>
						<tr>
							<th class="text-center">Nombre</th>
							<th class="text-center">Tags</th>
							<th class="text-center">Administrador</th>
							<th></th>
						</tr>
					</thead>		
					<tbody>
						<g:each in="${circulos}" var="circulo">
						<tr>
							<td class="text-center"><g:link action="show" id="${circulo.id}"><i class="fa fa-comments"></i> ${circulo.getNombre()}</g:link></td>
							<td class="text-center">${circulo.getTags()}</td>
							<td class="text-center">${circulo.getAdministrador()}</td>
							<td class="text-center">
								<g:if test="${circulo.estaUsuario(loggedUser)}">
									<g:link action="show" id="${circulo.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;">Ver <i class="fa fa-check"></i></g:link>
								</g:if>
								<g:else>
									<g:link action="unirse" id="${circulo.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;">Unirse <i class="fa fa-mail-reply"></i></g:link>
								</g:else>
							
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
				<g:form action="#">
					<g:field type="text" placeholder="Buscar Circulos" class="form-control form-busqueda" name="busquedacirculo" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
				<br />
				<table style="margin-top:1px; float:right; background-color:#F1C308;">
					<tr>
						<td>
							<g:link action="create" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-plus-square"></i> Crear Circulo</g:link>
						</td>
						<td style="width:50%;">&nbsp</td>
						<td>
							<g:link action="indexusuario" id="${loggedUser.id}" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-comments"></i> Mis Círculos</g:link>
						</td>
					</tr>
				</table>
			</div>
	</div>
</body>
</html>