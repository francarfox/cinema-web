package cinemaweb

class CineController extends BaseController{
	static scaffold = true
    def cineService

    def create = {
        def data = dataToDisplay(params,null)
        def errors = null
        if(params.submit){
            errors = this.cineService.create(params)
            if(!errors){
                redirect(action:"index")
            }        
        }

        def model = [data: data, hours: Cine.getOpenCloseHours(), errors: errors, action: "create", id: "",back: [action:"index",id:""]]
        render(view: "create",model: model)
    }


    def edit = {
        def data =  dataToDisplay(params, this.cineService.getCine(params.id))
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

    def comentar = {
    	def usuario = session.usuario
    	def cine = Cine.get(params.id)

    	usuario.comentar(cine, params.mensaje)
    	redirect(action: "show", id:params.id)
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
