<div class="row" style="margin-left:15px;">
	<div class="col-md-12">
		<h5 style="margin-bottom:0px;">
			<g:link controller="usuario" action="show" id="${comentario.autor.id}">
				<g:img dir="/images/cinema-web/perfil-pics" file="${comentario.autor.perfil.foto}" class="img-rounded show-img" style="width:40px;height:40px;margin-bottom:1px;" />
			</g:link>
			<strong><g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.autor.userId}</g:link></strong>
		</h5>
		<h5>${comentario.mensaje}</h5>
		<h5>[<g:formatDate date="${comentario.fecha}"/>]</h5>
		<br />
	</div>
</div>
