<html>
<head>
	<title>Editar Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		
			<h1>Crear Circulo</h1>
	        <div class="col-md-5">
			<g:form action="armar">
				<h2 style="text-align:center;">Datos Circulo</h2>
				<div class="form-group">
					<label for="nombre">Nombre</label>
					<g:field class="form-control" type="text" name="nombre" />
				</div>
				<div class="form-group">
					<label for="tags">Tag</label>
					<g:select from="${['Acción', 'Thriller‎', 'Drama', 'Suspenso', 'Terror', 'Infantil', 'Arte Marcial', 'Aventura', 'Biógrafica', 'Adulta', 'Cómica', 'Catástrofe', 'Deportiva', 'Documental', 'Fantastica', 'Guerra', 'Historia', 'Musical', 'Policial', 'Romantica', 'Western']}" class="form-control" name="tags" />
				</div>
				<br />
				<g:submitButton class="btn btn-lg btn-login btn-block" name="Crear"/>
			</g:form>
			</div>
			<br />
	</div>
</body>
</html>