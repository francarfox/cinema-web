<html>
<head>
	<title>Perfil</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-8">
			<h1 style="margin-left:20px;">Perfil de ${perfil.nombre}</h1>

			<div style="margin-left:20px;">
				<p>Nombre: ${perfil.nombre}</p>
				<p>Apellido: ${perfil.apellido}</p>
				<p>Email: ${perfil.email}</p>
				<p>Localidad: ${perfil.localidad}</p>
				<p>Pais: ${perfil.pais}</p>
				<br />
			</div>

			<g:form style="margin-left:20px;" action="index">
				<g:submitButton name="Volver"/>
			</g:form>
			<br />
			<!-- <g:form style="margin-left:20px;" action="update">
				<g:submitButton name="Editar"/>
			</g:form> -->
		</div>
	</div>
</body>
</html>