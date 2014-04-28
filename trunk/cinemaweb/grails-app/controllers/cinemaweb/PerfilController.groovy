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
				
		if (perfil.validate()){
			perfil.save()
			render(view: "show", model: [perfil:perfil])
		} else {
			render(view: "edit", model: [perfil:perfil])
		}
	}

}
