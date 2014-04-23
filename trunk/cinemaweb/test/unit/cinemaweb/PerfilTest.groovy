package cinemaweb

import spock.lang.Specification
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.Mock

@TestFor(Perfil)
class PerfilTest extends Specification {

    void "Test crear perfil con datos nulos"() {
	
		given:
		mockForConstraintsTests Perfil
		
		when:
		def testPerfil = new Perfil()
		
		then:
		!testPerfil.validate()
		testPerfil.hasErrors()
		testPerfil.errors['nombre'] == 'nullable'
		testPerfil.errors['apellido'] == 'nullable'
		testPerfil.errors['email'] == 'nullable'
		testPerfil.errors['localidad'] == 'nullable'
		testPerfil.errors['pais'] == 'nullable'

	}

	void "Test crear perfil con datos validos"() {

		given:
		mockForConstraintsTests Perfil

		when:
		def testPerfil = new Perfil()
		testPerfil.nombre = 'matias'
		testPerfil.apellido = 'barro'
		testPerfil.email = 'matiasbarro@gmail.com'
		testPerfil.localidad = 'florida'
		testPerfil.pais ='argentina'

		then:
		testPerfil.validate()
		!testPerfil.hasErrors()

	}

	void "Test crear perfil con email incorrecto"() {

		given:
		mockForConstraintsTests Perfil

		when:
		def testPerfil = new Perfil()
		testPerfil.nombre = 'matias'
		testPerfil.apellido = 'barro'
		testPerfil.email = 'matiasbarrogmail.com'
		testPerfil.localidad = 'florida'
		testPerfil.pais ='argentina'

		then:
		!testPerfil.validate()
		testPerfil.hasErrors()
		testPerfil.errors['email'] == 'email'
	}

}
