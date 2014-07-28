package cinemaweb

class PerfilController {

	static scaffold = true
	def fileService
	def perfilService

	def show() {
		redirect(action:"show", controller:"usuario", id:params.id)
	}

	def edit() {
		def perfil = Perfil.get(params.id)
		[perfil:perfil]
	}

	def actualizar() {
		if (session.loggedUser == null) {
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def perfil = Perfil.get(params.id)
			def usuario = Usuario.get(session.loggedUser)

			def errors = null
        	if(params.submit) {
            	errors = this.perfilService.edit(perfil,params)
            	if(!errors) {
                	redirect(action: "show", id:params.id)
            	} else {
					render(view:"edit", model:[perfil:perfil, errors:errors])   
        		}
        	}
        }
	}

	def uploadPic() {
		def perfil = Perfil.get(params.id)

		def error = false
    	if (params.submit) {
        	error = this.perfilService.subirFoto(params.id, "foto",request.getFile("foto"), "/perfil-pics/")
        	if(!error){
        		redirect(action: "show", id:params.id)
        } else {
          		error = true
         	}
    	}
    	[perfil:perfil, error:error]
	}

}
