<html>
<head>
	<title>Crear Usuario · CinemaWeb</title>
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

		<div class="col-md-5">
			<g:form action="registrar">
				<h2 style="text-align:center;">Datos Usuario</h2>
				<div class="form-group">
					<label for="userId">Usuario *</label>
					<g:field type="text" class="form-control" name="userId" />
				</div>
				<div class="form-group">
					<label for="rol">Tipo de Usuario</label>
					<g:select from="${['USER', 'ADMIN']}" class="form-control" name="rol"/>
				</div>
				<div class="form-group">
					<label for="password">Password *</label>
					<g:passwordField class="form-control" name="password"/>
				</div>
				<div class="form-group">
					<label for="passwordV">Confirmar Password *</label>
					<g:passwordField class="form-control" name="passwordV"/>
				</div>
				<br />
				<h2 style="text-align:center;">Datos Personales</h2>
				<div class="form-group">
					<label for="nombre">Nombre *</label>
					<g:field type="text" class="form-control" name="nombre" />
				</div>
				<div class="form-group">
					<label for="apellido">Apellido *</label>
					<g:field type="text" class="form-control" name="apellido" />
				</div>
				<!--<div class="form-group">
					<label for="foto">Foto</label>
					<input type="file" class="form-control" name="foto" />
				</div>-->
				<div class="form-group">
					<label for="email">Email *</label>
					<g:field type="text" class="form-control" name="email" />
				</div>
				<div class="form-group">
					<label for="localidad">Localidad</label>
					<g:field type="text" class="form-control" name="localidad" />
				</div>
				<div class="form-group">
					<label for="pais">Pais</label>
					<g:countrySelect name="pais" class="form-control" noSelection="['':'Selecciona tu pais']"/>
				</div>
				<br />
				<input type="hidden" name="submit" value="1">
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Registrar"/>
			</g:form>		
		</div>
	</div>
</body>
</html>