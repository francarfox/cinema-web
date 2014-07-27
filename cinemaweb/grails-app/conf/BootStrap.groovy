import cinemaweb.*

class BootStrap {

    def init = { servletContext ->
    	if(!Usuario.count()) {
    		def perfil = new Perfil(nombre: "Federico", apellido: "Di Rocco", email: "fede.dirocco@hotmail.com", foto: "default.png")
		    new Usuario(userId:"fedecarp34", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Rosa", apellido: "Meltrozo", email: "rosamel@trozo.com", foto: "default.png")
		    new Usuario(userId:"Rosa69", password:"rosita", passwordV:"rosita", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Fran", apellido: "Fox", email: "franfox@gmail.com", foto: "default.png")
		    new Usuario(userId:"FranCarFox", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Matias", apellido: "Barro", email: "mastiasbarro@gmail.com", foto: "default.png")
		    new Usuario(userId:"mati09", password:"12345", passwordV:"12345", rol:"USER", perfil: perfil).save(failOnError:true)

		    perfil = new Perfil(nombre: "Admin", apellido: "Trator", email: "admin@gmail.com", foto: "default.png")
		    new Usuario(userId:"admin01", password:"12345", passwordV:"12345", rol:"ADMIN", perfil: perfil).save(failOnError:true)
		}

		if(!Cine.count()) {
		    new Cine(nombre: "Hoyts",ubicacion: "Parana 1234", precioBase: 12.0, apertura: "08:00", cierre: "23:00").save(failOnError:true)
		    new Cine(nombre: "Showcase Norte",ubicacion: "Esteban Echeberría 456", precioBase: 65, apertura: "08:00", cierre: "23:00").save(failOnError:true)
		}

		if(!Pelicula.count()) {
		    new Pelicula(titulo: "Matrix Reload", director: "Wachowski Brothers", sinopsis: "Matrix", duracion: 120, foto:"default.png", urlTrailer:"asd").save(failOnError:true)
		    new Pelicula(titulo: "Pulp Fiction", director: "Quentin Tarantino", sinopsis: "Pulp", duracion: 180, foto:"default.png", urlTrailer:"asd").save(failOnError:true)
		}


		/*if(!Sala.count()){
			new Sala(nombre: "Hoyts Sala I", cine: Cine.get(1), filas: 10, columnas: 15).save(failOnError: true);
			new Sala(nombre: "Hoyts Sala II", cine: Cine.get(1), filas: 15, columnas: 20).save(failOnError: true);
			new Sala(nombre: "Showcase Norte Sala I", Cine.get(2), filas: 10, columnas: 15).save(failOnError: true);
		}*/
    }
    def destroy = {
    }
}
