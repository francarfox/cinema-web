<html>
<head>
	<title>Editar Perfil - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

			<g:if test="${messageV}">
			   	<div id="message_val">${messageV}</div>
			</g:if>

			<div class="col-md-8" style="margin-left:20px;">
				<h1>Editando perfil </h1>
				<br />

				<g:if test="${message}">
		    		<div id="message_error">${message}</div>
		        </g:if>
				<g:hasErrors bean="${perfil}">
					<div id="message_error">
						<g:renderErrors bean="${perfil}" as="list" />
					</div>
				</g:hasErrors>
				
				<g:form action="actualizar" id="${perfil.id}">
			
					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Nombre *</label>
						<div class="col-md-4">
							<input name="nombre" class="form-control" id="name" value="${perfil.nombre}">
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Apellido *</label>
						<div class="col-md-4">
							<input name="apellido" class="form-control" id="name" value="${perfil.apellido}">
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Email *</label>
						<div class="col-md-4">
							<input name="email" class="form-control" id="name" value="${perfil.email}">
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Localidad</label>
						<div class="col-md-4">
							<input name="localidad" class="form-control" id="name" value="${perfil.localidad}">
						</div>
					</div>

					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Pais</label>
						<div class="col-md-4">
							<input name="pais" class="form-control" id="name" value="${perfil.pais}">
						</div>
					</div>

					<br />
					<g:submitButton name="Editar" style="margin-left:20px;" />
					
				</g:form>

				<br />
				<br />
				<g:form action="index"> <!-- Modificar esto para que vaya al show de usuario -->
					<g:submitButton name="Volver"/>
				</g:form>

			</div>

	</div>
</body>
</html>