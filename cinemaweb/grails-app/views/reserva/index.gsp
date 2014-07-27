<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Reservas </title>
	<style>
	.reserva-film h3{
		margin-bottom: 10px;
	}
	.reserva-film img{
		height: 300px;
	}
	</style>
	<script type="text/javascript">
	var decodedData = $('<div/>').html("${cinesData}").text();
	console.log(cinesData);
	var cinesData = $.parseJSON(decodedData);
	</script>
</head>
<body>
	<div class="container">
		<g:if test="${peliculas.size() == 0}"> 
		<div class="row">
	   			<div class="col-md-4">
	   				<div id="message_error">
	   					<b>No hay peliculas para reservar!</b><br>
	   					Intentalo mas tarde
	   				</div>
	   			</div>
	   		</div>
		</g:if>

		<g:else>
			<div class="row">
			<div class="col-md-12">
				<h3>Reservar una pelicula</h3>
			</div>
		</div>
		<div class="row">
		<g:each status="count" var="pelicula" in="${peliculas}">
				<g:if test="${(count % 4) == 0}">
					</div>
					<div class="row">
				</g:if>
				<div class="col-md-3 reserva-film">
					<div class="row">
						<div class="col-md-12">
							<h3 class="text-center">${pelicula.titulo}</h3>
						</div>	
					</div>
					<div class="row">
						<div class="col-md-12">
							<g:img dir="/images/cinema-web/peliculas-pics" file="${(pelicula.foto) ? pelicula.foto : 'default.png'}" class="img-rounded show-img" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<g:link action="nueva_pasouno" id="${pelicula.id}" class="btn btn-block btn-warning">Reservar</g:link>
						</div>	
					</div>
				</div>
		</g:each>
		</div>
		</g:else>
</div>
</body>
</html>