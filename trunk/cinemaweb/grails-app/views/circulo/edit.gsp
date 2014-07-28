<html>
<head>
	<title>Editar Circulo - CinemaWeb</title>
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
		
			<h1>Editar Circulo ${circulo.nombre}</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>

	        <div class="col-md-5">
			<g:form action="actualizar" id="${circulo.id}">
				<h2 style="text-align:center;">Datos Circulo</h2>
				<div class="form-group">
					<label for="nombre">Nombre</label>
					<g:field class="form-control" type="text" name="nombre" value="${circulo.nombre}" />
				</div>
				<div class="form-group">
					<label for="tags">Tag</label>
					<g:select from="${['Acción', 'Thriller‎', 'Drama', 'Suspenso', 'Terror', 'Infantil', 'Arte Marcial', 'Aventura', 'Biógrafica', 'Adulta', 'Cómica', 'Catástrofe', 'Deportiva', 'Documental', 'Fantastica', 'Guerra', 'Historia', 'Musical', 'Policial', 'Romantica', 'Western']}" class="form-control" name="tags" value="${circulo.tags}" />
				</div>
				<br />
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Editar"/>
			</g:form>
			</div>
			<br />
	</div>
</body>
</html>