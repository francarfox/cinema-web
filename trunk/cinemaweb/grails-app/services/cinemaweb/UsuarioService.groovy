package cinemaweb
import grails.transaction.Transactional


class UsuarioService extends DomainService {

    @Transactional
	public def create(def attributes){
		
		String nombre = attributes.nombre
		String apellido = attributes.apellido
		String email = attributes.email 
		String localidad = attributes.localidad
		String pais	= attributes.pais
		String foto	= "default.png"
		def perfil = new Perfil(nombre: nombre, apellido: apellido, email: email, localidad: localidad, pais: pais, foto: foto)

		String user = attributes.userId
		String pass = attributes.password
		String passV = attributes.passwordV
		String rol = attributes.rol
		
		if (rol == null){
			rol = "USER"
		}
		def usuario = new Usuario(userId: user, password: pass, passwordV: passV, rol: rol, perfil: perfil)

		if(usuario.validate()){
			usuario.save(flush: true)
			return null
		} else {
			usuario.discard()
			return usuario.errors.getAllErrors()
		}
		
	}

	@Transactional
	public def edit(String id, def attributes){

		def usuario = Usuario.get(id)
		
		usuario.password = attributes.password
		usuario.passwordV = attributes.passwordV
				
		if (usuario.validate()){
			usuario.save(flush: true)
			return null
		} else {
			usuario.discard()
			return usuario.errors.getAllErrors()
		}

	}

    @Transactional
	public def getDomainInstance(String id=""){
		return (id) ? Usuario.get(id) : new Usuario()
	}

	@Transactional
	public def eliminar(String id) {
		def usuario = Usuario.get(id)
		usuario.eliminarUsuario()
		return null
	}

	@Transactional
	public def logout(def session) {
		session.loggedUser = null
		session.loggedUserNombre = null
		session.loggedUserRol = null
	}

	@Transactional
	public def login(def session, Usuario usuario) {
		session.loggedUser = usuario.id
		session.loggedUserNombre = usuario.userId
		session.loggedUserRol = usuario.rol
	}

	@Transactional
	public def getListadoUsuarios() {
		return Usuario.list()
	}

	
	@Transactional
	public def get(id) {
		return getDomainInstance(id)
	}

	@Transactional
	public def getUsuarioPorNombre(nombre) {
		return Usuario.findByUserId(nombre)
	}
	
	@Transactional
	public def buscarUsuarioYPass(user, pass) {
		return Usuario.findByUserIdAndPassword(user, pass)
	}	

	@Transactional
	public def getReservasUsuario(usuarioID){
		return Usuario.get(usuarioID).reservas.sort {a,b -> a.fecha_reserva <=> b.fecha_reserva}.reverse()
	}
}
