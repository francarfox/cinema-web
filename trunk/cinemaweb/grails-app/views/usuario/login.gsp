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

		<div class="col-md-10">
			<h1>Loguear Usuario</h1>

			<g:if test="${message}">
    			<div id="message_error" style="display: block">${message}</div>
        	</g:if>
			<g:hasErrors bean="${usuario}">
				<div id="message_error">
					<g:renderErrors bean="${usuario}" as="list" />
				</div>
			</g:hasErrors>

			<g:form action="validar">
				<table id="tableUsuario">
					<tr>
						<td colspan="2"><h2>Datos Usuario</h2></td>
					</tr>
					<tr>
						<td><label for="userId">Usuario</label></td>
						<td><g:field type="text" name="userId" value="" /></td>
					</tr>
					<tr>
						<td><label for="password">Password</label></td>
						<td><g:passwordField name="password" value="" /></td>
					</tr>

					<tr>
						<td colspan="2"><br /></td>
					</tr>
					<tr align="center">
						<td colspan="2" style="text-align:center"><g:submitButton name="Login"/></td>
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