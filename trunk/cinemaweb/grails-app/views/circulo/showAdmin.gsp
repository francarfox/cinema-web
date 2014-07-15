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
				<h1>Circulo de ${circulo.getNombre()}</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" class="form-inline" style="float:right">
					<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Circulos" name="busquedacirculo" />
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
						<td style="height:300px">
							<g:render template="comentarioTemp" collection="${circulo.comentarios}" var="comentario"/>
						</td>
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
							<g:form action="comentar" id="${circulo.id}">
								<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
								<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
							</g:form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="col-md-4 pnl-circuloadmin">
		<p style="text-align:center;"><strong>¡Bienvenido ${circulo.getAdministrador()} a su circulo!</strong></p>
			<table class="table tablecirc">
				<thead>
				<tr>
					<td><strong>Nombre</strong></td>
					<td>${circulo.getNombre()}</td>
				</tr>
				</thead>
				<tr>
					<td><strong>Tags</strong></td>
					<td>${circulo.getTags()}</td>
				</tr>
				<tr>
					<td><strong>Usuarios</strong></td>
					<td>${circulo.usuarios.size()}
						
					</td>
				</tr>
			</table>
			<table style="background-color:#F1C308;">
				<tr>
					<td>
						<g:link action="edit" id="${circulo.id}" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa fa-pencil-square-o"></i> Editar Circulo</g:link>
					</td>
					<td style="width:50%;">&nbsp</td>
					<td>
						<g:link action="delete" id="${circulo.id}" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa-times"></i> Eliminar Circulo</g:link>
					</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp</td>
				</tr>
				<tr>
					<td>
						<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}"><i class="fa fa-list"></i> Lista Usuarios</g:link>
					</td>
					<td style="width:50%;">&nbsp</td>
					<td>
						<!-- Hacer este boton -->
						<g:link action="listarusuarioseliminar" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}"><i class="fa fa-ban"></i> Eliminar Usuario</g:link>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>