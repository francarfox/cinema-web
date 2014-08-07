package cinemaweb

import grails.transaction.Transactional

class PerfilService extends DomainService {

    @Transactional
	public def getDomainInstance(String id=""){
		return (id) ? Perfil.get(id) : new Perfil()
	}

	@Transactional
	public def edit(Perfil perfil, def attributes) {

		perfil.nombre = attributes.nombre
		perfil.apellido = attributes.apellido
		perfil.email = attributes.email
		perfil.localidad = attributes.localidad
		perfil.pais = attributes.pais

		if(perfil.validate()){
			perfil.save(flush: true)
			return null
		} else {
			perfil.discard()
			return perfil.errors.getAllErrors()
		}
	}

	@Transactional
	public def getPerfil(id) {
		return getDomainInstance(id)
	}
}
