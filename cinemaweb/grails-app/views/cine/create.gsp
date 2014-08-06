<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Nuevo Cine</title>
</head>
<body>
	<div class="container" id="container-simple">
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
				<h2><i class="fa fa-video-camera"></i> Nuevo Cine</h2>
				<g:form action="${action}" id="${id}" class="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-md-2 col-sm-2 control-label">Nombre:</label>
					<div class="col-md-4">
						<input name="nombre" class="form-control" id="name" value="${data.nombre}">
					</div>
				</div>
				<div class="form-group">
					<label for="ubicacion" class="col-md-2 col-sm-2 control-label">Ubicacion:</label>
					<div class="col-md-4">
						<input name="ubicacion" class="form-control" id="ubicacion" value="${data.ubicacion}">
					</div>
				</div>
				<div class="form-group">
					<label for="precio" class="col-md-2 col-sm-2 control-label">Precio Base:</label>
					<div class="col-md-2">
						<input name="precioBase" class="form-control" id="precio" value="${data.precioBase}">
					</div>
				</div>
				<div class="form-group">
					<label for="apertura" class="col-md-2 col-sm-2 control-label">Apertura:</label>
					<div class="col-md-2">
						<g:select name="apertura" class="form-control" from="${hours}" value="${data.apertura}" />
					</div>
				</div>
				<div class="form-group">
					<label for="cierre" class="col-md-2 col-sm-2 control-label">Cierre:</label>
					<div class="col-md-2">
						<g:select name="cierre" class="form-control" from="${hours}" value="${data.cierre}" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-md-2 col-md-offset-2">
						<input type="hidden" name="submit" value="1">
						<g:link controller="cine" action="${back.action}" id="${back.id}" class="btn btn-default btn-medium btn-block">Volver</g:link>
					</div>
					<div class="col-sm-10 col-md-2">
						<button type="submit" class="btn btn-login btn-medium btn-block">Crear</button>
					</div>
				</div>
			</g:form>
		</div>	
	</div>	
</div>	
</body>
</html>