<html>
<head>
	<title>Crear Usuario</title>
</head>
<body>
	<h1>Crear Usuario</h1>
	<g:form action="crearNuevo">
		Nombre: <g:field type="text" name="nombre"/></br>
		Apellido: <g:field type="text" name="apellido"/></br>
		Email: <g:field type="text" name="email"/></br>
		UserId: <g:field type="text" name="userId"/></br>
		Password: <g:field type="text" name="password"/></br>
		PasswordV: <g:field type="text" name="passwordV"/></br>
		<g:submitButton name="Crear"/>
	</g:form>
</body>
</html>