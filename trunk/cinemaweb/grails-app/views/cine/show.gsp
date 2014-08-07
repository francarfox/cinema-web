<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema web - Cine</title>
	<style type="text/css">
	.col-md-6{margin: 0px;}
	h4{margin-bottom: 10px}
	</style>
</head>
<body>
	<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-12">
				<h3><i class="fa fa-video-camera"></i> Cine: #${cine.id} - ${cine.nombre}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12" id="data-display">
						<div class="row">
							<div class="col-md-3"><b>Nombre:</b></div>
							<div class="col-md-9">${cine.nombre}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Ubicacion:</b></div>
							<div class="col-md-9">${cine.ubicacion}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Precion Base:</b></div>
							<div class="col-md-9">
								$ ${cine.precioBase}	
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Apertura:</b></div>
							<div class="col-md-9">
								${cine.apertura}
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Cierre:</b></div>
							<div class="col-md-9">
								${cine.cierre}
							</div>
						</div>	
					</div>
				</div>

		<g:if test="${!cine.salas.isEmpty()}">
			<div class="row">
				<div class="col-md-6">
					<h4>Salas:</h4>
					<table class="table table-bordered table-stripped" id="table-list">
						<thead>
							<tr>
								<th>Nombre</th>
								<th class="adjust-to-content">Asientos</th>
							</tr>	
						</thead>
						<tbody>
							<g:each in="${cine.salas}" var="sala">
							<tr>
								<td><g:link controller="sala" action="show" id="${sala.id}" target="_blank"> ${sala.nombre}</g:link></td>
								<td class="text-center">${(sala.asientos) ? sala.asientos.size() : "0"}</td>
							</tr>
							</g:each>
						</tbody>
					</table>
				</div>
			</div>	
		</g:if>
<br />

<!--Comentarios-->
<div class="col-md-12">
	<h3><i class="fa fa-comments-o"></i> Comentarios</h3>
</div>
<div id="Comentarios">
	<table class="table">
		<tbody>
			<tr>
				<td style="height:350px">
					<g:render template="comentarioTemp" collection="${cine.obtenerComentarios()}" var="comentario"/>
				</td>
			</tr>
		</tbody>
	</table>
	<g:if test="${session.loggedUser != null}">
		<table class="table">
			<td style="height:100px">
				<g:form action="comentar" id="${cine.id}">
					<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;margin-top:15px;color:black;" />
					<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
				</g:form>
			</td>
		</table>
	</g:if>
	<g:else>
		<h4 style="text-align:center;">Debe estar logueado para poder comentar | <g:link controller="usuario" action="login">Login</g:link></h4>
	</g:else>
</div>


</div>
<div class="col-md-4">
	<g:if test="${isAdminUser}">
	<div class="row">
		<div class="col-md-12">
			<div class="well" id="actions">
				<div class="row">
					<div class="col-md-6">
						<g:link action="edit" id="${cine.id}" ><i class="fa fa-edit"></i> Editar</g:link>
					</div>
					<div class="col-md-6">
						<g:link action="uploadPic" id="${cine.id}" ><i class="fa fa-file"></i> Cargar Foto</g:link>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
							<g:link action="index"><i class="fa fa-list"></i> Cines</g:link>
					</div>
					<div class="col-md-12">
							<g:link controller="promocion" action="mostrarPromosCine" id="${cine.id}"><i class="fa fa-list"></i> Promociones</g:link>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br />
	</g:if>
	
	<g:if test="${cine.foto}">
		<div class="row">
			<div class="col-md-12">
				<h3><i class="fa fa-file"></i> Foto</h3>	
				<g:img dir="/images/cinema-web/cines-pics" file="${cine.foto}" class="img-rounded show-img" />
			</div>
		</div>
	</g:if>
</div>
</div>
</div>
</body>
</html>