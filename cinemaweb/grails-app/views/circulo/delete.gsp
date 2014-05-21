<html>
<head>
	<title>Eliminar Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-8" style="margin-left:20px;">
			<h1>Circulo eliminado</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>
        
			<br />
			<div>
				<h2>¡El circulo ha sido eliminado!</h2>
				<br />
			</div>

			<br />
			<g:form action="index">
				<g:submitButton name="Volver"/>
			</g:form>
		</div>
	</div>
</body>
</html>