<html>
<head>
	<title>Ver Perfil - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-8" style="margin-left:20px;">
			<h1>Perfil de ${perfil.nombre}</h1>
			<br />
			<div>
				<p>Nombre: ${perfil.nombre}</p>
				<p>Apellido: ${perfil.apellido}</p>
				<p>Email: ${perfil.email}</p>
				<p>Localidad: ${perfil.localidad}</p>
				<p>Pais: ${perfil.pais}</p>
				<br />
			</div>

			<g:form action="edit" id="${perfil.id}">
				<g:submitButton name="Editar"/>
			</g:form>
			<br />
			<g:form action="index"> <!-- Modificar esto para que vaya al show de usuario -->
				<g:submitButton name="Volver"/>
			</g:form>
		</div>
	</div>
</body>
</html>