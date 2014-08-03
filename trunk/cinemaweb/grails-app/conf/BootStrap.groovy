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
		    new Cine(nombre: "Hoyts Unicenter",ubicacion: "Parana 1234, Martinez", precioBase: 12.0, apertura: "08:00", cierre: "23:00", foto:"hoyts.png").save(failOnError:true)
		    new Cine(nombre: "Showcase Norte",ubicacion: "Esteban Echeberría 456, Martinez", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"showcase..png").save(failOnError:true)
		    new Cine(nombre: "Hoyts Abasto",ubicacion: "Av. Corrientes 3200, Abasto", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"hoyts.png").save(failOnError:true)
		    new Cine(nombre: "Village Caballito",ubicacion: "Av. Rivadavia 5071, Caballito", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"village.png").save(failOnError:true)
		    new Cine(nombre: "Belgrano Multiplex",ubicacion: "Vuelta de Obligado 2237, Belgrano", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"multiplex.png").save(failOnError:true)
		    new Cine(nombre: "Atlas Patio Bullrich",ubicacion: "Av. del Libertador 750,Recoleta", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"atlas.png").save(failOnError:true)
		    new Cine(nombre: "Showcase Belgrano",ubicacion: "Monroe 1655, Belgrano", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"showcase.png").save(failOnError:true)
		    new Cine(nombre: "Cultural San Martín",ubicacion: "Sarmiento 1551, Monserrat", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"centroculturalsanmartin.png").save(failOnError:true)
		    //new Cine(nombre: "Arte Cinema",ubicacion: "Salta 1620, CABA", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"default.png").save(failOnError:true)
		    new Cine(nombre: "Cinemark Palermo",ubicacion: "Beruti 3399, Palermo", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"cinemark.png").save(failOnError:true)
			new Cine(nombre: "Arteplex Belgrano",ubicacion: "Av. Cabildo 2829, Belgrano", precioBase: 65, apertura: "08:00", cierre: "23:00", foto:"arteplex.png").save(failOnError:true)
		}

		if(!Pelicula.count()) {
		    new Pelicula(titulo: "Matrix Reload", director: "Wachowski Brothers", sinopsis: "Matrix", duracion: 120, foto:"default.png", urlTrailer:"asd").save(failOnError:true)
		    new Pelicula(titulo: "Pulp Fiction", director: "Quentin Tarantino", sinopsis: "Pulp", duracion: 180, foto:"default.png", urlTrailer:"asd").save(failOnError:true)
		    new Pelicula(titulo: "Mujeres al ataque", director: "Nick Cassavetes", sinopsis: "Comedia", duracion: 109, foto:"mujeres-al-ataque.jpg", urlTrailer:"asd",puntos: 19).save(failOnError:true)
		    new Pelicula(titulo: "X-Men: Días del futuro pasado", director: "Bryan Singer", sinopsis: "Comic", duracion: 131, foto:"x-men-dias-del-futuro-pasado.jpg", urlTrailer:"asd",puntos: 52).save(failOnError:true)
		    new Pelicula(titulo: "7 cajas", director: "Juan Carlos Maneglia, Tana Schémbori", sinopsis: "Suspenso", duracion: 105, foto:"7-cajas.jpg", urlTrailer:"asd",puntos: 22).save(failOnError:true)
		    new Pelicula(titulo: "Malefica", director: "Robert Stromberg", sinopsis: "Fantasia", duracion: 97, foto:"malefica.jpg", urlTrailer:"asd",puntos: 28).save(failOnError:true)
		    new Pelicula(titulo: "Oculus", director: "Mike Flanagan", sinopsis: "Terror", duracion: 104, foto:"oculus.jpg", urlTrailer:"asd",puntos: 29).save(failOnError:true)
		    new Pelicula(titulo: "El inventor de juegos", director: "Juan Pablo Buscarini", sinopsis: "Aventuras", duracion: 111, foto:"el-inventor-de-juegos.jpg", urlTrailer:"asd",puntos: 18).save(failOnError:true)
		    new Pelicula(titulo: "Socios por accidente", director: "Fabián Forte, Nicanor Loreti", sinopsis: "Comedia", duracion: 82, foto:"socios-por-accidente.jpg", urlTrailer:"asd",puntos: 6).save(failOnError:true)
		    new Pelicula(titulo: "El planeta de los simios: Confrontación", director: "Matt Reeves", sinopsis: "Aventuras", duracion: 130, foto:"el-planeta-de-los-simios-confrontacion.jpg", urlTrailer:"asd",puntos: 20).save(failOnError:true)
		    new Pelicula(titulo: "12 horas para sobrevivir", director: "James DeMonaco", sinopsis: "Suspenso", duracion: 103, foto:"12-hrs-para-sobrevivir.jpg", urlTrailer:"asd", puntos: 23).save(failOnError:true)
		    new Pelicula(titulo: "Bañeros 4: Los rompeolas", director: "Rodolfo Ledo", sinopsis: "Comedia", duracion: 85, foto:"baneros-4-los-rompeolas.jpg", urlTrailer:"asd", puntos: 22).save(failOnError:true)
		    new Pelicula(titulo: "Transformers 4", director: "Michael Bay", sinopsis: "Acción", duracion: 165, foto:"transformers-4.jpg", urlTrailer:"asd",puntos: 20).save(failOnError:true)
		    new Pelicula(titulo: "Guardianes de la Galaxia", director: "James Gunn", sinopsis: "Ciencia Ficción", duracion: 120, foto:"guardianes-de-la-galaxia.jpg", urlTrailer:"asd",puntos: 15).save(failOnError:true)
		    new Pelicula(titulo: "Bajo la misma estrella", director: "Josh Boone", sinopsis: "Drama", duracion: 126, foto:"bajo-la-misma-estrella.jpg", urlTrailer:"asd",puntos: 12).save(failOnError:true)
		    new Pelicula(titulo: "Aviones 2: Equipo de rescate", director: "Roberts Gannaway", sinopsis: "Animación", duracion: 83, foto:"aviones-2-equipo-de-rescate.jpg", urlTrailer:"asd",puntos: 18).save(failOnError:true)
		    new Pelicula(titulo: "Los indestructibles 3", director: "No informado", sinopsis: "Acción", duracion: 100, foto:"los-indestructibles-3.jpg", urlTrailer:"asd",puntos: 0).save(failOnError:true)
		    new Pelicula(titulo: "Hercules", director: "Brett Ratner", sinopsis: "Acción", duracion: 120, foto:"hercules.jpg", urlTrailer:"asd",puntos: 0).save(failOnError:true)
		    new Pelicula(titulo: "Los Caballeros del Zodiaco", director: "No informado", sinopsis: "Animación", duracion: 90, foto:"los-caballeros-del-zodiaco.jpg", urlTrailer:"asd",puntos: 0).save(failOnError:true)

		}

		if(!Circulo.count()) {
			def user = Usuario.get(4)//mati09
			def circ = new Circulo(nombre: "StarWars fanaticos", tags: "Acción", administrador: user.getUserId(), foto: "circulo-starwars.jpg").save(failOnError:true)
			user.addToCirculos(circ)
			user = Usuario.get(2) //Rosa69
			user.addToCirculos(circ)

			user = Usuario.get(2) //Rosa69
			circ = new Circulo(nombre: "Solo terror", tags: "Terror", administrador: user.getUserId(), foto: "circulo-terror.jpg").save(failOnError:true)
			user.addToCirculos(circ)

			user = Usuario.get(1) //fedecarp34
			circ = new Circulo(nombre: "Juntada por viejas pelis", tags: "Suspenso", administrador: user.getUserId(), foto: "circulo-pelisviejas.jpg").save(failOnError:true)
			user.addToCirculos(circ)

			user = Usuario.get(3) //FranCarFox
			circ = new Circulo(nombre: "Las mejores peliculas cómicas ", tags: "Cómica", administrador: user.getUserId(), foto: "circulo-risa.jpg").save(failOnError:true)
			user.addToCirculos(circ)
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
