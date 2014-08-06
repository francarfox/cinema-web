<html>
<head>
	<title>Ver Usuario - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		
			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>
	        <g:if test="${messageV}">
		    	<div id="message_val">${messageV}</div>
		    </g:if>
	        <g:hasErrors bean="${usuario}">
	            <div id="message_error">
	                <g:renderErrors bean="${usuario}" as="list" />
	            </div>
	        </g:hasErrors>

	    
	   	<div class="col-md-3" style="margin-top:30px;padding:0;margin-left:20px;">
	   		<div class="row">
				<div class="col-md-12">
					<g:if test="${perfil.foto}">
						<g:img dir="/images/cinema-web/perfil-pics" file="${perfil.foto}" class="img-rounded show-img" />
						<g:if test="${ session.loggedUserNombre == usuario.userId }">
							<g:link controller="perfil" action="uploadPic" class="btn btn-lg btn-medium btn-crearcirculo" id="${perfil.id}" style="margin-bottom:10px;"><i class="fa fa fa-camera"></i> Editar Foto</g:link>
						</g:if>
					</g:if>
				</div>
			</div>
	   	</div>


	   	<div class="col-md-4" style="margin-left:120px;margin-right:50px;">
			<h1>Usuario de ${perfil.nombre}</h1>
			<div style="margin-top:20px;">
				<p><strong>Usuario</strong>: ${usuario.userId}</p>
				<p><strong>Usuario desde</strong>: ${usuario.cuentaCreada}</p>
				</div>
				<br />

				<g:if test="${ session.loggedUserNombre == usuario.userId }">
					<g:link action="edit" class="btn btn-lg btn-large btn-crearcirculo" id="${usuario.id}"><i class="fa fa fa-pencil-square-o"></i> Editar Usuario</g:link>
					<g:link action="eliminar" class="btn btn-lg btn-large btn-crearcirculo" id="${usuario.id}"><i class="fa fa-ban"></i> Eliminar Cuenta</g:link>
				</g:if>
			<br />
			<div style="margin-top:30px;">
				<p><strong>Nombre</strong>: ${perfil.nombre}</p>
				<p><strong>Apellido</strong>: ${perfil.apellido}</p>
				<p><strong>Email</strong>: ${perfil.email}</p>
				<p><strong>Localidad</strong>: ${perfil.localidad}</p>
				<p><strong>Pais</strong>: ${perfil.pais}</p>
				<br />
			</div>

			<g:if test="${ session.loggedUserNombre == usuario.userId }">
				<g:link controller="perfil" action="edit" class="btn btn-lg btn-large btn-crearcirculo" style="margin-left:80px;" id="${perfil.id}"><i class="fa fa fa-pencil-square-o"></i> Editar Perfil</g:link>
			</g:if>
		</div>
		
		<!-- <g:if test="${ session.loggedUserNombre == usuario.userId }">
		<div class="col-md-3" style="margin-top:30px;padding:0;">
			<div class="row">
	   			<ul class="menu">
			  		<li><g:link class="active" controller="usuario" action="show" id="${session.loggedUser}"><span>USUARIO</span></g:link></li>
			  		
			  		<li><g:link controller="circulo" action="index" id="${session.loggedUser}" params="[accion:'miscirculos']"><span>CIRCULOS</span></g:link></li>
			  		<li><g:link controller="comentario" action="indexusuario" id="${session.loggedUser}"><span>COMENTARIOS</span></g:link></li>
			  		<li><a href="#"><span>RESERVAS</span></a></li>
			  		<li><a href="#"><span>PROMOCIONES</span></a></li>
				</ul>
			</div>
		</div>
		</g:if> -->
	</div>
</body>
</html>