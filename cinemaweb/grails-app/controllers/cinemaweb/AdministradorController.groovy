package cinemaweb

class AdministradorController extends UsuarioController {

    def create() {}

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

    	if (rol == "USER"){
			def usuario = new Usuario(userId: user, password: pass, passwordV: passV, rol: rol, perfil: perfil)

			if (usuario.validate()) {
				usuario.save()
				redirect(action: "login", controller:"usuario", model: [usuario:usuario,messageV: "Bienvenido ${usuario.perfil.nombre} ${usuario.perfil.apellido} a CinemaWeb."])
			} else {
				render(view: "create", model: [usuario:usuario,message: "ERROR: No ha registrado correctamente los datos."])
			}

		} else {
			if (rol == "ADMIN") {
				def admin = new Administrador(userId: user, password: pass, passwordV: passV, rol: rol, perfil: perfil)
			
				if (admin.validate()) {
					admin.save()
					redirect(action: "login", controller:"usuario", model: [usuario:usuario,messageV: "Bienvenido ${usuario.perfil.nombre} ${usuario.perfil.apellido} a CinemaWeb."])
				} else {
					render(view: "create", model: [usuario:admin,message: "ERROR: No ha registrado correctamente los datos."])
				}
					}
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
