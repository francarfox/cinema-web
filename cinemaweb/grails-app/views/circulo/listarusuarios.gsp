<html>
<head>
	<title>Listado de usuarios - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

	<g:if test="${params.accion == 'eliminar'}">
		<div class="row">
			<div class="col-md-8">
				<h1>Usuarios del círculo ${circulo.getNombre()}</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" class="form-inline" style="float:right">
					<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Usuarios" name="busquedacirculo" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
		</div>
			
		<div class="col-md-8" style="margin-top:20px;">
			<g:form action="eliminarusuario" id="${circulo.id}">
				<g:if test="${circulo.usuarios != null && circulo.usuarios.size() != 1}">
					<g:each in="${circulo.usuarios}" var="usuario">
							<div class="col-md-2">
								<g:img dir="/images/cinema-web/perfil-pics" file="${usuario.perfil.foto}" class="img-rounded show-img" />
								<br />
								<p style="text-align:center;"><strong><g:link controller="usuario" action="show" id="${usuario.id}">${usuario.getUserId()}</g:link></strong></p>
								<g:if test="${usuario.getUserId() != circulo.getAdministrador()}">
									<input type="radio" name="userid" value="${usuario.id}" style="margin-left:38px;" />
								</g:if>
							</div>
					</g:each>
					<div class="col-md-12">
						<br />
						<input type="hidden" name="submit" value="1">
						<g:submitButton class="btn btn-lg btn-medium btn-crearcirculo" name="Eliminar" />
					</div>
				</g:if>
				<g:else>
					<h4 style="margin-left:20px;">No hay usuarios unidos para eliminar</h4>
				</g:else>
			</g:form>
		</div>
	</g:if>

	<g:else>
	    <div class="row">
			<div class="col-md-8">
				<h1>Usuarios del círculo ${circulo.nombre}</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" class="form-inline" style="float:right">
					<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Circulos" name="busquedacirculo" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
		</div>
			
		<div class="col-md-8" style="margin-top:20px;">
			<g:if test="${circulo.usuarios!=null}">
				<g:each in="${circulo.usuarios}" var="usuario">
					<div class="col-md-2">
						<g:img dir="/images/cinema-web/perfil-pics" file="${usuario.perfil.foto}" class="img-rounded show-img" />
						<br />
						<p style="text-align:center;"><strong>
							<g:link controller="usuario" action="show" id="${usuario.id}">${usuario.userId}</g:link>
						</strong></p>
					</div>
				</g:each>
			</g:if>
			<g:else>
				<h4>No hay usuarios unidos para mostrar</h4>
			</g:else>
		</div>
	</g:else>
	</div>
</body>
</html>