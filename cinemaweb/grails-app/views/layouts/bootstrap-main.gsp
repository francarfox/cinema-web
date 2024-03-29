<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><g:layoutTitle default="Grails"/></title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="stylesheet">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'cinema-web.css')}" type="text/css">
	
	<!---Menu-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type='text/javascript' src='/js/menu_jquery.js'></script>

	<r:require module="jquery"/>
	<g:layoutHead/>
	<r:layoutResources />
	<style type="text/css">
	#bar-logo{
		height:36px;
		margin-top: 3px;
	}
	#bar-brand{
		float: none;
		height: 30px;
		padding: 0px;
		padding-left: 19px;
		vertical-align: -webkit-baseline-middle;
	}
	</style>	
</head>
<body>
	<!--- barra superior ---->
	<div class="container">
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="col-md-3">
				<!-- ACA IRIA EL LOGO -->
			</div>
			<div class="col-md-12" style="margin:0 auto; width:70%; top:80px;">
				<g:form class="form-inline">
					<g:field class="form-control form-busqueda-banner" type="text" placeholder="Pelicula" name="busquedapelicula" />
					<g:field class="form-control form-busqueda-banner" type="text" placeholder="Cine" name="busquedacine" />
					<g:field class="form-control form-busqueda-banner" type="text" placeholder="Lugar" name="busquedalugar" />
					<button class="btn btn-warning" type="submit"><i class="fa fa-search"></i> Buscar</button>
				</g:form>
			</div>
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- <g:img dir="images/cinema-web" file="LogoCinema-60x50.png" id="bar-logo"/>
					<a href="#" class="navbar-brand" style="float:none" id="bar-brand">Cinema Web</a> -->
				</div>
				<!-- <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul>
						</li>
					</ul>
				</div> -->

			</div><!-- /.container-fluid -->
		</nav>

		<!--- Barra de logueo -->
		<div id="loginmenu">
			<g:if test="${session.loggedUser!=null}">
		      	<li class="dropdown">
		      		<b>Bienvenido</b>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>${session.loggedUserNombre}</b><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><g:link controller="usuario" action="show" id="${session.loggedUser}">Mi Usuario</g:link></li>
							<li><g:link controller="circulo" action="index" id="${session.loggedUser}" params="[accion:'miscirculos']">Mis Círculos</g:link></li>
							<li><g:link controller="comentario" action="indexusuario" id="${session.loggedUser}">Mis Comentarios</g:link></li>
							<li><g:link controller="usuario" action="reservas_usuario">Mis Reservas</g:link></li>
							<g:if test="${session.loggedUserRol != 'USER'}">
								<li class="divider"></li>
								<li><g:link controller="usuario" action="paneladministrador">Panel Administrador</g:link></li>
							</g:if>
							<li class="divider"></li>
							<li><g:link controller="usuario" action="logout">Logout</g:link></li>
							<li><g:link controller="usuario" action="eliminar" id="${session.loggedUser}">Eliminar Cuenta</g:link></li>
						</ul>
				</li>				
		    </g:if>
		    <g:else>
		    ¿No has iniciado sesion todavia?
		      <g:link controller="usuario" action="login">Login</g:link> |
		      <g:link controller="usuario" action="create">Registrarme</g:link>
		    </g:else>
		</div>
		<!--- !Barra de logueo -->
		
		<!--- Barra de Menu -->
		<div id='cssmenu'>
		<ul>
		   <li><a href='/cinemaweb/'><span>Home</span></a></li>
		   <li><a href='/cinemaweb/cine'><span>Cines</span></a></li>
		   <li><a href='/cinemaweb/pelicula'><span>Peliculas</span></a></li>
		   <li class='has-sub'><a href=''><span>Usuarios</span></a>
		   		<ul>
		         	<li><a href='/cinemaweb/usuario/index'>Buscar Usuarios</a></li>
		         	<li><a href='/cinemaweb/usuario/create'>Crear Usuario</a></li>
		        </ul>
		   </li>
		   <li><a href='/cinemaweb/promocion/index'><span>Promociones</span></a></li>
		   <li><a href='/cinemaweb/circulo/index'><span>Circulos</span></a></li>
		   <g:if test="${session.loggedUserRol == 'ADMIN'}">
		   		 <li class='has-sub'><a href='/cinemaweb/usuario/paneladministrador'><span>Administrador</span></a>
		   		 	<ul>
		         		<li><a href='/cinemaweb/usuario/index'>Manejo de Usuarios</a></li>
						<li><a href='/cinemaweb/cine/listarcines'>Manejo de Cines</a></li>
						<li><a href='/cinemaweb/sala/index'>Manejo de Salas</a></li>
						<li><a href='/cinemaweb/pelicula/listarpeliculas'>Manejo de Peliculas</a></li>
						<li><a href='/cinemaweb/funcion/index'>Manejo de Funciones</a></li>
						<li><a href='/cinemaweb/usuario/listarcomentarios'>Manejo de Comentarios</a></li>
						<!-- <li><a href='/cinemaweb/usuario/reservas_usuario'>Manejo de Reservas</a></li> -->
						<li><a href='/cinemaweb/usuario/listarcirculos'>Manejo de Círculos</a></li>
						<li><a href='#'>Manejo de Promociones</a></li>
						<li><a href='/cinemaweb/usuario/listarencuestas'>Manejo de Encuestas</a></li>
		      		</ul>
		      	</li>
		   </g:if>
		   <li class='last'><a href='/cinemaweb/home/contacto'><span>Contacto</span></a></li>
		</ul>
		</div>
		<!--- !Barra de Menu -->
	</div>
	<!--- !barra superior -->

	<g:layoutBody/>


	<!--- footer -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top: 1px solid #D8D8D8;">
				<div class="col-md-3 pull-right text-right" style="color:black;padding-bottom:10px;">
					<i class="fa fa-film"></i> Cinema Web - <g:formatDate format="yyyy" date="${new Date()}"/> 
				</div>
				<br />
			</div>
		</div>
	</div>
	<!--- !footer ---->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<r:external uri="/js/bootstrap.min.js"/>
	<g:javascript library="application"/>
	<r:layoutResources />
</body>
</html>