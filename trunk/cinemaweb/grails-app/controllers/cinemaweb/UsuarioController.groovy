package cinemaweb
import grails.converters.JSON

class UsuarioController {
	
	static scaffold = true

	//Verificacion de diferentes usuarios y denegacion de acciones
	def beforeInterceptor = [action:this.&verifUser, 
								except:["create", "list", "index", "login", "registrar", "logout", "validar", "actualizar", 
								"eliminar", "show"]]  //Dejo como ejemplo el edit que siendo USER no puede entrar

	private verifUser() {

		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
	   	else {
	   		def usuario = Usuario.get(session.loggedUser)

	   		if (usuario.rol == "USER"){
		     	render(view:"denegado")
	     	}
	   	}
	}
	//!Verificacion de diferentes usuarios y denegacion de acciones

	def create() {

		if (session.loggedUser == null){
			render(view: "create")
		}
		else {
			def usuario = Usuario.get(session.loggedUser) 

			if (usuario.getRol() == "ADMIN"){
				render(view: "createAdmin") //redirect(action:"create", controller:"administrador")
			}
			else {
				render(view: "create")
			}
		}
	
	}

	def registrar() {
		
		String nombre = params.nombre
		String apellido = params.apellido
		String email = params.email 
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

	def edit() {

		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)	
			[usuario:usuario]
		}
	}

	def actualizar() {

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

	def show() {

		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)	
			[usuario:usuario]
		}
	}

	def eliminar() {

		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)
			usuario.eliminarUsuario()
			session.loggedUser = null
			session.loggedUserRol = null
			return 
		}
		
	}

	def login() { 

	}

	def validar() {

		def usuario = Usuario.findByUserIdAndPassword(params.userId,params.password) 

		if (usuario != null){
			session.loggedUser = usuario.id
			session.loggedUserNombre = usuario.userId
			session.loggedUserRol = usuario.rol
			render(view: "show", model: [usuario:usuario]) 
		} 
		else {
			render(view: "login", model: [message: "ERROR: Nombre de usuario y contraseña invalidos."])
		}

	}

	def logout() {

		if (session.loggedUser != null) {
			session.loggedUser = null
			session.loggedUserNombre = null
			session.loggedUserRol = null
			render(view:"logout")
		}
	}

	def verusuario() {
		def usuario = Usuario.findByUserId(params.nombre)
		render(view:"show", model:[usuario:usuario]) //redirect(action: "show", id:usuario.id)
	}


	///////////////////// Metodos para admin ///////////////////////////

	def cambiarrol() {
    	def usuario = Usuario.get(params.id)

    	if (usuario.rol == "USER") {
    		usuario.rol = "ADMIN"
			redirect(action: "listarusuarios")
		}
		else {
			usuario.rol = "USER"
			redirect(action: "show", id:usuario.id)
		}
		
    }

    def paneladministrador() {
    	
    }

    def listarusuarios() {
    	def loggedUser = Usuario.get(session.loggedUser)

    	if (loggedUser.getRol() == "ADMIN") {
    		def usuarios = Usuario.list()
    		[usuarios: usuarios]
    	}
    	else {
    		render(view:"denegado")
    	}
    }

    def eliminarusuario() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def usuario = Usuario.get(params.id)
			usuario.eliminarUsuario()
			redirect(action: "listarusuarios")
		}
		
	}

	def listarcirculos() {
    	def loggedUser = Usuario.get(session.loggedUser)

    	if (loggedUser.getRol() == "ADMIN") {
    		def circulos = Circulo.list()
    		[circulos: circulos]
    	}
    	else {
    		render(view:"denegado")
    	}
    }

    def eliminarcirculo() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		}
		else {
			def circulo = Circulo.get(params.id)
			circulo.eliminarUsuarios()
			circulo.eliminarCirculo()
			redirect(action: "listarcirculos")
		}
		
	}
}
