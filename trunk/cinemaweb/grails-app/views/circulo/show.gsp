<html>
<head>
	<title>Ver Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container" style="padding-left:0px;">

		<div class="container">
		<g:if test="${errors}">
			<div class="row">
				<div class="col-md-11">
					<div id="message_error">
						<ul>
							<g:each in="${errors}">
								<li><g:message error="${it}" /></li>
							</g:each>
						</ul>		
					</div>
				</div>
			</div>
		</g:if>

		<g:if test="${!circulo.estaUsuario(usuario)}">
			<h1>Acceso denegado: debe ingresar al circulo para poder verlo.</h1>
		</g:if>
		<g:else>
		<g:if test="${session.loggedUserNombre == circulo.getAdministrador()}">
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
			<div class="row" style="margin-left:5px;">
				<div class="col-md-12" style="padding-left:0px;">
					<g:if test="${circulo.foto}">
						<g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" />
							<g:link controller="circulo" action="uploadPic" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" style="margin-bottom:10px;"><i class="fa fa fa-camera"></i> Editar Foto</g:link>
					</g:if>
					<g:else>
						<g:img dir="/images/cinema-web/circulos-pics" file="${'default.png'}" class="img-rounded show-img" />
						<g:link controller="circulo" action="uploadPic" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" style="margin-bottom:10px;"><i class="fa fa fa-camera"></i> Subir Foto</g:link>
					</g:else>
				</div>
			</div>
			<table class="table tablecirc">
				<thead>
				<tr>
					<td><strong>Nombre</strong></td>
					<td>${circulo.getNombre()}</td>
				</tr>
				</thead>
				<tr>
					<td><strong>Tag</strong></td>
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
						<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" params="[accion:'listar']"><i class="fa fa-list"></i> Lista Usuarios</g:link>
					</td>
					<td style="width:50%;">&nbsp</td>
					<td>
						<!-- Hacer este boton -->
						<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" params="[accion:'eliminar']"><i class="fa fa-ban"></i> Eliminar Usuario</g:link>
					</td>
				</tr>
			</table>
		</div>
		</g:if>

		<g:else>
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

		<div>
			<table class="table">
				<thead>
				<tr>
					<td><h2 style="text-align:center;color:#ffcc00;">Comentarios</h2></td>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height:300px"><g:render template="comentarioTemp" collection="${circulo.comentarios}" var="comentario"/></td>
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
			<table style="background-color:#F1C308;margin:0 auto 0 auto;">
				<thead>
					<tr>
						<td>
							<g:link action="desunirse" id="${circulo.id}" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-external-link"></i> Desunirme</g:link>
						</td>
						<td>&nbsp</td>
						<td>
							<g:link action="index" id="${session.loggedUser}" params="[accion:'miscirculos']" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-comments"></i> Mis Círculos</g:link>
						</td>
						<td>&nbsp</td>
						<td>
							<g:link action="listarusuarios" class="btn btn-lg btn-large btn-crearcirculo" id="${circulo.id}"><i class="fa fa-list"></i> Lista Usuarios</g:link>
						</td>
						<td>&nbsp</td>
						<td>
							<g:link action="index" params="[accion:'circulos']" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-list"></i> Círculos</g:link>
						</td>
					</tr>
				</thead>
			</table>
		</div>
		</g:else>
		</g:else>

	</div>
</body>
</html>