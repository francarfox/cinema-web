<html>
<head>
	<title>Logout Usuario</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">

		<h1>Te has deslogueado correctamente</h1>

		<g:if test="${message}">
    		<div id="message_error">${message}</div>
        </g:if>
        
		<br />
		<g:link url="/cinemaweb" class="btn btn-primary btn-block"> Pagina Principal</g:link>
		
	</div>
</body>
</html>