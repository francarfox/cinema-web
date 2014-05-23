<html>
<head>
	<title>Ver Circulo - CinemaWeb</title>
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

		<div class="col-md-8" style="margin-left:20px;">
			<h1>Circulo ${circulo.nombre}</h1>

			<div>
				<p>Nombre: ${circulo.nombre}</p>
				<p>Tags: ${circulo.tags}</p>
				<p>Usuarios participantes: 
					<g:each in="${circulo.usuarios}" var="usuario">
						<!-- <g:link controller:"usuario" action="show" id="${usuario.id}">${usuario.userId}</g:link> | -->
						${usuario.userId} |
					</g:each>
				</p>
				<br />
				<hr style="border-top: 1px solid black;">
				<p> Comentarios: </p>
				<br />
				<hr style="border-top: 1px solid black;">
			</div>
			<br />

			<g:form action="edit">
				<g:submitButton name="Editar Circulo"/>
			</g:form>
			<br />
			<g:form action="delete">
				<g:submitButton name="Eliminar Circulo"/>
			</g:form>
			<br />
			<g:form action="index">
				<g:submitButton name="Volver"/>
			</g:form>
		</div>
	</div>
</body>
</html>