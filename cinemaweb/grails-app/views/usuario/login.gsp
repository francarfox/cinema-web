<html>
<head>
	<title>Login - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<g:if test="${messageV}">
		   	<div id="message_val">${messageV}</div>
		</g:if>
		<g:if test="${message}">
    		<div id="message_error" style="display: block">${message}</div>
        </g:if>
		<g:hasErrors bean="${usuario}">
			<div id="message_error">
				<g:renderErrors bean="${usuario}" as="list" />
			</div>
		</g:hasErrors>

		<div class="col-md-3">
		</div>

		<div class="col-md-6">
			<g:form action="validar" class="form-signin">
				<table id="tableUsuario">
					<tr>
						<td colspan="2"><h2 class="text-center">Login</h2></td>
					</tr>
					<tr>
						<td><g:field type="text" class="form-control" placeholder="Usuario" name="userId" /></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<td><g:passwordField name="password" class="form-control" placeholder="Password" /></td>
					</tr>
					<tr>
						<td colspan="2"><br /></td>
					</tr>
					<tr align="center">
						<td><g:submitButton class="btn btn-lg btn-login btn-block" name="Iniciar Sesión"/></td>
					</tr>
					<tr>
						<td><hr style="border-top: 1px solid black;"></td>
					</tr>
					<tr>
						<td><p style="color:#BD1133;font-size:11px;text-align:center">¿No dispones de una cuenta CinemaWeb? <g:link controller="usuario" action="create">Registrate ahora</p></g:link></td>
					</tr>
				</table>
			</g:form>
		</div>
	</div>
</body>
</html>