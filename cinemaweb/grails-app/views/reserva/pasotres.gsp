<html>
	<head>
		<meta name="layout" content="bootstrap-main"/>
		<title>Cinema Web - Reserva - Paso Tres</title>
		<script>
		$(document).ready(function(){
			/*$(window).unload(function() {
				console.log("estoy aqui");
  				//redirijo a borrar la reserva
        	$.ajax({
	            	type: 'POST',
	            	url: '/cinemaweb/reserva/borrar_provisoria',
	            	async: false,
	            	data: {reservaID: "${reservaProvisoria.reserva_key}"}
        		});
			});*/

			$("button#submit-finish").click(function(event){
					event.preventDefault();
					//muestro loading
					$("div#user-feedback").removeClass("alert-danger");
					$("div#user-feedback").addClass("alert-success");
					$("div#user-feedback").html("Procesando el pedido. Aguarde un instante<i class='fa fa-spinner fa-spin fa-2x pull-right' style='margin: 0px'></i>");

					$("div.fade").removeClass("out");
					$("div.fade").addClass("in");
					
					setTimeout(function(){
  						$('form.tarjeta-form').submit();
					}, 2000);
			});
		});

		/*window.onbeforeunload = function(e) {
  			return 'Estas seguro?';
		};*/ 
		</script>
	</head>
	<body>
		<div class="container" id="container-simple">
			<div class="row">
				<div class="col-md-12">
					<h3>3 - Pago de las funciones</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<div class="row">
							<div class="col-md-2"><b>Pelicula:</b></div>
							<div class="col-md-9">${reservaProvisoria.funcion.pelicula.titulo}</div>
					</div>
					<div class="row">
							<div class="col-md-2"><b>Cine:</b></div>
							<div class="col-md-9">${reservaProvisoria.funcion.cine.nombre}</div>
					</div>
					<div class="row">
							<div class="col-md-2"><b>Funcion:</b></div>
							<div class="col-md-9">${reservaProvisoria.fecha_funcion.format("dd/MM/yyyy")} ${reservaProvisoria.funcion.horario}hs</div>
						</div>
					<div class="row">
							<div class="col-md-2"><b>Asientos:</b></div>
							<div class="col-md-9">
								<g:each in="${reservaProvisoria.asientos.sort{a,b -> a.fila <=> b.fila}.sort{c,d-> c.columna <=> d.columna}}" var="asiento">
								A${asiento.fila}-${asiento.columna} / 
								</g:each>
							</div>
						</div>
					<div class="row">
							<div class="col-md-2"><b>Total:</b></div>
							<div class="col-md-9">$ ${reservaProvisoria.funcion.precio * reservaProvisoria.asientos.size()}</div>
						</div>
				</div>
			</div>
			<div class="row fade out">
				<div class="col-md-6" style="margin:15px">
					<div class="alert alert-danger" id="user-feedback" style="margin-bottom:0px; padding:13px">
						probando fade 
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6" style="margin: 0px">
					<h4 style="text-decoration: underline">Información de la tarjeta</h4>
					<g:form action="nueva_pasotres" id="${reservaProvisoria.funcion.pelicula.id}" class="form-horizontal tarjeta-form" method="POST">
						<div class="form-group">
							<label for="tarjeta" class="col-md-4 col-sm-2 control-label">Tarjeta:</label>
							<div class="col-md-3">
								<select id="card-type" class="form-control">
									<option value="-1">-</option>
									<option value="visa">Visa</option>
									<option value="mastercard">Mastercard</option>
									<option value="amex">AMEX</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="nombre-titular" class="col-md-4 col-sm-2 control-label">Nombre del titular:</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="nombre-titular" id="nombre-titular"/>
							</div>
						</div>
						<div class="form-group">
							<label for="numero" class="col-md-4 col-sm-2 control-label">Número:</label>
							<div class="col-md-2">
								<input type="text" maxlength="4" class="form-control" name="first-numbers" id="first-numbers">
							</div>
							<div class="col-md-2">
								<input type="text" maxlength="4" class="form-control" name="second-numbers" id="second-numbers">
							</div>
							<div class="col-md-2">
								<input type="text" maxlength="4" class="form-control" name="third-numbers" id="third-numbers">
							</div>
							<div class="col-md-2">
								<input type="text" maxlength="4" class="form-control" name="fourth-numbers" id="fourth-numbers">
							</div>
						</div>
						<div class="form-group">
							<label for="CCV" class="col-md-4 col-sm-2 control-label">CCV:</label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="ccv" id="ccv">
							</div>
						</div>
						<div class="form-group">
							<label for="fecha-caducidad" class="col-md-4 col-sm-2 control-label">Fecha de caducidad:</label>
							<div class="col-md-2">
								<select class="form-control" name="month-cad" id="month-cad">
									<option value="-1">-</option>
									<g:each in="${(1..12)}">
										<option value="${it}">${it}</option>
									</g:each>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control" name="year-cad" id="year-cad">
									<option value="-1">-</option>
									<g:each in="${(2014..2020)}">
										<option value="${it}">${it}</option>
									</g:each>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-4 col-md-offset-4">
								<input type="hidden" name="finish" value="1"/>
								<button type="submit" class="btn btn-block btn-warning" id="submit-finish">Finalizar</button>
							</div>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>