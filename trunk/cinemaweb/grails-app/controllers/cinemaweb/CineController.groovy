package cinemaweb

class CineController extends BaseController{
    def cineService

    def create = {
        def data = this.dataToDisplay(params,null)
        def errors = null
        if(params.submit > 0){
            errors = this.cineService.create(params)
            if(!errors){
                redirect(action:"index")
            }        
        }

        [data: data, hours: Cine.getOpenCloseHours(), errors: errors, action: "create", id: "",back: [action:"index",id:""]]
    }


    def edit = {
        def data =  this.dataToDisplay(params, this.cineService.getCine(params.id))
        //def data =  dataToDisplay(params,null)
        def errors = null
        if (params.submit) {
            errors =  this.cineService.edit(params.id, params)
            if (!errors) {
                redirect(action:"show", id: params.id)
            }
        }

        def model = [data: data, hours: Cine.getOpenCloseHours(), errors: errors, action: "edit", id: params.id,back: [action:"show",id:params.id]]
        render(view: "create",model: model)
    }

    
    def show = {
    	def cine = this.cineService.getCine(params.id)

        [cine: cine]
    }

    def index = {
        def cines = this.cineService.getListadoCines()

        [cines: cines]
    }

    def delete = {
        this.cineService.delete(params.id)
        redirect(action:"index")
    }

    def comentar = {
    	def usuario = Usuario.get(session.loggedUser)
    	def cine = Cine.get(params.id)

        if(usuario == null){
            redirect(controller: "usuario", action: "login")
        }else{
    	   usuario.comentar(cine, params.mensaje)
    	   redirect(action: "show", id:params.id)
        }
    }

    def uploadPic = {
        def error = false
        if (params.submit) {
            error = this.cineService.subirFoto(params.id, "foto",request.getFile("foto"), "/cines-pics/")
            if(!error){
                redirect(action: "show", id:params.id)
            }
        }

        [cine: this.cineService.getCine(params.id), error: error]
    }

    def eliminarcomentario() {
        def comentario = Comentario.get(params.comentarioid)
        def cine = Cine.get(params.id)
        def usuario = Usuario.get(session.loggedUser)

        if(session.loggedUserRol != "ADMIN"){
            redirect(controller: "usuario", action: "login") //tiene que ser admin para eliminar comentarios
        }else{
            usuario.eliminarComentario(comentario)
            cine.eliminarComentario(comentario)
            comentario.delete()
            redirect(action:"listarcomentarios", controller:"usuario")
        }

    }


/** metodos heredados **/


    def getAtributosPorDefecto(){

        return [
                    nombre: "", 
                    ubicacion:  "",
                    precioBase: "54",
                    apertura: "08:00",
                    cierre: "23:00",
        ]
    }

}
