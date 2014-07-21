package cinemaweb

class Administrador extends Usuario {

    static constraints = {
    }

    def cambiarRol(usuario) {
    	String userId = usuario.userId
		String password = usuario.password
		String passwordV = usuario.passwordV
		Perfil perfil = usuario.perfil
		Date cuentaCreada = usuario.cuentaCreada
		String rol = "ADMIN"
    	Set<Circulo> circulos = usuario.circulos

    	def admin = new Administrador(userId: userId, password: password, passwordV: passwordV, rol: rol, perfil: perfil, circulos: circulos)

    	if (admin.validate()) {
			admin.save()
			usuario.eliminarUsuario()
			return true
		}
		else {
			return false //error
		}
	}

	
	
}
