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
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>Cine: #${cine.id} - ${cine.nombre}</h3>
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

<!--Comentarios-->
<div id="Comentarios">
	<div class="col-md-12">
		<g:form action="comentar" id="${cine.id}">
			<div class="col-md-2">
			<g:submitButton name="Comentar" class="btn btn-primary btn-block"/>
			</div>
			<g:field type="text" name="mensaje"/>
		</g:form>
	</div>

	<g:render template="comentarioTemp" collection="${cine.comentarios}" var="comentario"/>
</div>

</div>
<div class="col-md-4">
	<div class="row">
		<div class="col-md-12">
			<div class="well" id="actions">
				<h4><b>Actions</b></h4>	
				<div class="row">
					<div class="col-md-12">
						<g:link action="edit" id="${cine.id}" ><i class="fa fa-edit"></i> Editar</g:link>
					</div>
				</div>
				<div class="row">
				<div class="col-md-12">
						<g:link action="index"><i class="fa fa-list"></i> Cines</g:link>
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>