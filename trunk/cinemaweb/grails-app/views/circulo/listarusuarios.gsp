<html>
<head>
	<title>Listado de usuarios - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

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
						<p>FOTO</p>
						<br />
						<p><strong><g:link controller="usuario" action="show" id="${usuario.id}">${usuario.userId}</g:link></strong></p>
					</div>
				</g:each>
			</g:if>
			<g:else>
				<h4>No hay usuarios unidos para mostrar</h4>
			</g:else>
		</div>

		
	</div>
</body>
</html>