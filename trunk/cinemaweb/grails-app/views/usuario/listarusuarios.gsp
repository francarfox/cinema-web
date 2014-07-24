<html>

<head>
	<title> Panel Administrador Usuarios · CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>

<body>
	<div class="container">
			
		<div class="row">
			<div class="col-md-8">
				<h1>Usuarios de CinemaWeb (total: ${usuarios.size()})</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" class="form-inline" style="float:right">
					<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Usuarios" name="busquedausuarios" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
		</div>
			
		<div class="col-md-12" style="margin-top:30px;">
			<g:if test="${usuarios!=null}">
				<g:each in="${usuarios}" var="usuario">
					<div class="col-md-2">
						<g:form action="eliminarusuario" id="${usuario.id}">
							<p>FOTO</p>
							<br />
							<p><strong><g:link controller="usuario" action="show" id="${usuario.id}">${usuario.userId}</g:link></strong></p>
							<p>${usuario.rol}</p>
							<g:if test="${session.loggedUserNombre != usuario.userId}">
								<g:link action="cambiarrol" id="${usuario.id}" class="btn btn-lg btn-medium btn-crearcirculo">Cambiar Rol</g:link>
							</g:if>
							<g:submitButton class="btn btn-lg btn-medium btn-crearcirculo" name="Eliminar" />
						</g:form>
					</div>
				</g:each>
			</g:if>
			<g:else>
				<h4>No hay usuarios para mostrar</h4>
			</g:else>
		</div>

	</div>

</body>
</html>