<html>
	<head>
		<meta name="layout" content="bootstrap-main"/>
		<title>Cinema Web - Reserva - Paso Tres</title>
		<style>
			div#feedback-container{
				margin: 20px auto;
				float: none;
				padding: 15px;
				background-color: #BD1133;
				color:#F1C308;
				border-radius: 5px;
			}
			div#feedback-container h3{
				font-weight: bold;
			}

			div#feedback-container p{
				color:#F1C308;
			}
		</style>
	</head>
	<body>
		<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-6" id="feedback-container">
				<h3>¡Gracias por reservar con Cinema Web!</h3>
				<p>Su codigo de reserva es ${reserva.reserva_key}.</p>
				<p>Presentelo en la boletería para obtener sus entradas.</p>
				<div class="row" style="margin-left:0px">
					<div class="col-md-6" style="margin-left:0px">
						<g:link action="index" controller="home" class="btn btn-warning btn-block">Ir a la pagina principal</g:link>
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>