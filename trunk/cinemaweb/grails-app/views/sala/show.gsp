<html>
<head>
	<meta name="layout" content="bootstrap-main2"/>
	<title>Cinema Web - Sala: ${sala.nombre}</title>
	<style type="text/css">
	#seats thead tr th, #seats tbody tr td {
		padding: 2px;
	}
	#seats thead tr th ,  td.td-header{
		background-color: #D5D5D5;
		font-weight: bold;
	}

	.toDelete{
		background-color: #9CB9F8;
	}

	.actions{
		margin-top: 54px
	}

	#actions-start div.col-md-4{
		margin-bottom: 10px
	}

	.selectable:hover{
		background-color: #93D1B8
	}

	.selectable{
		cursor: pointer;
	}

	</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<g:link action="index" class="btn btn-warning"><i class="fa fa-list"></i> Lista</g:link>
				<g:link action="edit" id="${sala.id}" class="btn btn-warning"><i class="fa fa-edit"></i> Editar</g:link>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>Sala: #${sala.id} - ${sala.nombre}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<table class="data">
					<tbody>
						<tr>
							<td class="field">Nombre:</td>
							<td class="value"><strong>${sala.nombre}</strong></td>
						</tr>
						<tr>
							<td class="field">Cine:</td>
							<td class="value"><strong>${sala.cine ? sala.cine.nombre : "-"}</strong></td>
						</tr>
						<tr>
							<td class="field">Filas:</td>
							<td class="value"><strong>${sala.filas}</strong></td>
						</tr>
						<tr>
							<td class="field">Columnas:</td>
							<td class="value"><strong>${sala.columnas}</strong></td>
						</tr>
					</tbody>	
				</table>
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
		<div class="col-md-4">
			<a href="#" id="add-start" class="btn btn-success btn-block">Agregar asientos</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<a href="#" id="remove-start" class="btn btn-danger btn-block">Remover asientos</a>		
		</div>
	</div>
</div>
<!--- formulario para cargar asientos ---->
<div class="col-md-5 actions" id="seats-form" style="display:none">
	<g:form action="updateSeats" id="${sala.id}" class="form-horizontal">
	<div class="form-group">
		<div class="col-md-4">
			<a href="#" id="action-save" class="btn btn-primary btn-block">Guardar</a>
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-4">
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