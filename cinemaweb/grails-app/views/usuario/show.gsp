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

	   	<div class="col-md-3" style="margin-top:30px;padding:0;">
	   		<ul class="menu">
			  <li><g:link class="active" controller="usuario" action="show" id="${session.loggedUser}"><span>USUARIO</span></g:link></li>
			  <li><g:link controller="perfil" action="show" id="${session.loggedUser}"><span>PERFIL</span></g:link></li>
			  <li><g:link controller="circulo" action="indexusuario" id="${session.loggedUser}"><span>CIRCULOS</span></g:link></li>
			  <li><g:link controller="comentario" action="indexusuario" id="${session.loggedUser}"><span>COMENTARIOS</span></g:link></li>
			  <li><a href="#"><span>RESERVAS</span></a></li>
			</ul>
	   	</div>

		<div class="col-md-8" style="margin-left:20px;">
			<h1>Usuario de ${usuario.userId}</h1>
			<br />
			<div>
				<!-- <p><img src="${createLink(controller:'perfil', action:'imagen', id: usuario.perfil.id)}"/></p> -->
				<p><strong>Usuario</strong>: ${usuario.userId}</p>
				<p><strong>Password</strong>: ${usuario.password}</p>
				<p><strong>Usuario desde</strong>: ${usuario.cuentaCreada}</p>
			</div>
			<br />

			<g:if test="${ session.loggedUser == usuario.userId }">
				<g:link action="edit" class="btn btn-lg btn-large btn-crearcirculo" id="${usuario.id}"><i class="fa fa fa-pencil-square-o"></i> Editar Usuario</g:link>
				<g:link action="eliminar" class="btn btn-lg btn-large btn-crearcirculo" id="${usuario.id}"><i class="fa fa-ban"></i> Eliminar Cuenta</g:link>
			</g:if>
		</div>
	</div>
</body>
</html>