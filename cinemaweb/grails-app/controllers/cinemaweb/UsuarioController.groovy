package cinemaweb

class UsuarioController {
	static scaffold = true

	//Verificacion de diferentes usuarios y denegacion de acciones
	def beforeInterceptor = [action:this.&verifUser, 
								except:["create", "list", "index", "login", "registrar", "logout", "validar", "actualizar", 
								"eliminar", "show"]]  //Dejo como ejemplo el edit que siendo usuario no puede entrar

	private verifUser() {

		if (session.usuario == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
	   	else {
	   		if (session.usuario.rol == "USER"){
		     	render(view:"denegado")
	     	}
	   	}
	}
	//!Verificacion de diferentes usuarios y denegacion de acciones

	def create = {

		if (session.usuario == null){
			render(view: "create")
		}
		else {
			if (session.usuario.rol == "ADMIN"){
				render(view: "createAdmin")
			}
			else {
				render(view: "create")
			}
		}
	
	}

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
		String rol = params.rol
		if (rol == null){
			rol = "USER"
		}
		def usuario = new Usuario(userId: user, password: pass, passwordV: passV, rol: rol, perfil: perfil)


		if (usuario.validate()) {
			usuario.save()
			render(view: "login", model: [usuario:usuario,messageV: "Bienvenido ${usuario.perfil.nombre} ${usuario.perfil.apellido} a CinemaWeb."])
		} else {
			render(view: "create", model: [usuario:usuario,message: "ERROR: No ha registrado correctamente los datos."])
		}

	}

	def edit = {

		if (session.usuario == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)	
			[usuario:usuario]
		}
	}

	def actualizar = {

		def usuario = Usuario.get(params.id)

		usuario.password = params.password
		usuario.passwordV = params.passwordV
				
		if (usuario.validate()){
			usuario.save()
			render(view: "show", model: [usuario:usuario,messageV: "Los datos de su usuario han sido actualizados correctamente."])
		} else {
			render(view: "edit", model: [usuario:usuario,message: "ERROR: Ambas contraseñas no coinciden."])
		}
	}

	def show = {

		if (session.usuario == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)	
			[usuario:usuario]
		}
	}

	def eliminar = {

		if (session.usuario == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)
			usuario.delete()
			redirect(action:logout) //Mejorar esto
		}
		
	}

	def login = {

	}

	def validar = {

		def usuario = Usuario.findByUserId(params.userId)
		
		if (usuario && usuario.password == params.password){
		session.usuario = usuario
		render(view: "show", model: [usuario:usuario]) //redirect(controller:'' , action:'' )
		} else {
			render(view: "login", model: [message: "ERROR: Nombre de usuario y contraseña invalidos."])
		}

	}

	def logout = {

		if (session.usuario != null) {
			session.usuario = null
			render(view:"logout")
			//redirect(url:resource(dir:'' ))
		}
	}

}
