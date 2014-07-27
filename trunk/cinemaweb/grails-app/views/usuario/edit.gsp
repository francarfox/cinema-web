<html>
<head>
	<title>Editar Usuario - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<h1 style="margin-left:30px;">Editando Usuario ${usuario.userId}</h1>
	   	<div class="col-md-5">
			<g:form action="actualizar" id="${usuario.id}">
				<h2 style="text-align:center;">Datos Usuario</h2>
				<div class="form-group">
					<label for="password">Password *</label>
					<g:passwordField name="password" class="form-control" value="${usuario.password}" />
				</div>
				<div class="form-group">
					<label for="passwordV">Confirmar Password *</label>
					<g:passwordField name="passwordV" class="form-control" value="${usuario.passwordV}" />
				</div>
				<br />
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Editar"/>
			</g:form>
		</div>
		<br />
	</div>
</body>
</html>