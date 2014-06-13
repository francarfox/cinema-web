<html>
<head>
	<title>Ver Perfil - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<g:if test="${messageV}">
		   	<div id="message_val">${messageV}</div>
		</g:if>
		<g:if test="${message}">
	    	<div id="message_error">${message}</div>
	    </g:if>

		<div class="col-md-3" style="margin-top:30px;padding:0;">
	   		<ul class="menu">
			  <li><g:link controller="usuario" action="show" id="${session.usuario.id}"><span>USUARIO</span></g:link></li>
			  <li><g:link class="active" controller="perfil" action="show" id="${session.usuario.id}"><span>PERFIL</span></g:link></li>
			  <li><g:link controller="circulo" action="indexusuario" id="${session.usuario.id}"><span>CIRCULOS</span></g:link></li>
			  <li><g:link controller="comentario" action="indexusuario" id="${session.usuario.id}"><span>COMENTARIOS</span></g:link></li>
			  <li><a href="#"><span>RESERVAS</span></a></li>
			</ul>
	   	</div>

		<div class="col-md-8" style="margin-left:20px;">
			<h1>Perfil de ${perfil.nombre}</h1>
			<br />
			<div>
				<!-- <p><img src="${createLink(controller:'perfil', action:'imagen', id: perfil.id)}"/></p> -->
				<p><strong>Nombre</strong>: ${perfil.nombre}</p>
				<p><strong>Apellido</strong>: ${perfil.apellido}</p>
				<p><strong>Email</strong>: ${perfil.email}</p>
				<p><strong>Localidad</strong>: ${perfil.localidad}</p>
				<p><strong>Pais</strong>: ${perfil.pais}</p>
				<br />
			</div>

			<g:link action="edit" class="btn btn-lg btn-large btn-crearcirculo" id="${perfil.id}"><i class="fa fa fa-pencil-square-o"></i> Editar Perfil</g:link>

		</div>
	</div>
</body>
</html>