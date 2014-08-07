package cinemaweb

import grails.transaction.Transactional

@Transactional
class PromocionService {

    def list() {
    	return Promocion.list()
    }

    def get(id) {
    	return Promocion.get(id)
    }
}
