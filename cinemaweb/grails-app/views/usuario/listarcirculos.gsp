<html>

<head>
	<title> Panel Administrador Circulos · CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>

<body>
	<div class="container">
			
			<div class="col-md-8">
				<h1><i class="fa fa-users"></i> Circulos de CinemaWeb (total: ${circulos.size()})</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" class="form-inline" style="float:right">
					<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Circulos" name="busquedacirculos" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
			
		<div class="col-md-12" style="margin-top:30px;">
			<g:if test="${circulos.size() != 0}">
				<g:each in="${circulos}" var="circulo">
					<div class="col-md-2">
						<g:form action="eliminarcirculo" id="${circulo.id}">
							<g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" />
							<br />
							<p style="text-align:center;"><strong><g:link controller="circulo" action="show" id="${circulo.id}">${circulo.nombre}</g:link></strong></p>
							<p style="text-align:center;"><strong><g:link controller="usuario" action="verusuario" params="[nombre:circulo.getAdministrador()]">(${circulo.getAdministrador()})</g:link></strong></p>
							<g:submitButton class="btn btn-lg btn-medium btn-crearcirculo" style="margin-left:43px;" name="Eliminar" />
						</g:form>
					</div>
				</g:each>
			</g:if>
			<g:else>
				<h4 style="margin-left:20px;">No hay circulos para mostrar</h4>
			</g:else>
		</div>

	</div>

</body>
</html>