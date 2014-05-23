<html>
<head>
	<title>Circulos - CinemaWeb</title>
	<meta name="layout" content="bootstrap-main"/>
</head>
<body>
	<div class="container">
		<div class="col-md-10">
			<h1>Acceso denegado</h1>
			
			<g:if test="${message}">
	    		<div id="message_error">${message}</div>
	        </g:if>

			<br />
			<h4> Para tener acceso a este circulo debe unirse al mismo. </h4>

			<div class="form-group">
				<p>
					<g:form action="index" style="margin-left:20px">
						<g:submitButton name="Volver"/>
					</g:form>
				</p>
			</div>
		</div>
	</div>
</body>
</html>