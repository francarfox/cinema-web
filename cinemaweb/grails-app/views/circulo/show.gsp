<html>
<head>
	<title>Ver Circulo - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container" style="padding-left:0px;">

		<div class="container">
		<g:if test="${errors}">
			<div class="row">
				<div class="col-md-11">
					<div id="message_error">
						<ul>
							<g:each in="${errors}">
								<li><g:message error="${it}" /></li>
							</g:each>
						</ul>		
					</div>
				</div>
			</div>
		</g:if>

		<g:if test="${!circulo.estaUsuario(usuario)}">
			<h2>Acceso denegado: debe ingresar al circulo para poder verlo.</h2>
			<h2>¿Desea unirse al circulo ${circulo.getNombre()}? 
			<g:link action="unirse" id="${circulo.id}" class="btn btn-lg btn-warning" style="font-size:13px; padding: 5px 10px; color:black;">Unirse <i class="fa fa-mail-reply"></i></g:link></h2>
		</g:if>

		<g:else> <!-- SHOW ADMIN -->
			<g:if test="${session.loggedUserNombre == circulo.getAdministrador()}">
				<div class="row">
					<div class="col-md-8">
						<h2>Circulo de ${circulo.getNombre()}</h2>
					</div>
					<div class="col-md-4" style="margin-top:40px;">
						<g:form action="#" class="form-inline" style="float:right">
							<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Circulos" name="busquedacirculo" />
							<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
						</g:form>
					</div>
				</div>
			
				<div class="col-md-8" style="margin-top:20px;">
					<table class="table">
						<thead>
						<tr>
							<td><h2 style="text-align:center;color:#ffcc00;">Comentarios</h2></td>
						</tr>
						</thead>
						<tbody>
							<tr>
								<td style="height:550px">
									<g:render template="comentarioTemp" collection="${circulo.obtenerComentarios()}" var="comentario"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<td><h2 style="text-align:center;color:#ffcc00;">Postear un comentario</h2></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="height:100px">
									<g:form action="comentar" id="${circulo.id}">
								<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
								<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
									</g:form>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="col-md-4 pnl-circuloadmin">
					<p style="text-align:center;"><strong>¡Bienvenido ${circulo.getAdministrador()} a su circulo!</strong></p>
					
				
						<div class="col-md-12" style="padding-left:0px;margin-bottom:15px;">
							<g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" />
							<g:link controller="circulo" action="uploadPic" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" style="margin-bottom:10px;"><i class="fa fa fa-camera"></i> Editar Foto</g:link>		
						</div>
						<table class="table tablecirc">
							<thead>
							<tr>
								<td><strong>Nombre</strong></td>
								<td>${circulo.getNombre()}</td>
							</tr>
							</thead>
							<tr>
								<td><strong>Tag</strong></td>
								<td>${circulo.getTags()}</td>
							</tr>
							<tr>
								<td><strong>Usuarios</strong></td>
								<td>${circulo.usuarios.size()}</td>
							</tr>
						</table>
						<table style="background-color:#F1C308;">
							<tr>
								<td>
									<g:link action="edit" id="${circulo.id}" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa fa-pencil-square-o"></i> Editar Circulo</g:link>
								</td>
								<td style="width:50%;">&nbsp</td>
								<td>
									<g:link action="delete" id="${circulo.id}" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa-times"></i> Eliminar Circulo</g:link>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp</td>
							</tr>
							<tr>
								<td>
									<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" params="[accion:'listar']"><i class="fa fa-list"></i> Lista Usuarios</g:link>
								</td>
								<td style="width:50%;">&nbsp</td>
								<td>
									<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}" params="[accion:'eliminar']"><i class="fa fa-ban"></i> Eliminar Usuario</g:link>
								</td>
							</tr>
						</table>
					
					<div>
						<g:if test="${circulo.encuesta == null}"> 
							<table class="table tablecirc">
								<thead>
								<tr>
									<td style="text-align:center;"><h3><strong>Encuesta</strong></h3></td>
								</tr>
								</thead>
							</table>
							<g:link action="create" controller="encuesta" class="btn btn-lg btn-medium btn-crearcirculo" style="margin-left:60px;" params="[id:circulo.id]"><i class="fa fa-legal"></i> Crear Encuesta</g:link>
						</g:if>
						<g:else>
							<g:if test="${circulo.encuesta.estaUsuario(session.loggedUserNombre)}">
								<table class="table tablecirc">
								<thead>
									<tr>
										<td colspan="2" style="text-align:center;"><h3><strong>Encuesta:<br /><h4>${circulo.encuesta.getTitulo()}</h4></strong></h3></td>
									</tr>
								</thead>
									<g:each in="${circulo.encuesta.getOpcionesOrdenadas()}" var="opcion">
										<tr>
											<td>${opcion.cantidad}</td>
											<td><strong>${opcion.nombre}</strong></td>
										</tr>
									</g:each>
								<tfoot>
									<tr>
										<td colspan="2"><h5 style="text-align:center">Cantidad de votos: ${circulo.encuesta.getCantidadTotalVotos()}</h5></td>
									</tr>
								</tfoot>
							</table>
							<g:link action="delete" controller="encuesta" class="btn btn-lg btn-medium btn-crearcirculo" style="margin-left:60px;" params="[id:circulo.encuesta.id,circuloid:circulo.id]"><i class="fa fa-times-circle"></i> Eliminar Encuesta</g:link>
							</g:if>
							<g:else>
								<table class="table tablecirc">
								<thead>
									<tr>
										<td colspan="2" style="text-align:center;"><h3><strong>Encuesta:<br /><h4>${circulo.encuesta.getTitulo()}</h4></strong></h3></td>
									</tr>
								</thead>
								<g:form action="votar" controller="encuesta" id="${circulo.encuesta.id}" params="[circulo:circulo.id]">
									<g:each in="${circulo.encuesta.opciones}" var="opcion">
										<tr>
											<td><input type="radio" name="opc" value="${opcion.id}" /></td>
											<td><strong>${opcion.nombre}</strong></td>
										</tr>
									</g:each>
										<tr>
											<td colspan="2">
												<input type="hidden" name="submit" value="1">
												<g:submitButton class="btn btn-medium btn-block" name="Votar"/>
											</td>
										</tr>
								</g:form>
							</table>
							</g:else>
						</g:else>
					</div>
				</div>
			</g:if>

			<g:else> <!-- SHOW NO ADMIN -->
				<div class="row">
					<div class="col-md-8">
						<h2>Circulo de ${circulo.getNombre()}</h2>
					</div>
					<div class="col-md-4" style="margin-top:40px;">
						<g:form action="#" class="form-inline" style="float:right">
							<g:field class="form-control form-busqueda" type="text" placeholder="Buscar Circulos" name="busquedacirculo" />
							<g:submitButton class="btn btn-lg btn-buscar" name="Buscar"/>
						</g:form>
					</div>
				</div>
			
				<div class="col-md-8" style="margin-top:20px;">
					<table class="table">
						<thead>
						<tr>
							<td><h2 style="text-align:center;color:#ffcc00;">Comentarios</h2></td>
						</tr>
						</thead>
						<tbody>
							<tr>
								<td style="height:400px">
									<g:render template="comentarioTemp" collection="${circulo.obtenerComentarios()}" var="comentario"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table">
						<thead>
							<tr>
								<td><h2 style="text-align:center;color:#ffcc00;">Postear un comentario</h2></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="height:100px">
									<g:form action="comentar" id="${circulo.id}">
								<g:field type="textarea" name="mensaje" style="width:600px; height:50px;-webkit-border-radius: 20px; -moz-border-radius: 20px; border-radius: 20px;" />
								<g:submitButton class="btn btn-lg btn-buscar" name="Enviar" style="background-color:#ffcc00;color:#BD1133;"/>
									</g:form>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-4 pnl-circuloadmin">
						<div class="col-md-12" style="padding-left:0px;margin-bottom:15px;">
							<g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" />
						</div>
						<table style="background-color:#F1C308;">
							<tr>
								<td>
									<g:link action="desunirse" id="${circulo.id}" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa-external-link"></i> Desunirme</g:link>
								</td>
								<td>&nbsp</td>
								<td>
									<g:link action="listarusuarios" class="btn btn-lg btn-medium btn-crearcirculo" id="${circulo.id}"><i class="fa fa-list"></i> Usuarios</g:link>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp</td>
							</tr>
							<tr>
								<td>
									<g:link action="index" id="${session.loggedUser}" params="[accion:'miscirculos']" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa-comments"></i> Mis Círculos</g:link>
								</td>
								<td>&nbsp</td>
								<td>
									<g:link action="index" params="[accion:'circulos']" class="btn btn-lg btn-medium btn-crearcirculo"><i class="fa fa-list"></i> Círculos</g:link>
								</td>
							</tr>
						</table>
						<div>
						<g:if test="${circulo.encuesta == null}"> 
							<table class="table tablecirc">
								<thead>
								<tr>
									<td style="text-align:center;"><h3><strong>Encuesta</strong></h3></td>
								</tr>
								</thead>
							</table>
						</g:if>
						<g:else>
							<g:if test="${circulo.encuesta.estaUsuario(session.loggedUserNombre)}">
								<table class="table tablecirc">
								<thead>
									<tr>
										<td colspan="2" style="text-align:center;"><h3><strong>Encuesta:<br /><h4>${circulo.encuesta.getTitulo()}</h4></strong></h3></td>
									</tr>
								</thead>
									<g:each in="${circulo.encuesta.getOpcionesOrdenadas()}" var="opcion">
										<tr>
											<td>${opcion.cantidad}</td>
											<td><strong>${opcion.nombre}</strong></td>
										</tr>
									</g:each>
								<tfoot>
									<tr>
										<td colspan="2"><h5 style="text-align:center">Cantidad de votos: ${circulo.encuesta.getCantidadTotalVotos()}</h5></td>
									</tr>
								</tfoot>
							</table>
							</g:if>
							<g:else>
								<table class="table tablecirc">
								<thead>
									<tr>
										<td colspan="2" style="text-align:center;"><h3><strong>Encuesta:<br /><h4>${circulo.encuesta.getTitulo()}</h4></strong></h3></td>
									</tr>
								</thead>
								<g:form action="votar" controller="encuesta" id="${circulo.encuesta.id}" params="[circulo:circulo.id]">
									<g:each in="${circulo.encuesta.opciones}" var="opcion">
										<tr>
											<td><input type="radio" name="opc" value="${opcion.id}" /></td>
											<td><strong>${opcion.nombre}</strong></td>
										</tr>
									</g:each>
										<tr>
											<td colspan="2">
												<input type="hidden" name="submit" value="1">
												<g:submitButton class="btn btn-medium btn-block" name="Votar"/>
											</td>
										</tr>
								</g:form>
							</table>
							</g:else>
						</g:else>
					</div>
				</div>
				</div>
			</g:else>
		</g:else>
	</div>
</body>
</html>