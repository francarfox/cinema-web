package cinemaweb

import org.joda.time.*
import org.jadira.usertype.dateandtime.joda.*

class Funcion {

	String nombre
	Date desde
	Date hasta
	String horario
	Integer precio
	Set<Reserva> reservas = []

	static belongsTo = [cine: Cine, sala: Sala, pelicula: Pelicula]

	static hasMany = [reservas: Reserva]

    static constraints = {
    	nombre blank: false
    	desde  nullable: false
    	hasta  nullable: false
    	precio blank: false, min:30
    }


    def getFuncionReservas(fecha = null){
    	if(fecha){
    		def filtroFecha = new Date().parse("dd-MM-yyyy",fecha)
    		return this.reservas.findAll { it ->
    			it.fecha_funcion == filtroFecha
    		}
    	}else{
    		return this.reservas
    	}
    }


}
