<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Sala: ${sala.nombre}</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>Sala: #${sala.id} - ${sala.nombre}</h3>
				<table class="data">
					<tbody>
						<tr>
							<td class="field">Nombre:</td>
							<td class="value">${sala.nombre}</td>
						</tr>
						<tr>
							<td class="field">Filas:</td>
							<td class="value">${sala.filas}</td>
						</tr>
						<tr>
							<td class="field">Columnas:</td>
							<td class="value">${sala.columnas}</td>
						</tr>
					</tbody>	
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<H4>Asientos</H4>
				
			</div>
		</div>
	</div>
</body>
</html>