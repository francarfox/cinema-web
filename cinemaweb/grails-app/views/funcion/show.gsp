<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema web - Funcion</title>
	<style type="text/css">
	.col-md-6{margin: 0px;}
	h4{margin-bottom: 10px}
	</style>
</head>
<body>
	<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-12">
				<h3>Funcion: #${funcion.id} - ${funcion.nombre}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12" id="data-display">
						<div class="row">
							<div class="col-md-3"><b>Nombre:</b></div>
							<div class="col-md-9">${funcion.nombre}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Pelicula:</b></div>
							<div class="col-md-9">${funcion.pelicula.titulo}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Cine:</b></div>
							<div class="col-md-9">
								${funcion.cine.nombre}	
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Sala:</b></div>
							<div class="col-md-9">
								${funcion.sala.nombre}
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Horario:</b></div>
							<div class="col-md-9">
								${funcion.horario} hs
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Precio:</b></div>
							<div class="col-md-9">
								$ ${funcion.precio}
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Desde:</b></div>
							<div class="col-md-9">
								${funcion.desde}
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Hasta:</b></div>
							<div class="col-md-9">
								${funcion.hasta}
							</div>
						</div>	
					</div>
				</div>

</div>
<div class="col-md-4">
	<div class="row">
		<div class="col-md-12">
			<div class="well" id="actions">
				<h4><b>Actions</b></h4>	
				<div class="row">
					<div class="col-md-6">
						<g:link action="edit" id="${funcion.id}" ><i class="fa fa-edit"></i> Editar</g:link>
					</div>
					<div class="col-md-6">
						<g:link action="index"><i class="fa fa-list"></i> Funciones</g:link>
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