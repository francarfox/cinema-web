package cinemaweb

import org.joda.time.*
import org.jadira.usertype.dateandtime.joda.*

class Funcion {

	String nombre
	DateTime desde
	DateTime hasta
	DateTime horario
	Integer precio

	static belongsTo = [cine: Cine, sala: Sala, pelicula: Pelicula]

    static constraints = {
    	nombre blank: false
    	desde  nullable: false
    	hasta  nullable: false
    	precio blank: false, min:30
    }


}
