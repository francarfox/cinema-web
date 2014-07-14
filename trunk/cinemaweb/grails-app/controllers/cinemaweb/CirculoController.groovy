package cinemaweb
import grails.converters.JSON

class CirculoController {

	static scaffold = true

    def index = {
    	def usuario = Usuario.get(params.id)

    	if (session.usuario == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
    	def circulos = Circulo.list() 
        [circulos: circulos]
    	}
    }

    def indexusuario = {

    	def circulos = Circulo.list() 
        [circulos: circulos]
    }

    def create = {

    	def usuario = Usuario.get(params.id)

    	if (session.usuario == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			render(view: "create")	
		}
	}

	def armar = {

		def usuario = Usuario.get(params.id)

		String nombre = params.nombre
		String tags = params.tags
		Usuario administrador = session.usuario

		def circulo = new Circulo(nombre: nombre,tags: tags,administrador: administrador)

		if (circulo.validate()){
			//circulo.addToUsuarios(user)
			circulo.save()
			redirect(action:"show", id:circulo.id) 
			//render(view: "show", model:[circulo:circulo, messageV: "El circulo ${circulo.nombre} se ha creado correctamente."])
		}
		else {
			render(view: "create", model:[circulo:circulo, message: "ERROR: No se han ingresado los datos correctamente."])
		}
	}

	def delete = {

		def circulo = Circulo.get(params.id)
		circulo.delete()
		return
	}

	def unirse() {

		def usuario = Usuario.get(params.id)
		def usuarioOnline = Usuario.get(session.usuario.id)
		def circulo = Circulo.get(params.id)


    	if (usuarioOnline == null){
			redirect(controller:'usuario' , action:'login')
		}
		else {
			if ( (circulo.estaUsuario(usuarioOnline)) || (usuarioOnline.getUserId() == circulo.obtenerAdministrador()) ) { 
				redirect(action: "show", id:circulo.id)
			}
			else {
				usuarioOnline.addToCirculos(circulo)
				render(view: "show", model: [circulo:circulo, messageV: "Se ha unido al circulo ${circulo.nombre} correctamente."])
			}
		}
	}

	def desunirse = {

		def usuario = Usuario.get(params.id)
		def circulo = Circulo.get(params.id)

		if (session.usuario == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			circulo.expulsarUsuario(session.usuario)
			/*JSON.use('deep')
        	render (circulo.usuarios) as JSON
        	return*/
			redirect(action:"index")
		}
	}

	def edit = {

		def usuario = Usuario.get(params.id)

		if (session.usuario == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)	
			[circulo:circulo]
		}
	}

	def actualizar = {

		def circulo = Circulo.get(params.id)

		circulo.nombre = params.nombre
		circulo.tags = params.tags
				
		if (circulo.validate()){
			circulo.save()
			render(view: "show", model: [circulo:circulo,messageV: "Los datos de su circulo han sido actualizados correctamente."])
		} else {
			render(view: "edit", model: [circulo:circulo,message: "ERROR: Los datos ingresados no son válidos."])
		}
	}


	def show = {

		def usuario = Usuario.get(params.id)

		if (session.usuario == null){
			redirect(controller:'usuario' , action:'login' )
		}
		else {
			def circulo = Circulo.get(params.id)
			if (session.usuario.getUserId() == circulo.obtenerAdministrador()) {	
				render(view:"showAdmin", model:[circulo:circulo])
			}
			else {
				if ( (circulo.estaUsuario(session.usuario)) || (session.usuario.getUserId() == circulo.obtenerAdministrador()) ) {
					[circulo:circulo]
				}
				else {
					render(view:"denegado")
					//redirect(action:"index") con mensaje de error
				}
			}
		}
	}

	def comentar = {
		def usuario = session.usuario
    	def circulo = Circulo.get(params.id)

    	usuario.comentar(circulo, params.mensaje)
    	redirect(action: "show", id:params.id)
	}

	def listarusuarios = {
		def circulo = Circulo.get(params.id)
		render(view:"listarusuarios", model:[circulo:circulo])
	}

	def listarusuarioseliminar = {
		def circulo = Circulo.get(params.id)
		render(view:"listarusuarioseliminar", model:[circulo:circulo])
	}

}
