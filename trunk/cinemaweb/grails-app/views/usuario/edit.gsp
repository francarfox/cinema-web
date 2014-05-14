<html>
<head>
	<title>Editar Usuario - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-10">
			<h1>Editar Usuario ${usuario.userId}</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>

			<g:form action="actualizar" id="${usuario.id}">
				<table id="tableUsuario">
					<tr>
						<td colspan="2"><h2>Datos Usuario</h2></td>
					</tr>
					<tr>
						<td><label for="password">Password *</label></td>
						<td><g:passwordField name="password" value="${usuario.password}" /></td>
					</tr>
					<tr>
						<td><label for="passwordV">Confirmar Password *</label></td>
						<td><g:passwordField name="passwordV" value="${usuario.passwordV}" /></td>
					</tr>

					<tr>
						<td colspan="2"><br /></td>
					</tr>
					<tr align="center">
						<td colspan="2" style="text-align:center"><g:submitButton name="Editar"/></td>
					</tr>
				</table>
			</g:form>
			<p>
				<g:form action="index" style="margin-left:20px">
					<g:submitButton name="Volver"/>
				</g:form>
			</p>
		</div>
	</div>
</body>
</html>