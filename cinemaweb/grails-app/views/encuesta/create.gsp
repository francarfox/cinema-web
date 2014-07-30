<html>
<head>
	<title>Crear encuesta - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
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

			<h1>Crear Encuesta</h1>
	        <div class="col-md-5">
			<g:form action="armar" id="${params.id}">
				<h2 style="text-align:center;">Datos Encuesta</h2>
				<div class="form-group">
					<label for="nombre">Nombre</label>
					<g:field class="form-control" type="text" name="titulo" />
				</div>
				<div class="form-group">
					<label for="nombre">Opción 1</label>
					<g:field class="form-control" type="text" name="opc0" />
				</div>
				<div class="form-group">
					<label for="nombre">Opción 2</label>
					<g:field class="form-control" type="text" name="opc1" />
				</div>
				<div class="form-group">
					<label for="nombre">Opción 3</label>
					<g:field class="form-control" type="text" name="opc2" />
				</div>
				<div class="form-group">
					<label for="nombre">Opción 4</label>
					<g:field class="form-control" type="text" name="opc3" />
				</div>	
				<br />
				<input type="hidden" name="submit" value="1">
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Crear"/>
			</g:form>
			</div>
			<br />
	</div>
</body>
</html>