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
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
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
				</div>

			</div><!-- /.container-fluid -->
		</nav>
	</div>
	<!--- !barra superior ---->

	<g:layoutBody/>


	<!--- footer ---->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top: 1px solid #D8D8D8;">
				<div class="col-md-3 pull-right text-right" style="color:grey">
					<i class="fa fa-film"></i> Cinema Web - <g:formatDate format="yyyy" date="${new Date()}"/> 
				</div>
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