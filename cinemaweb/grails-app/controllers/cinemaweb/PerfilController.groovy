package cinemaweb

class PerfilController {

	static scaffold = true

	def show = {
		
		def perfil = Perfil.get(params.id)
		[perfil:perfil]

		//render view: "show", model:[ perfil: perfil.get(params.id) ] 
	}

	def edit = {

		def perfil = Perfil.get(params.id)
		[perfil:perfil]
		
	}

	def actualizar = {

		def perfil = Perfil.get(params.id)

		perfil.nombre = params.nombre
		perfil.apellido = params.apellido
		perfil.email = params.email
		perfil.localidad = params.localidad
		perfil.pais = params.pais
		//perfil.foto = params.foto
				
		if (perfil.validate()){
			perfil.save()
			render(view: "show", model: [perfil:perfil,messageV: "Los datos de su perfil han sido actualizados correctamente."])
		} else {
			render(view: "edit", model: [perfil:perfil,message: "ERROR: Los datos son incorrectos."])
		}
	}

	//Closure para mostrar la imagen de perfil por pantalla
	/*def imagen = {

		def perfil = Perfil.get(params.id)
		byte[] foto = perfil.foto
	  	
	  	response.contentType = foto.getContentType()
	  	response.contentLength = foto.size()
	  	OutputStream out = response.outputStream
	  	out.write(foto)
	  	out.close()

	}*/
}
