<html>
<head>
	<title>Ver Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>
	        <g:if test="${messageV}">
		    	<div id="message_val">${messageV}</div>
		    </g:if>
	        <g:hasErrors bean="${usuario}">
	            <div id="message_error">
	                <g:renderErrors bean="${usuario}" as="list" />
	            </div>
	        </g:hasErrors>

	    <div class="row">
			<div class="col-md-8">
				<h1>Circulo de ${circulo.nombre}</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" style="float:right">
					<g:field type="text" name="busquedacirculo" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
		</div>
			
		<div class="col-md-8" style="margin-top:20px;">
			<table class="table">
				<thead>
				<tr>
					<td><h2 style="text-align:center;color:#ffcc00;">Comentarios</h2></td>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height:300px"></td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<thead>
					<tr>
						<td><h2 style="text-align:center;color:#ffcc00;">Postear un comentario</h2></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height:100px">
							<g:form action="#">
								<g:field type="textarea" name="enviarcomentario" style="width:650px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
								<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
							</g:form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="col-md-4 pnl-circuloadmin">
		<p style="text-align:center;"><strong>¡Bienvenido ${session.usuario.userId} a su circulo!</strong></p>
			<table class="table tablecirc">
				<thead>
				<tr>
					<td><strong>Nombre</strong></td>
					<td>${circulo.nombre}</td>
				</tr>
				</thead>
				<tr>
					<td><strong>Tags</strong></td>
					<td>${circulo.tags}</td>
				</tr>
				<tr>
					<td><strong>Usuarios</strong></td>
					<td>
						<g:if test="${circulo.usuarios!=null}">
							<g:each in="${circulo.usuarios}" var="usuario">${usuario.userId} |</g:each>
						</g:if>
						<g:else>No hay usuarios unidos</g:else>
					</td>
				</tr>
			</table>
			<table style="background-color:#F1C308">
				<tr>
					<td>
						<g:form action="edit" id="${circulo.id}">
							<g:submitButton class="btn btn-lg btn-crearcirculo" name="Editar Circulo"/>
						</g:form>
					</td>
					<td style="width:50%;">&nbsp</td>
					<td>
						<g:form action="delete" id="${circulo.id}">
							<g:submitButton class="btn btn-lg btn-crearcirculo" name="Eliminar Circulo"/>
						</g:form>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp</td>
				</tr>
				<tr>
					<td>
						<g:form action="create">
							<g:submitButton class="btn btn-lg btn-crearcirculo" name="Crear Circulo" />
						</g:form>
					</td>
					<td style="width:50%;">&nbsp</td>
					<td>
						<g:form>
							<g:submitButton class="btn btn-lg btn-crearcirculo" name="Eliminar Usuario" />
						</g:form>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>