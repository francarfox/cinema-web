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
				<h2>Circulos</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<table class="table table-bordered table-stripped">
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
							<td class="text-center"><g:link action="show" id="${circulo.id}">${circulo.nombre}</g:link></td>
							<td class="text-center">${circulo.tags}</td>
							<td class="text-center">${circulo.administrador}</td>
							<td class="text-center">
								<g:if test="${circulo.estaUsuario(session.usuario) || (session.usuario.userId == circulo.administrador.userId)}">
									<g:form action="show" id="${circulo.id}">
										<g:submitButton class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;" name="Ver"/>
									</g:form>
								</g:if>
								<g:else>
									<g:form action="unirse" id="${circulo.id}">
										<g:submitButton class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;" name="Unirse"/>
									</g:form>
								</g:else>
							
							</td>	
						</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row" style="margin-left:1px;">
			<br />
			<g:form action="create">
				<g:submitButton name="Crear Circulo"/>
			</g:form>
			<br />
		</div>
	</div>
</body>
</html>