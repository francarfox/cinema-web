package cinemaweb
import grails.converters.JSON

class UsuarioController {
	
	static scaffold = true
	def usuarioService
	def circuloService

	def index() {
		if (session.loggedUser == null) {
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
    		def usuarios = this.usuarioService.getListadoUsuarios()
    		[usuarios: usuarios]
    	}
    }

	def create() {

	}

	def registrar() {
		def errors = null
        if(params.submit) {
            errors = this.usuarioService.create(params)
            if(!errors) {
                render(view: "login", model: [messageV: "Bienvenido ${params.nombre} ${params.apellido} a CinemaWeb."])
            } else {
				render(view: "create", model:[params:params, errors: errors])    
        	}
        } else {
        	render(view:"denegado") //Cambiar lo que dice en la frase
        }
	}

	def edit() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def usuario = Usuario.get(session.loggedUser)	
			[usuario:usuario]
		}
	}

	def actualizar() {
		if (session.loggedUser == null) {
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def usuario = Usuario.get(session.loggedUser)
			def perfil = Perfil.get(params.id)
			def errors = null
        	if (params.submit) {
            	errors =  this.usuarioService.edit(params.id,params)
            	if (!errors) {
                	render(view: "show", model:[usuario:usuario, perfil:perfil, messageV: "Los datos de su usuario han sido actualizados correctamente."])
            	} else {
        			render(view: "edit", model:[usuario:usuario, params:params, errors:errors])
        		} 
        	}
        }
	}

	def show() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def usuario = Usuario.get(params.id)
			def perfil = Perfil.get(params.id)
			[usuario:usuario, perfil:perfil]
		}
	}

	def eliminar() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def errors = this.usuarioService.eliminar(params.id)
			//this.usuarioService.delete(params.id)
			if (!errors) {
				redirect(action:"logout")
			}
		}
	}

	def login() { 

	}

	def validar() {
		def usuario = Usuario.findByUserIdAndPassword(params.userId,params.password) 

		if (usuario != null){
			this.usuarioService.login(session,usuario)
			render(view: "show", model:[usuario:usuario,perfil:usuario.perfil])
		} else {
			render(view: "login")
		}
	}

	def logout() {
		if (session.loggedUser != null) {
			this.usuarioService.logout(session)
			redirect(uri: "") //Vuelvo al home
		}
	}


	///////////////////// Metodos para admin ///////////////////////////

	def cambiarrol() {
    	def usuario = Usuario.get(params.id)

    	if (usuario.rol == "USER") {
    		usuario.rol = "ADMIN"
			redirect(action: "index")
		}
		else {
			usuario.rol = "USER"
			redirect(action: "index")
		}
		
    }

    def paneladministrador() {
    	
    }

    def eliminarusuario() {
		if (session.loggedUser == null){
			render(view: "login", model: [message: "ERROR: Debe loguearse para realizar esta acción."])
		} else {
			def errors = this.usuarioService.eliminar(params.id)
			if (!errors) {
				redirect(action: "index")
			}
		}
		
	}

	def listarcirculos() {
    	if (session.loggedUserRol == "ADMIN") {
    		def circulos = this.circuloService.getListadoCirculos()
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
			circulo.eliminarCirculo()
			redirect(action: "listarcirculos")
		}
		
	}

	def listarencuestas() {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login')
		}
		else {
    		def circulos = Circulo.list()
    		[circulos:circulos]
    	}
	}

	def listarcomentarios() {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login')
		}
		else {
    		def circulos = Circulo.list()
    		def peliculas = Pelicula.list()
    		def cines = Cine.list()
    		[circulos:circulos,peliculas:peliculas,cines:cines]
    	}
	}

	def verusuario() { //Ver un usuario a partir de un string nombre
		def usuario = Usuario.findByUserId(params.nombre)
		def perfil = Perfil.get(usuario.id)
		render(view:"show", model:[usuario:usuario,perfil:perfil]) //redirect(action: "show", id:usuario.id)
	}
}
