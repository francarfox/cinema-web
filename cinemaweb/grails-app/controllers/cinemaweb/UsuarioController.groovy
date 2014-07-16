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
				render(view: "createAdmin")
			}
			else {
				render(view: "create")
			}
		}
	
	}

	//private static final okExtension = ['image/png', 'image/jpeg', 'image/gif']

	def registrar() {

		//Verifico foto de perfil subida
		/* def foto = request.getFile('foto')
		if (!okExtension.contains(foto.getContentType())) {
		    //flash.message = "La foto debe ser de extensión: ${okExtension}"
		    render(view: "create", model: [message: "ERROR: La foto debe ser de extensión: ${okExtension}."])
		    return
		}

		String byte[] foto = foto.bytes
	  	log.info("File uploaded: $user.avatarType")
	  	*/
		
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
			//redirect(url:resource(dir:'' ))
		}
	}

	def verusuario() {
		def usuario = Usuario.findByUserId(params.nombre)
		render(view:"show", model:[usuario:usuario])
	}
}