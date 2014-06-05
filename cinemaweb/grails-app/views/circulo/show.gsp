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
	        <g:hasErrors bean="${circulo}">
	            <div id="message_error">
	                <g:renderErrors bean="${circulo}" as="list" />
	            </div>
	        </g:hasErrors>

		<div class="row">
			<div class="col-md-8">
				<h1>Circulo de ${circulo.nombre}</h1>
			</div>
			<div class="col-md-4" style="margin-top:40px;">
				<g:form action="#" style="float:right">
					<g:field type="text" placeholder="Buscar Circulos" class="form-control form-busqueda" name="busquedacirculo" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
				</g:form>
			</div>
		</div>

		<div>
			<table class="table">
				<thead>
				<tr>
					<td><h2 style="text-align:center;color:#ffcc00;">Comentarios</h2></td>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height:300px"></td>
					</tr>
				</tbody>
			</table>
			<table class="table">
				<thead>
					<tr>
						<td><h2 style="text-align:center;color:#ffcc00;">Postear un comentario</h2></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height:100px;">
							<g:form action="#">
								<g:field type="textarea" name="enviarcomentario" style="width:1050px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
								<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
							</g:form>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="background-color:#F1C308;margin:0 auto 0 auto;">
				<thead>
					<tr>
						<td>
							<g:link action="desunirse" id="${circulo.id}" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-external-link"></i> Desunirme</g:link>
						</td>
						<td>&nbsp</td>
						<td>
							<g:link action="indexusuario" id="${session.usuario.id}" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-comments"></i> Mis Círculos</g:link>
						</td>
						<td>&nbsp</td>
						<td>
							<g:link action="index" class="btn btn-lg btn-large btn-crearcirculo"><i class="fa fa-list"></i> Círculos</g:link>
						</td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>
</html>