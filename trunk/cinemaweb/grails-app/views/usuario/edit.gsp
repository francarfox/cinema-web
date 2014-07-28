<html>
<head>
	<title>Editar Usuario - CinemaWeb</title>
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

		<h1 style="margin-left:30px;">Editando Usuario ${session.loggedUserNombre}</h1>
	   	<div class="col-md-5">
			<g:form action="actualizar" id="${session.loggedUser}">
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
				<input type="hidden" name="submit" value="1">
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Editar"/>
			</g:form>
		</div>
		<br />
	</div>
</body>
</html>