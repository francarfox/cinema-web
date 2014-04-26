package cinemaweb

class UsuarioController {
	static scaffold = true

	def crearNuevo = {
		String nombre = params.nombre
		String apellido = params.apellido
		String email = params.email
		byte[] foto = params.foto  //ver dsp para cargar una foto
		String localidad = params.localidad
		String pais	= params.pais
		def perfil = new Perfil(nombre: nombre, apellido: apellido, email: email, localidad: localidad, pais: pais)

		String user = params.userId
		String pass = params.password
		String passV = params.passwordV
		def usuario = new Usuario(userId: user, password: pass, passwordV: passV, perfil: perfil)

		usuario.save(failOnError: true)
		redirect(action: "index")
	}
}
