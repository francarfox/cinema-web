<html>
<head>
	<title>Editar Perfil - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<h1 style="margin-left:30px;">Editando perfil de ${perfil.nombre}</h1>
	   	<div class="col-md-5">
			<g:form action="actualizar" id="${perfil.id}">
				<h2 style="text-align:center;">Datos Perfil</h2>
				<div class="form-group">
					<label for="name">Nombre *</label>
					<input name="nombre" class="form-control" id="name" value="${perfil.nombre}">
				</div>
				<div class="form-group">
					<label for="name">Apellido *</label>
					<input name="apellido" class="form-control" id="name" value="${perfil.apellido}">
				</div>
				<div class="form-group">
					<label for="name">Email *</label>
					<input name="email" class="form-control" id="name" value="${perfil.email}">
				</div>
				<div class="form-group">
					<label for="name">Localidad</label>
					<input name="localidad" class="form-control" id="name" value="${perfil.localidad}">
				</div>
				<div class="form-group">
					<label for="name">Pais</label>
					<g:countrySelect name="pais" class="form-control" noSelection="['':'Selecciona tu pais']" value="${perfil.pais}"/>
				</div>
				<br />
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Editar"/>
			</g:form>
		</div>
		<br />
	</div>
</body>
</html>