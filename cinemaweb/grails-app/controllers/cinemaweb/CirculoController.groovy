package cinemaweb
import grails.converters.JSON

class CirculoController {

	static scaffold = true

    def index() {
    	def usuario = Usuario.get(params.id)

    	if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
    		def circulos = Circulo.list() 
    		def loggedUser = Usuario.get(session.loggedUser)
        	[circulos: circulos, loggedUser: loggedUser]
    	}
    }

    def indexusuario() {
    	def circulos = Circulo.list() 
    	def loggedUser = Usuario.get(session.loggedUser)
        [circulos: circulos, loggedUser: loggedUser]
    }

    def create() {
    	if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			render(view: "create")	
		}
	}

	def armar() {
		def usuario = Usuario.get(session.loggedUser)
		String nombre = params.nombre
		String tags = params.tags 

		def circulo = new Circulo(nombre: nombre,tags: tags,administrador: usuario.getUserId())

		if (circulo.validate()){
			circulo.save()
			usuario.addToCirculos(circulo)
			redirect(action:"show", id:circulo.id) //render(view: "show", model:[circulo:circulo, messageV: "El circulo ${circulo.nombre} se ha creado correctamente."])
		}
		else {
			render(view: "create", model:[circulo:circulo, message: "ERROR: No se han ingresado los datos correctamente."])
		}
	}

	def delete() {
		def circulo = Circulo.get(params.id)
		circulo.eliminarCirculo()
		return
	}

	def unirse() {
		def usuarioOnline = Usuario.get(session.loggedUser)
		def circulo = Circulo.get(params.id)

    	if (usuarioOnline == null){
			redirect(controller:'usuario' , action:'login')
		}
		else {
			if ( circulo.estaUsuario(usuarioOnline) ) {
				redirect(action: "show", id:circulo.id)
			}
			else {
				usuarioOnline.addToCirculos(circulo)
				render(view: "show", model: [circulo:circulo, messageV: "Se ha unido al circulo ${circulo.nombre} correctamente."])
			}
		}
	}

	def desunirse() {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)
			def loggedUser = Usuario.get(session.loggedUser)

			loggedUser.removeFromCirculos(circulo)
			redirect(action:"index")
		}
	}

	def eliminarusuario(Integer userid) {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)
			def usuarioAEliminar = Usuario.get(userid)

			usuarioAEliminar.removeFromCirculos(circulo)
			redirect(action:"index")
		}
	}

	def edit() {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)
			def loggedUser = Usuario.get(session.loggedUser)

			if (loggedUser.getUserId() == circulo.getAdministrador()) {
				[circulo:circulo]
			}
			else {
				render(view:"denegado")
			}
		}
	}

	def actualizar() {
		def circulo = Circulo.get(params.id)

		circulo.nombre = params.nombre
		circulo.tags = params.tags
				
		if (circulo.validate()){
			circulo.save()
			render(view: "showAdmin", model: [circulo:circulo,messageV: "Los datos de su circulo han sido actualizados correctamente."])
		} else {
			render(view: "edit", model: [circulo:circulo,message: "ERROR: Los datos ingresados no son válidos."])
		}
	}


	def show() {
		if (session.loggedUser == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)
			def loggedUser = Usuario.get(session.loggedUser)

			if (loggedUser.getUserId() == circulo.getAdministrador()) {
				render(view:"showAdmin", model:[circulo:circulo])
			}
			else {
				if (circulo.estaUsuario(loggedUser)) {
					[circulo:circulo]
				}
				else {
					render(view:"denegado")
					//redirect(action:"index") con mensaje de error
				}
			}
		}
	}

	def comentar() {
		def loggedUser = Usuario.get(session.loggedUser)
    	def circulo = Circulo.get(params.id)

    	loggedUser.comentar(circulo, params.mensaje)
    	redirect(action: "show", id:params.id)
	}

	def listarusuarios() {
		def circulo = Circulo.get(params.id)
		[circulo:circulo]
	}

	def listarusuarioseliminar() {
		def circulo = Circulo.get(params.id)
		//def lista = circulo.mostrarUsuariosSinAdmin()
		[circulo:circulo] //,lista:lista
	}

}
