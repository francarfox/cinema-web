package cinemaweb

class UsuarioController {
	static scaffold = true

	def registrar = {
		
		String nombre = params.nombre
		String apellido = params.apellido
		String email = params.email
		//byte[] foto = params.foto  
		String localidad = params.localidad
		String pais	= params.pais
		def perfil = new Perfil(nombre: nombre, apellido: apellido, email: email, localidad: localidad, pais: pais)

		String user = params.userId
		String pass = params.password
		String passV = params.passwordV
		def usuario = new Usuario(userId: user, password: pass, passwordV: passV, perfil: perfil)


		if (usuario.validate()) {
			usuario.save()
			flash.message = "Bienvenido ${usuario.perfil.nombre} ${usuario.perfil.apellido}"
			redirect(action: "index")
		} else {
			flash.message = "Error en la registracion del usuario"
			render(view: "create", model: [usuario:usuario])
		}

	}

	def edit = {

		def usuario = Usuario.get(params.id)	
		[usuario:usuario]

	}

	def actualizar = {

		def usuario = Usuario.get(params.id)

		usuario.password = params.password
		usuario.passwordV = params.passwordV
				
		if (usuario.validate()){
			usuario.save()
			render(view: "show", model: [usuario:usuario])
		} else {
			render(view: "edit", model: [usuario:usuario])
		}
	}

	def show = {

		def usuario = Usuario.get(params.id)	
		[usuario:usuario]
	}

	def eliminar = {

		def usuario = Usuario.get(params.id)
		usuario.delete()
		
	}

	def login = {

	}

	def validar = {

		def usuario = Usuario.findByUserId(params.userId)
		
		if (usuario && usuario.password == params.password){
		session.usuario = usuario
		render(view: "show", model: [usuario:usuario]) //redirect(controller:'' , action:'' )
		} else {
			flash.message = "Nombre de usuario y contraseña invalidos."
			render(view:"login")
		}

	}

	def logout = {

		if (session.usuario != null) {
			session.usuario = null
			render(view:"logout")
			//redirect(url:resource(dir:'' ))
		} else {
			render "HOLA YA TE DESLOGUEASTE OK?"
			return
		}
	}
}
