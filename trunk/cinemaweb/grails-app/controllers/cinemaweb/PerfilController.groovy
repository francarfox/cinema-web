package cinemaweb

class PerfilController {

	static scaffold = true

	def show() {
		
		def perfil = Perfil.get(params.id)
		[perfil:perfil]

		//render view: "show", model:[ perfil: perfil.get(params.id) ] render view: "update", model:
	}

	/* def edit = {

		def perfil = Perfil.get(params.id)

		if(params.submit > 0) {
			nombre = params.nombre
			apellido = params.apellido
			email = params.email
			//foto = params.foto  
			localidad = params.localidad
			pais	= params.pais
			
			if (perfil.validate()){
				perfil.save()
				redirect(action: "show")
			} else {
				render(view: "edit", model: [perfil:perfil])
			}
		}

		[perfil:perfil]
	} */

}
