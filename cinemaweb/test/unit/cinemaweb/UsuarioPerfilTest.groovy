package cinemaweb

import spock.lang.Specification
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.Mock

@TestFor(Perfil)
class UsuarioPerfilTest extends Specification {

	void "Test crear usuario con perfil con datos no nulos del usuario pero nulos del perfil"() {

		given:
		mockForConstraintsTests Usuario
		mockForConstraintsTests Perfil
		
		when:
		def testPerfil = new Perfil()

		def testUsuario = new Usuario(perfil:testPerfil)
		testUsuario.userId = 'matias90'
		testUsuario.password = '12345'
		testUsuario.passwordV ='12345'

		then:
		!testUsuario.perfil.validate()
		testUsuario.perfil.hasErrors()
		testUsuario.perfil.errors['nombre'] == 'nullable'
		testUsuario.perfil.errors['apellido'] == 'nullable'
		testUsuario.perfil.errors['email'] == 'nullable'
		testUsuario.perfil.errors['localidad'] == 'nullable'
		testUsuario.perfil.errors['pais'] == 'nullable'

	}

	void "Test crear usuario con perfil con datos validos"() {

		given:
		mockForConstraintsTests Usuario
		mockForConstraintsTests Perfil
		
		when:
		def testPerfil = new Perfil()
		testPerfil.nombre = 'matias'
		testPerfil.apellido = 'barro'
		testPerfil.email = 'matiasbarro@gmail.com'
		testPerfil.localidad = 'florida'
		testPerfil.pais ='argentina'

		def testUsuario = new Usuario(perfil:testPerfil)
		testUsuario.userId = 'matias90'
		testUsuario.password = '12345'
		testUsuario.passwordV ='12345'

		then:
		testUsuario.perfil.validate()
		!testUsuario.perfil.hasErrors()

	}


}