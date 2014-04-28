<html>
<head>
	<title>Perfil</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
			<div class="col-md-8">
				<h1 style="margin-left:20px;">EDITANDO PERFIL</h1>
				
				<g:form action="edit" class="form-horizontal">
				<!-- <g:form url="[action:'registrar',controller:'usuario']"> </g:form>-->
				
					<div class="form-group">
						<label for="name" class="col-md-2 col-sm-2 control-label">Nombre:</label>
						<div class="col-md-4">
							<input name="nombre" class="form-control" id="name" value="${perfil.nombre}">
						</div>
					</div>

					
					<div class="col-sm-10 col-md-2">
						<g:submitButton name="Editar" class="btn btn-primary btn-block" />
					</div>
					
				</g:form>

			</div>

			<g:form style="margin-left:20px;" action="index">
				<g:submitButton name="Volver"/>
			</g:form>
	</div>
</body>
</html>