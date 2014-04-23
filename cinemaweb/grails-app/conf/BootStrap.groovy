import cinemaweb.*

class BootStrap {

    def init = { servletContext ->
    	if(!Usuario.count()) {
    		def perfil = new Perfil(nombre: "Esteban", apellido: "Quito", email: "esteban@quito.com")
		    new Usuario(userId:"usuario", password:"123abc", passwordV:"123abc", perfil: perfil).save(failOnError:true)
		}

		if(!Cine.count()) {
		    new Cine(nombre: "Hoyts").save(failOnError:true)
		    new Cine(nombre: "Cinemark").save(failOnError:true)
		}

		if(!Pelicula.count()) {
		    new Pelicula(titulo: "Matrix Reload").save(failOnError:true)
		    new Pelicula(titulo: "Capitan America").save(failOnError:true)
		    new Pelicula(titulo: "Volver al Futuro").save(failOnError:true)
		}
    }
    def destroy = {
    }
}
