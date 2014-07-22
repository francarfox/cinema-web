<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Nueva Sala</title>
</head>
<body>
	<div class="container">
		<g:if test="${!cines.isEmpty()}">
		<g:if test="${errors}">
					<div class="row">
						<div class="col-md-6">
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
		<div class="row">
			<div class="col-md-8">
				<h4>Nueva Sala</h4>
				<g:form action="create" class="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-md-2 col-sm-2 control-label">Nombre:</label>
					<div class="col-md-4">
						<input name="nombre" class="form-control" id="name" value="${data.nombre}">
					</div>
				</div>
				<div class="form-group">
					<label for="cine" class="col-md-2 col-sm-2 control-label">Cine:</label>
					<div class="col-md-4">
						<g:select name="cine" from="${cines}" optionKey="id" optionValue="nombre" class="form-control" value="${data.cine}"/>
					</div>
				</div>
				<div class="form-group">
					<label for="fila" class="col-md-2 col-sm-2 control-label">Filas:</label>
					<div class="col-md-2">
						<g:select name="filas" from="${1..15}" value="${data.filas}" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<label for="columna" class="col-md-2 col-sm-2 control-label">Columnas:</label>
					<div class="col-md-2">
						<g:select name="columnas" from="${1..20}" value="10" class="form-control" value="${data.columnas}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-2 col-md-offset-2">
						<input type="hidden" name="submit" value="1">
						<g:link controller="sala" action="index" class="btn btn-default btn-block">Volver</g:link>
					</div>
					<div class="col-sm-10 col-md-2">
						<button type="submit" class="btn btn-primary btn-block">Crear</button>
					</div>
				</div>
			</g:form>
		</div>	
	</div>
	</g:if>
	<g:else>
		<div class="row">
			<div class="col-md-6">
				<div class="alert alert-danger">
					No hay cines creados
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-2">
					<g:link controller="sala" action="index" class="btn btn-default btn-block">Volver</g:link>
			</div>	
		</div>	
	</g:else>
</div>	
</body>
</html>