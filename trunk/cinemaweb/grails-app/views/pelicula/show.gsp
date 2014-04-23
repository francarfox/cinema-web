<html>
<head>
	<title>${pelicula.titulo}</title>
</head>
<body>
	<h1>${pelicula.titulo} (${pelicula.puntos})</h1>
	<div>
		<g:form action="puntuar" id="${pelicula.id}">
			<g:select name="puntos" from="${1..10}"/>
			<g:submitButton name="Puntuar"/>
		</g:form>
	</div>
	<div>
		<g:form action="comentar" id="${pelicula.id}">
			Comentario: 
			<g:field type="text" name="mensaje"/>
			<g:submitButton name="Comentar"/>
		</g:form>
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