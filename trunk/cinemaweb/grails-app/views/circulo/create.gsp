<html>
<head>
	<title>Crear Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<g:if test="${messageV}">
		   	<div id="message_val">${messageV}</div>
		</g:if>

		<div class="col-md-10">
			<h1>Crear Circulo de Amistad</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>
			<g:hasErrors bean="${circulo}">
				<div id="message_error">
					<g:renderErrors bean="${circulo}" as="list" />
				</div>
			</g:hasErrors>

			<g:form action="armar">
			<table id="tableUsuario">
				<tr>
					<td colspan="2"><h2>Datos Circulo</h2></td>
				</tr>
				<tr>
					<td><label for="nombre">Nombre *</label></td>
					<td><g:field type="text" name="nombre"/></td>
				</tr>
				<tr>
					<td><label for="tags">Tags *</label></td>
					<td><g:select multiple="multiple" from="${['Acción', 'Thriller‎', 'Drama', 'Suspenso', 'Terror', 'Infantil', 'Artes Marciales', 'Aventura', 'Biógraficas', 'Adultas', 'Cómicas', 'Catástrofes', 'Deportivas', 'Documentales', 'Fantasticas', 'Guerra', 'Historia', 'Musicales', 'Policiales', 'Romanticas', 'Western']}" name="tags"/></td>
				</tr>
				<tr>
					<td colspan="2"><br /></td>
				</tr>
				<tr align="center">
					<td colspan="2" style="text-align:center"><g:submitButton name="Crear"/></td>
				</tr>
			</g:form>
			</table>
			<p>
				<g:form action="index" style="margin-left:20px">
					<g:submitButton name="Volver"/>
				</g:form>
			</p>
		</div>
	</div>
</body>
</html>