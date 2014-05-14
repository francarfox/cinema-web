<html>
<head>
	<title>Crear Usuario - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<div class="col-md-10">
			<h1>Crear Usuario (sección Administrador)</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>
			<g:hasErrors bean="${usuario}">
				<div id="message_error">
					<g:renderErrors bean="${usuario}" as="list" />
				</div>
			</g:hasErrors>

			<g:form action="registrar">
			<table id="tableUsuario">
				<tr>
					<td colspan="2"><h2>Datos Usuario</h2></td>
				</tr>
				<tr>
					<td><label for="userId">Usuario *</label></td>
					<td><g:field type="text" name="userId"/></td>
				</tr>
				<tr>
					<td><label for="userId">Tipo de Usuario</label></td>
					<td><g:select from="${['USER', 'ADMIN', 'SUPERADMIN']}" name="rol"/></td>
				</tr>
				<tr>
					<td><label for="password">Password *</label></td>
					<td><g:passwordField name="password"/></td>
				</tr>
				<tr>
					<td><label for="passwordV">Confirmar Password *</label></td>
					<td><g:passwordField name="passwordV"/></td>
				</tr>

				<tr>
					<td colspan="2"><h2>Datos Personales</h2></td>
				</tr>
				<tr>
					<td><label for="nombre">Nombre *</label></td>
					<td><g:field type="text" name="nombre" /></td>
				</tr>
				<tr>
					<td><label for="apellido">Apellido *</label></td>
					<td><g:field type="text" name="apellido" /></td>
				</tr>
				<tr>
					<td><label for="email">Email *</label></td>
					<td><g:field type="text" name="email" /></td>
				</tr>
				<tr>
					<td><label for="localidad">Localidad</label></td>
					<td><g:field type="text" name="localidad" /></td>
				</tr>
				<tr>
					<td><label for="pais">Pais</label></td>
					<td><g:countrySelect name="pais" style="width:53%" noSelection="['':'Selecciona tu pais']"/></td>
				</tr>
				<tr>
					<td colspan="2"><br /></td>
				</tr>
				<tr align="center">
					<td colspan="2" style="text-align:center"><g:submitButton name="Registrar"/></td>
				</tr>
			</g:form>
			</table>
			<p>
				<g:form action="index" style="margin-left:20px">
					<g:submitButton name="Volver"/>
				</g:form>
			</p>
		</div>
	</div>
</body>
</html>