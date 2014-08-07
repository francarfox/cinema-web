<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Usuario - Mis reservas</title>
	<style>
	table#table-list td, table#table-list th{
		border: 1px solid black;
	}	
	table#table-list td{
		background-color: white;
		color:black;
	}

	table#table-list td a{
		color: black;
	}
	</style>
</head>
</html>
<body>
	<div class="container" id="container-simple">
		<div class="row">
			<div class="col-md-12">
				<h2 style="margin-bottom: 15px"><i class="fa fa-ticket"></i> Mis Reservas</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-10">
				<table class="table table-bordered table-stripped" id="table-list">
					<thead>
						<tr>
							<th>Pelicula</th>
							<th>Cine</th>
							<th>Funcion</th>
							<th class="text-center">Cant. asientos</th>
							<th class="text-center">Fecha de reserva</th>
							<th class="text-center">Codigo de reserva</th>
						</tr>
					</thead>
					<tbody>
						<g:if test="${reservas.size() > 0}">
						<g:each in="${reservas}" var="reserva">
							<tr>
								<td><g:link controller="pelicula" action="show" id="${reserva.funcion.pelicula.id}"><b style="color:#BD1133">${reserva.funcion.pelicula.nombre}</b></g:link></td>
								<td><g:link controller="cine" action="show" id="${reserva.funcion.cine.id}">${reserva.funcion.cine.nombre}</g:link></td>
								<td>${reserva.fecha_funcion.format("dd/MM/yyyy") + " " + reserva.funcion.horario} hs</td>
								<td class="text-center">${reserva.asientos.size()}</td>
								<td class="text-center">${reserva.fecha_reserva.format("dd/MM/yyyy H:mm")} hs</td>
								<td class="text-center">${reserva.reserva_key}</td>
							</tr>	
						</g:each>
						</g:if>
						
						<g:else>
							<tr>
								<td colspan="6"><i>No has reservado ninguna película todavia.</i></td>
							</tr>
						</g:else>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>