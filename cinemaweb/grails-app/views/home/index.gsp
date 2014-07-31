<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="layout" content="bootstrap-main"/>
  <title>CinemaWeb · Tu lugar en el cine</title>

</head>
<body>
  <div class="container">
    
    <div class="col-md-12">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="item active">
                <img src="images/cinema-web/peliculas-pics/1-pelicula.jpg" alt="">
                <div class="carousel-caption">
                  ...
                </div>
            </div>
            <div class="item">
                <img src="images/cinema-web/peliculas-pics/1-pelicula.jpg" alt="">
                <div class="carousel-caption">
                  ...
                </div>
            </div>
          </div>

          <!-- Controls -->
          <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
      </div>
        </div>

        <div class="col-md-12 navbar-text">
          <div class="col-xs-5">
            <h3>Ultimas Peliculas</h3>
            <g:each in="${peliculas}" var="pelicula">
              <p>${pelicula.getTitulo()} (${pelicula.getDuracion()} minutos)</p>
            </g:each>
          </div>
          <div class="col-xs-5">
            <h3>Cines</h3>
          </div>
          <div class="col-xs-2">
            <h4>Ultimos Usuarios</h4>
            <g:each in="${usuarios}" var="usuario">
              <p>${usuario.id} - <g:link controller="usuario" action="verusuario" params="[nombre:usuario.getUserId()]">${usuario.getUserId()}</g:link></p>
            </g:each>
          </div>
        </div>

  </div>
</body>
</html>
