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
			  <li><a href="#" class="active"><span>USUARIO</span></a></li>
			  <li><a href="#"><span>PERFIL</span></a></li>
			  <li><a href="#"><span>CIRCULOS</span></a></li>
			  <li><a href="#"><span>COMENTARIOS</span></a></li>
			  <li><a href="#"><span>RESERVAS</span></a></li>
			</ul>
	   	</div>

		<div class="col-md-8" style="margin-left:20px;">
			<h1>Usuario de ${usuario.userId}</h1>

			<div>
				<!-- <p><img src="${createLink(controller:'perfil', action:'imagen', id: usuario.perfil.id)}"/></p> -->
				<p>Usuario: ${usuario.userId}</p>
				<p>Password: ${usuario.password}</p>
				<p>Usuario desde: ${usuario.cuentaCreada}</p>
				<br />
					<g:form controller="perfil" action="show" id="${usuario.id}">
						<g:submitButton name="Ver Perfil"/>
					</g:form>
			</div>
			<br />

			<g:form action="edit" id="${usuario.id}">
				<g:submitButton name="Editar Cuenta"/>
			</g:form>
			<br />
			<g:form action="eliminar" id="${usuario.id}">
				<g:submitButton name="Eliminar Cuenta"/>
			</g:form>
			<br />
			<g:form action="index">
				<g:submitButton name="Volver"/>
			</g:form>
		</div>
	</div>
</body>
</html>