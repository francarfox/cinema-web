<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Editar Sala</title>
</head>
<body>
	<div class="container">
		<g:if test="${errors}" >
					<div class="row">
						<div class="col-md-12">
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
				<h4>Sala #${salaID} - ${data.nombre}</h4>
				<g:form action="edit" id="${salaID}" class="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-md-2 col-sm-2 control-label">Nombre:</label>
					<div class="col-md-4">
						<input name="nombre" class="form-control" id="name" value="${data.nombre}">
					</div>
				</div>
				<div class="form-group">
					<label for="cine" class="col-md-2 col-sm-2 control-label">Cine:</label>
					<div class="col-md-4">
						<g:select name="cine" from="${cines}" value="${data.cine}" optionKey="id" optionValue="nombre" class="form-control"/>
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
						<g:select name="columnas" from="${1..20}" value="${data.columnas}" class="form-control"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-2 col-md-offset-2">
						<input type="hidden" name="submit" value="1">
						<g:link controller="sala" action="show" id="${salaID}" class="btn btn-default btn-block">Volver</g:link>
					</div>
					<div class="col-sm-10 col-md-2">
						<button type="submit" class="btn btn-primary btn-block">Editar</button>
					</div>
				</div>
			</g:form>
		</div>	
	</div>	
</div>	
</body>
</html>