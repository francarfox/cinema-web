<html>
	<head>
		<meta name="layout" content="bootstrap-main"/>
		<title>Cinema Web - Reserva - Paso dos</title>
		<style>
			table#asientos-reserva{
				background-color: transparent;
				table-layout: fixed;
				margin-right: auto;
				margin-left: auto;
				margin-top: 40px
			}
			
			td.seat-active, td.seat-none{
				width: 40px;
				height: 26px;
			}

			td.seat-active{
				border: 1px solid #636363;
				background-image: url("../../images/icon_seat.png");
				background-size: 80% 89%;
				background-repeat:no-repeat;
				background-position:center;
				background-color: #A1FF89;
				cursor: pointer;
			}

			td.seat-active.selected, td.seat-active:hover{
				background-color: #9595E2;;
			}

			td.seat-none{
				border: none;
				background-color: transparent;
			}

			div#sala-screen{
				float: none;
				margin: 0 auto 0 auto;
				text-align: center;
				margin-top: 20px;
				padding: 10px 0px;
				height: 60px;
				background-color: #FFF;
				border-radius: 5px;
				border: 1px solid #949494;
			}
		</style>
		<script>
		$(document).ready(function(){
			$("td.seat-active").click(function(){
				if($(this).hasClass("selected")){
					removeSeat($(this));
				}else{
					addSeat($(this));
				}
			
			});
		});

		function addSeat(asiento) {
			//chequeo si puede seleccionar mas asientos
			var cantidadAsientos = parseInt($("span#asientos-reservables").html());
			if(cantidadAsientos > 0){
				asiento.addClass("selected");
				var filaAsiento = asiento.attr("data-fila");
				var columnaAsiento = asiento.attr("data-columna");
				$("<input>").attr({
					"name": "asientos[]",
					"type": "hidden",
					"data-asiento": filaAsiento + "," + columnaAsiento
				}).appendTo("form.asientos-reserva");
				cantidadAsientos--;
				$("span#asientos-reservables").html(cantidadAsientos);
				if (cantidadAsientos == 0){
					$("button#submit-asientos").removeClass("disabled");
				}	
			}
		}

		function removeSeat(asiento){
			//remuevo el input
			var filaAsiento = asiento.attr("data-fila");
			var columnaAsiento = asiento.attr("data-columna");
			$("input[data-asiento='" + filaAsiento +"," + columnaAsiento + "']").remove();
			asiento.removeClass("selected");
			var cantidadAsientos = parseInt($("span#asientos-reservables").html());
			//subo 1 a la cantidad de asientos
			$("span#asientos-reservables").html(cantidadAsientos + 1);
			//bloqueo el boton de submit
			$("button#submit-asientos").addClass("disabled");
		}
		</script>
	</head>
	<body>
		<div class="container" id="container-simple">
			<div class="row">
				<div class="col-md-12">
					<h3>2 - Selecciona los asientos</h3>
				</div>
			</div>
				<div class="row">
					<div class="col-md-2">
						Asientos a reservar: <span id="asientos-reservables">${num_asientos}</span>
					</div>
					<div class="col-md-8" style="margin:0px">
						<g:form action="nueva_pasodos" id="${peliculaID}" method="POST" class="asientos-reserva">
							<input type="hidden" name="submit" value="1"/>
							<input type="hidden" name="funcion" value="${funcionID}"7>
							<input type="hidden" name="horario" value="${fecha}"/>
							<button type="submit" class="btn btn-warning disabled pull-right" id="submit-asientos">Siguiente</button>
						</g:form>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-10" style="float:none;margin:0 auto">
								<table id="asientos-reserva">
							<tbody>
								<g:each in="${salaFilas..1}" var="fil">
									<tr>
										<g:each in="${1..salaColumnas}" var="col">
											<g:if test="${salaAsientos.contains(fil +','+ col)}">
												<td class="seat-active" data-fila="${fil}" data-columna="${col}">
												</td>
											</g:if>
											<g:else>
												<td class="seat-none" data-fila="${fil}" data-columna="${col}"></td>
											</g:else>
										</g:each>
									</tr>
								</g:each>
							</tbody>
						</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="row">
							<div class="col-md-8" id="sala-screen">
								<span style="display:inline-block, vertical-align:middle">Pantalla</span>
							</div>
						</div>
					</div>
				</div>
		</div>
	</body>
</html>