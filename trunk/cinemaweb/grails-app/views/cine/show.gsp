<html>
<head>
	<title>${cine.nombre}</title>
</head>
<body>
	<h1>${cine.nombre}</h1>
	<g:form action="comentar" id="${cine.id}">
		Comentario: 
		<g:field type="text" name="mensaje"/>
		<g:submitButton name="Comentar"/>
	</g:form>

	<div>
		<g:each in="${comentarios}" var="comentario">
			<li>
				<g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.autor}:</g:link>
				 ${comentario.mensaje} [${comentario.fecha}]
			</li>
		</g:each>
	</div>

	<g:form action="index">
		<g:submitButton name="Volver"/>
	</g:form>
</body>
</html>