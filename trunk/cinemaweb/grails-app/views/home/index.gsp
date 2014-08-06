<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="layout" content="bootstrap-main"/>
  <title>CinemaWeb · Tu lugar en el cine</title>

</head>
<body>
  <div class="container">
    
    <div class="col-md-10">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
          </ol>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
          <div class="item active">
                <img src="images/slider/cinema-web.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/slider/planeta-de-los-simios.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/slider/relatos-salvajes-banner.jpg" alt="">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="images/slider/en-el-tornado.jpg" alt="">
                <div class="carousel-caption">
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

    <div class="col-md-2" style="padding-left:0px;">
        <div style="margin-top:28px;margin-bottom:20px;margin-left:5px;">
          <img src="images/redessociales.png" alt="">
        </div>
        <g:if test="${session.loggedUser == null}">
        <g:form controller="usuario" action="validar" class="form-signin">
            <table id="tableUsuario" style="width:100%;margin:0 0;">
                <tr>
                  <td><g:field type="text" class="form-control" placeholder="Usuario" name="userId" /></td>
                </tr>
                <tr>
                  <td>&nbsp</td>
                </tr>
                <tr>
                  <td><g:passwordField name="password" class="form-control" placeholder="Password" /></td>
                </tr>
                <tr>
                  <td colspan="2"><br /></td>
                </tr>
                <tr align="center">
                  <td><g:submitButton class="btn btn-lg btn-login btn-medium" name="Iniciar Sesión"/></td>
                </tr>
            </table>
        </g:form>
        </g:if>
        <g:else>
          <h2>Bienvenido ${session.loggedUserNombre} a CinemaWeb!</h2>
        </g:else>
      </div>
      <div class="col-md-2" style="margin-top:20px;padding-left:0px;">
        <h5 style="margin-bottom:10px;"><strong>Ultimos usuarios unidos</strong></h5>
        <g:each in="${usuarios}" var="usuario">
            <p>${usuario.id} - <i class="fa fa-user"></i> <g:link controller="usuario" action="show" id="${usuario.id}">${usuario.getUserId()}</g:link></p>
        </g:each>
      </div>

        <div class="col-md-12 navbar">

          <div class="col-xs-5 borde-hm" style="height:790px;">
            <h3><i class="fa fa-film"></i> Películas mejor ranqueadas</h3>
            <g:each in="${peliculasPunt}" var="pelicula">
              <div class="col-xs-4">
                <g:link controller="pelicula" action="show" id="${pelicula.id}"><g:img dir="/images/cinema-web/peliculas-pics" file="${pelicula.foto}" class="img-rounded show-img" style="width:113px;height:158px;" /></g:link>
              </div>
              <div class="col-xs-8">
                <h4 style="margin-top:5px;"><g:link controller="pelicula" action="show" id="${pelicula.id}">${pelicula.getNombre()}</g:link></h4>
              </div>
              <div class="col-xs-8">
                <p style="font-size:12px;">Director: ${pelicula.getDirector()}</p>
              </div>
              <div class="col-xs-8">
                <p style="font-size:12px;">Sinópsis: ${pelicula.getSinopsis()}</p>
              </div>
              <div class="col-xs-8">
                <p style="font-size:12px;">Duración: ${pelicula.getDuracion()} minutos</p>
              </div>
              <div class="col-xs-8" style="margin-bottom:22px;">
                <p style="font-size:12px;">Puntuación: ${pelicula.getPuntos()}</p>
              </div>
            </g:each>
          </div>

          <div class="col-xs-4 borde-hm" style="margin-left:5px;padding-bottom:29px;height:790px;">
            <h3><i class="fa fa-video-camera"></i> Cines más comentados</h3>
            <g:each in="${cines}" var="cine">
              <div class="col-xs-4">
                <g:link controller="cine" action="show" id="${cine.id}"><g:img dir="/images/cinema-web/cines-pics" file="${cine.foto}" class="img-rounded show-img" style="width:82px;height:82px;" /></g:link>
              </div>
              <div class="col-xs-8">
                <g:link controller="cine" action="show" id="${cine.id}"><h4 style="margin-top:5px;margin-bottom:15px;">${cine.getNombre()}</h4></g:link>
              </div>
              <div class="col-xs-8" style="font-size:12px;">
                <p>${cine.getUbicacion()}</p>
              </div>
              <div class="col-xs-8" style="font-size:12px;margin-bottom:5px;">
                <p>${cine.getCantidadComentarios()} comentarios</p>
              </div>
            </g:each>
          </div>

          <div class="col-xs-3" style="padding:0 0;width:24%;margin-left:5px;">
            <div class="col-xs-12 borde-hm" style="padding-right:0px;height:421px;">
              <h4 style="margin-top:23px;"><i class="fa fa-users"></i> Círculos más populares</h4>
              <g:each in="${circulos}" var="circulo">
                <div class="col-xs-4">
                  <g:link controller="circulo" action="show" id="${circulo.id}"><g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" style="width:70px;height:70px;" /></g:link>
                </div>
                <div class="col-xs-8">
                  <h5 style="margin-top:5px;margin-bottom:15px;"><g:link controller="circulo" action="show" id="${circulo.id}"><strong>${circulo.getNombre()}</strong></g:link></h5>
                </div>
                <div class="col-xs-8" style="font-size:12px;margin-bottom:18px;">
                  <p>${circulo.getTags()} · ${circulo.usuarios.size()} usuarios</p>
                </div>
              </g:each>
            </div>
            <div class="col-xs-12 borde-hm" style="margin-top:27px;padding-right:0px;height:342px;">
              <h4 style="margin-top:23px;"><i class="fa fa-users"></i> Últimos Círculos</h4>
              <g:each in="${circulosUlt}" var="circulo">
                <div class="col-xs-4">
                  <g:link controller="circulo" action="show" id="${circulo.id}"><g:img dir="/images/cinema-web/circulos-pics" file="${circulo.foto}" class="img-rounded show-img" style="width:70px;height:70px;" /></g:link>
                </div>
                <div class="col-xs-8">
                  <h5 style="margin-top:5px;margin-bottom:15px;"><g:link controller="circulo" action="show" id="${circulo.id}"><strong>${circulo.getNombre()}</strong></g:link></h5>
                </div>
                <div class="col-xs-8" style="font-size:12px;margin-bottom:18px;">
                  <p>${circulo.getTags()} · ${circulo.usuarios.size()} usuarios</p>
                </div>
              </g:each>
            </div>
          </div>
        </div>

    <div class="col-md-12">
    <h3 style="margin-bottom:10px;"><i class="fa fa-film"></i> Últimas Películas agregadas</h3>
    <div class="carousel slide" id="myCarousel" data-interval="false" style="margin-top:0px;">
        <div class="carousel-inner">
          <div class="item active">
                <ul class="thumbnails" style="margin-left:-7px;">
                  <g:each in="${peliculas1}" var="pelicula">
                    <li class="span3">
                        <div class="thumbnail">
                          <g:link controller="pelicula" action="show" id="${pelicula.id}"><g:img dir="/images/cinema-web/peliculas-pics" file="${pelicula.foto}" /></g:link>
                        </div>
                    </li>
                  </g:each>
                </ul>
          </div>
          <div class="item">
                <ul class="thumbnails" style="margin-left:-7px;">
                  <g:each in="${peliculas2}" var="pelicula">
                    <li class="span3">
                        <div class="thumbnail">
                          <g:link controller="pelicula" action="show" id="${pelicula.id}"><g:img dir="/images/cinema-web/peliculas-pics" file="${pelicula.foto}" /></g:link>
                        </div>
                    </li>
                  </g:each>
                </ul>
          </div>
          <div class="item">
                <ul class="thumbnails" style="margin-left:-7px;">
                  <g:each in="${peliculas3}" var="pelicula">
                    <li class="span3">
                        <div class="thumbnail">
                          <g:link controller="pelicula" action="show" id="${pelicula.id}"><g:img dir="/images/cinema-web/peliculas-pics" file="${pelicula.foto}" /></g:link>
                        </div>
                    </li>
                  </g:each>
                </ul>
          </div>
          <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div>
    </div>
    </div>

    <div class="col-md-12" style="margin-top:30px;">
      <g:link controller="reserva" action="index">
        <img src="images/banners/reserva.gif" alt="">
      </g:link>
    </div>

    <div class="col-md-12" style="margin-top:30px;">
      <div class="col-md-8 borde-hm">
        <h3 style="margin-bottom:10px;"><i class="fa fa-comment"></i> Últimos Comentarios</h3>
          <div class="col-md-12">
            <g:each in="${comentarios}" var="comentario">
              <g:if test="${comentario.comentable.esComentableEnHome == true}">
              <h5 style="margin-bottom:0px;">
                <g:link controller="usuario" action="show" id="${comentario.autor.id}">
                  <g:img dir="/images/cinema-web/perfil-pics" file="${comentario.autor.perfil.foto}" class="img-rounded show-img" style="width:40px;height:40px;margin-bottom:1px;" />
                </g:link>
                <strong><g:link controller="usuario" action="show" id="${comentario.autor.id}">${comentario.autor.userId}</g:link> comentó en ${comentario.comentable.getNombre()}</strong>
              </h5>
              <h5>${comentario.mensaje}</h5>
              <h5>[<g:formatDate date="${comentario.fecha}"/>]</h5>
              <br />
            </g:if>
            </g:each>
          </div>
      </div>
      <div class="col-md-2">
        <img src="images/banners/publicidad.gif" alt="">
      </div>
    </div>

    <div class="col-md-12" style="margin-top:30px;">
      <a href='/cinemaweb/circulo/index'><img src="images/banners/banner-fondo.jpg" alt=""></a>
    </div>

</div>

</body>
</html>
