package cinemaweb
import grails.converters.JSON

class PeliculaController {
	static scaffold = true

  def index = {
     def movies = Pelicula.list()
     [movies: movies]
  }


  def create = {
    def movie = null;
    if(params.submit > 0){
      movie = this.loadMovie(params)
      if(!movie.hasErrors()){
        redirect(action:"show",id: movie.id)
      }
    }

    [movie: movie]
  }


  def edit = {
      def movie = null;
      if(params.submit > 0){
        movie = this.loadMovie(params)
        if(!movie.hasErrors()){
          redirect(action:"show",id: movie.id)
        }
      }else{
        movie = Pelicula.get(params.id)
      }

      [movie:movie]
  }


  /*def show = {
   def pelicula = Pelicula.get(params.id)
   def comentarios = pelicula.obtenerComentarios()

   [pelicula: pelicula, comentarios: comentarios]
 }*/

 def show = {
    def movie = Pelicula.get(params.id)
    [movie: movie]
 }

 def comentar = {
  def usuario = session.usuario
  def pelicula = Pelicula.get(params.id)

  if(usuario == null)
    redirect(controller: "Usuario", action: "login")
  else{
    usuario.comentar(pelicula, params.mensaje)
    redirect(action: "show", id: params.id)
  }
 }

 def puntuar = {
   def usuario = session.usuario
   def pelicula = Pelicula.get(params.id)

   usuario.puntuar(pelicula, params.puntos)
   redirect(action: "show", id: params.id)
 }


    //funciones auxiliares

    private def loadMovie(def params){
      def movie = null

      if(params.id){
        movie = Pelicula.get(params.id)
        }else{
          movie = new Pelicula()
        }

        movie.titulo  = params.titulo ?: ""
        movie.director = params.director ?: ""
        movie.sinopsis = params.sinopsis ?: ""
        movie.duracion = params.duracion.toInteger()
        movie.urlTrailer = params.trailer ?: ""
        movie.foto = ""

        
        if(movie.validate()){
                //String picPath = this.subirFoto()
                //movie.pic = picPath
                movie.save()
              }

              return movie
            }

          }
