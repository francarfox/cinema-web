import cinemaweb.*

class BootStrap {

    def init = { servletContext ->
    	if(!Usuario.count()) {
    		def perfil = new Perfil(nombre: "Federico", apellido: "Di Rocco", email: "fede.dirocco@hotmail.com")
		    new Usuario(userId:"fedecarp34", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Rosa", apellido: "Meltrozo", email: "rosamel@trozo.com")
		    new Usuario(userId:"Rosa69", password:"rosita", passwordV:"rosita", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Fran", apellido: "Fox", email: "franfox@gmail.com")
		    new Usuario(userId:"FranCarFox", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Matias", apellido: "Barro", email: "mastiasbarro@gmail.com")
		    new Usuario(userId:"mati09", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Admin", apellido: "Trator", email: "admin@gmail.com")
		    new Usuario(userId:"admin01", password:"12345", passwordV:"12345", rol:"ADMIN", perfil: perfil).save(failOnError:true)
		}

		if(!Cine.count()) {
		    new Cine(nombre: "Hoyts",ubicacion: "Parana 1234", precioBase: 12.0, apertura: "08:00", cierre: "23:00").save(failOnError:true)
		    
		}

		/*if(!Pelicula.count()) {
		    new Pelicula(titulo: "Matrix Reload").save(failOnError:true)
		    new Pelicula(titulo: "Capitan America").save(failOnError:true)
		    new Pelicula(titulo: "Volver al Futuro").save(failOnError:true)
		}*/
    }
    def destroy = {
    }
}
