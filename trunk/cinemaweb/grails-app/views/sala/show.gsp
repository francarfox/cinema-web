<html>
<head>
	<meta name="layout" content="bootstrap-main"/>
	<title>Cinema Web - Sala: ${sala.nombre}</title>
	<style type="text/css">
	table#seats{
		margin-top: 0px;
		border-radius: 0px;
		background-color: white;
		color:black;
	}

	table#seats, table#seats th, table#seats td {
		border: 1px solid rgb(36, 36, 36)
	}


	#seats thead tr th, #seats tbody tr td {
		padding: 2px;
	}

	#seats thead tr th , #seats tbody tr td.td-header{
		background-color: #BD1133;
		font-weight: bold;
		color:#ffcc00; 
	}


	#seats tbody tr td{
		background-color: white
	}

	#seats tr:hover .td-header{
		background-color: #BD1133;
		border-radius: 0px;
	}

	#seats tr:hover td{
		background-color: white;
		border-radius: 0px;
	}

	#seats tr td.toDelete{
		background-color: #9CB9F8;
	}

	.actions{
		margin-top: 54px;
		float: left;
	}

	.actions a{
		margin-bottom: 10px;
	}

	.actions div.form-group{
		margin: 0px 0px 0px 15px;
	}

	#actions-start div.col-md-4{
		margin-bottom: 10px
	}

	#seats tr td.selectable:hover{
		background-color: #93D1B8
	}

	#seats tr td.selectable{
		cursor: pointer;
	}

	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>Sala: #${sala.id} - ${sala.nombre}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7">
				<div class="row">
					<div class="col-md-12" id="data-display">
						<div class="row">
							<div class="col-md-3"><b>Nombre:</b></div>
							<div class="col-md-9">${sala.nombre}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Cine:</b></div>
							<div class="col-md-9">${sala.cine ? sala.cine.nombre : "-"}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Filas:</b></div>
							<div class="col-md-9">${sala.filas}</div>
						</div>
						<div class="row">
							<div class="col-md-3"><b>Columnas:</b></div>
							<div class="col-md-9">${sala.columnas}</div>
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
								<g:link action="edit" id="${sala.id}" ><i class="fa fa-edit"></i> Editar</g:link>
								</div>
								<div class="col-md-6">
									<g:link action="index"><i class="fa fa-list"></i> Salas</g:link>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7">
				<H4>Asientos</H4>
				<!--- muestro los asientos cargados ---->
				<table class="table table-bordered table-condensed" id="seats" style="table-layout:fixed">
					<thead>
						<tr>
							<th></th>
							<g:each in="${1..sala.columnas}" var="columna">
							<th class="text-center">${columna}</th>
						</g:each>
					</tr>
				</thead>
				<tbody>
					<g:each in="${1..sala.filas}" var="fila">
					<tr>
						<td class="text-center td-header">${fila}</td>
						<g:each in="${1..sala.columnas}" var="columna">

						<g:if test="${asientosOcupados.contains(fila+','+columna)}">
						<td class="toDelete text-center" data-fila="${fila}" data-columna="${columna}"><i class="fa fa-user"></i></td>
					</g:if>
					<g:else>
					<td class="toAdd" data-fila="${fila}" data-columna="${columna}"></td>
				</g:else>
			</g:each>	
		</tr>
	</g:each>
</tbody>	
</table>
</div>
<div class="col-md-5 actions"  id="actions-start">
	<div class="row">
		<div class="col-md-7">
			<a href="#" id="add-start" class="btn btn-cinema btn-block"><i class="fa fa-plus-circle"></i> Agregar asientos</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-7">
			<a href="#" id="remove-start" class="btn btn-cinema btn-block"><i class="fa fa-minus-circle"></i> Remover asientos</a>		
		</div>
	</div>
</div>
<!--- formulario para cargar asientos ---->
<div class="col-md-5 actions" id="seats-form" style="display:none">
	<g:form action="updateSeats" id="${sala.id}" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-7">
			<a href="#" id="action-save" class="btn btn-primary btn-block">Guardar</a>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-7">
			<a href="#" id="action-cancel" class="btn btn-default btn-block">Cancelar</a>
		</div>
	</div>
</g:form>	
</div>
</div>
<!---- cargo el archivo que maneja la creacion de asientos ---->
<r:external uri="/js/seats-manager.js"/>
</div>
</body>
</html>