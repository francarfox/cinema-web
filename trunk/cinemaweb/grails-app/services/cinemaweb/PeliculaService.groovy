package cinemaweb

import grails.transaction.Transactional

@Transactional
class PeliculaService {

	def get(id) {
		return Pelicula.get(id)
	}

	def getListaPeliculas() {
		return Pelicula.list()
	}

    def listPorNombre() {
    	return Pelicula.list(sort:"nombre")
    }

    def getGeneros() {
    	return Pelicula.generos
    }
}
