<html>
<head>
	<title>Editar Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-10">
			<h1>Editar Circulo ${circulo.nombre}</h1>

			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>

			<g:form action="actualizar" id="${circulo.id}">
				<table id="tableUsuario">
					<tr>
						<td colspan="2"><h2>Datos Circulo</h2></td>
					</tr>
					<tr>
						<td><label for="nombre">Nombre</label></td>
						<td><g:field type="text" name="nombre" value="${circulo.nombre}" /></td>
					</tr>
					<tr>
						<td><label for="tags">Tag</label></td>
						<td><g:field type="text" name="tags" value="${circulo.tags}" /></td>
					</tr>

					<tr>
						<td colspan="2"><br /></td>
					</tr>
					<tr align="center">
						<td colspan="2" style="text-align:center"><g:submitButton name="Editar"/></td>
					</tr>
				</table>
			</g:form>
			<p>
				<g:form action="index" style="margin-left:20px">
					<g:submitButton name="Volver"/>
				</g:form>
			</p>
		</div>
	</div>
</body>
</html>