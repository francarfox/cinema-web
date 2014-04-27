package cinemaweb

class PerfilController {

	static scaffold = true

	def show() {
		
		def perfil = Perfil.get(params.id)
		[perfil:perfil]

		//render view: "show", model:[ perfil: Perfil.get(params.id) ]
	}

	def update() {

	}
}
