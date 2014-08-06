<div class="row">
	<div class="col-xs-4">
        <g:link controller="promocion" action="show" id="${promocion.id}"><g:img dir="/images/cinema-web/promos-pics" file="${promocion.foto}" class="img-rounded show-img" style="width:200px;height:200px;" /></g:link>
    </div>
    <div class="col-xs-8">
        <g:link controller="promocion" action="show" id="${promocion.id}"><h4 style="margin-top:5px;margin-bottom:15px;">${promocion.getNombre()}</h4></g:link>
    </div>
    <div class="col-xs-8" style="font-size:12px;">
        <p>${promocion.getDescripcion()}</p>
    </div>
    <div class="col-xs-8" style="font-size:12px;margin-bottom:5px;">
        <p>Vigente hasta el <g:formatDate date="${promocion.getVigencia()}"/></p>
    </div>

</div>
