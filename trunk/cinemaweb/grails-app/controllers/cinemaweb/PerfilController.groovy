package cinemaweb

class PerfilController {

	static scaffold = true
	def fileService

	def show() {
		
		redirect(action:"show", controller:"usuario", id:params.id)
	}

	def edit() {

		def perfil = Perfil.get(params.id)
		[perfil:perfil]
		
	}

	def actualizar() {

		def perfil = Perfil.get(params.id)
		def usuario = Usuario.get(session.loggedUser)

		perfil.nombre = params.nombre
		perfil.apellido = params.apellido
		perfil.email = params.email
		perfil.localidad = params.localidad
		perfil.pais = params.pais

		if (perfil.validate()){
			perfil.save()
			redirect(action: "show", id:params.id)
		} else {
			render(view:"edit", model:[perfil:perfil])
			return
		}
	}

	def uploadPic() {
    	def perfil = Perfil.get(params.id)
    	def error = false
    	if (params.submit) {
        	String fileName = params.id + "-perfil.jpg"
         	String filePath = "/perfil-pics/" + fileName
         	if(fileService.uploadFile(request.getFile("foto"),filePath)){
          		perfil.foto = fileName
          		perfil.save()
          		redirect(action:"show", id: perfil.id)
         	} else {
          		error = true
         	}
    	}
    	[perfil: perfil, error: error]
	}
}
