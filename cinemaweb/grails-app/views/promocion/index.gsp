<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="layout" content="bootstrap-main"/>
  <title>Promociones - CinemaWeb</title>

</head>
<body>
  <div class="container">
    <div class="col-md-12" style="margin-top:30px;">
      <div class="col-md-8 borde-hm">
        <h3 style="margin-bottom:10px;">
          <span class="fa-stack fa-lg">
            <i class="fa fa-circle fa-stack-2x"></i>
            <i class="fa fa-flag fa-stack-1x fa-inverse"></i>
          </span>
           Promociones</h3>

          <div class="col-md-12">
            <g:render template="promocionTemp" collection="${promos}" var="promocion"/>
          </div>
      </div>
    </div>

  </div>

</body>
</html>
