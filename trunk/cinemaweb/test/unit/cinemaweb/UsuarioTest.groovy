package cinemaweb

import spock.lang.Specification
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.Mock


@TestFor(Usuario)
class UsuarioTest extends Specification {

    
    void "Test crear usuario con datos nulos"() {
	
		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		
		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['userId'] == 'nullable'
		testUsuario.errors['password'] == 'nullable'
		testUsuario.errors['passwordV'] == 'nullable'

	}

	void "Test crear usuario con passwords nulas"() {
	
		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matias90'
		
		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['password'] == 'nullable'
		testUsuario.errors['passwordV'] == 'nullable'

	}

	void "Test crear usuario con una password nula"() {
	
		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matias90'
		testUsuario.password = 'matias'
		
		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['passwordV'] == 'nullable'

	}

	void "Test crear usuario con datos correctos"() {

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
		testUsuario.validate()
		!testUsuario.hasErrors()

	}

	void "Test crear usuario con nombre y password con longitud incorrecta"() {

		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matiasbarro'
		testUsuario.password = '1234'
		testUsuario.passwordV ='1234'

		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['userId'] == 'size'
		testUsuario.errors['password'] == 'size'

	}

	/* Test no anda
	void "Test crear dos usuarios con nombres iguales"() {

		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matias'
		testUsuario.password = '12345'
		testUsuario.passwordV ='12345'

		def testUsuario2 = new Usuario()
		testUsuario2.userId = 'matias'
		testUsuario2.password = '12345'
		testUsuario2.passwordV ='12345'

		then:
		!testUsuario2.validate()
		testUsuario2.hasErrors()
		testUsuario2.errors['userId'] == 'unique'

	}*/

	void "Test crear usuario con passwords diferentes"() {

		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matias'
		testUsuario.password = 'hola1'
		testUsuario.passwordV ='comoandas'

		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['passwordV'] == 'validator'

	}

	void "Test crear usuario con nombre y password igual"() {

		given:
		mockForConstraintsTests Usuario
		
		when:
		def testUsuario = new Usuario()
		testUsuario.userId = 'matias'
		testUsuario.password = 'matias'
		testUsuario.passwordV ='matias'

		then:
		!testUsuario.validate()
		testUsuario.hasErrors()
		testUsuario.errors['password'] == 'validator'

	}

}
