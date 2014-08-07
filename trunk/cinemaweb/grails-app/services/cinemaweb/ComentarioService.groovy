package cinemaweb

import grails.transaction.Transactional

@Transactional
class ComentarioService {

    def get(id) {
    	return Comentario.get(id)
    }
}
