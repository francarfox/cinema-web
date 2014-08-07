package cinemaweb
import grails.converters.JSON

class PeliculaController {
	static scaffold = true
  def peliculaService
  def comentarioService
  def fileService

  def index = {
     def movies = peliculaService.listPorNombre()
     [movies: movies]
  }


  def create = {
    def movie = null;
    if(params.submit){
      movie = this.loadMovie(params)
      movie.foto = "default.png"
      if(!movie.hasErrors()){
        redirect(action:"show",id: movie.id)
      }
    }

    [movie: movie, generos: peliculaService.getGeneros()]
  }


  def edit = {
      def movie = null;
      if(params.submit){
        movie = this.loadMovie(params)
        if(!movie.hasErrors()){
          redirect(action:"show",id: movie.id)
        }
      }else{
        movie = peliculaService.get(params.id)
      }

      [movie:movie, generos: peliculaService.getGeneros()]
  }


  /*def show = {
   def pelicula = Pelicula.get(params.id)
   def comentarios = pelicula.obtenerComentarios()

   [pelicula: pelicula, comentarios: comentarios]
 }*/

 def show(){
    def movie = peliculaService.get(params.id)
    [movie: movie, listaGeneros: peliculaService.getGeneros()]
 }

 def comentar(){
  def usuario = Usuario.get(session.loggedUser)
  def pelicula = peliculaService.get(params.id)

  if(usuario == null)
    redirect(controller: "Usuario", action: "login")
  else{
    usuario.comentar(pelicula, params.mensaje)
    redirect(action: "show", id: params.id)
  }
 }

 def puntuar(){
   def usuario = Usuario.get(session.loggedUser)
   def pelicula = peliculaService.get(params.id)

   if(usuario == null)
    redirect(controller: "Usuario", action: "login")
    else{
    usuario.puntuar(pelicula, params.puntos)
    redirect(action: "show", id: params.id)
    }
 }

def listarpeliculas(){
  if(session.loggedUserRol == "ADMIN"){
   
   [peliculas: peliculaService.listPorNombre(), generosPelicula: peliculaService.getGeneros()]
   
   }else{
    render(view:"denegado")
   }
}

def eliminarpelicula(){
   def pelicula = peliculaService.get(params.id)
   pelicula.comentarios.each{
        pelicula.eliminarComentario(it)
        it.delete()
   }

   pelicula.delete()

   redirect(action:"listarpeliculas")
}


def uploadPic(){
    def movie = peliculaService.get(params.id)
    def error = false
    if (params.submit){
         String fileName = params.id + "-pelicula.jpg"
         String filePath = "/peliculas-pics/" + fileName
         if(fileService.uploadFile(request.getFile("foto"),filePath)){
          movie.foto = fileName
          movie.save()
          redirect(action:"show", id: movie.id)
         }else{
          error = true
         }
    }

    [movie: movie, error: error]
}

    def eliminarcomentario() {
        def comentario = comentarioService.get(params.comentarioid)
        def pelicula = peliculaService.get(params.id)
        def usuario = Usuario.get(session.loggedUser)

        if(session.loggedUserRol != "ADMIN"){
            redirect(controller: "usuario", action: "login") //tiene que ser admin para eliminar comentarios
        }else{
            usuario.eliminarComentario(comentario)
            pelicula.eliminarComentario(comentario)
            comentario.delete()
            redirect(action:"listarcomentarios", controller:"usuario")
        }

    } 


    //funciones auxiliares

    private def loadMovie(def params){
      def movie = null

      if(params.id){
        movie = peliculaService.get(params.id)
        }else{
          movie = new Pelicula()
        }

        movie.nombre  = params.nombre ?: ""
        movie.director = params.director ?: ""
        movie.sinopsis = params.sinopsis ?: ""
        movie.duracion = params.duracion.toInteger()
        movie.genero = params.genero.toInteger()
        movie.foto = ""

        
        if(movie.validate()){
                movie.save()
              }

              return movie
            }

  }
