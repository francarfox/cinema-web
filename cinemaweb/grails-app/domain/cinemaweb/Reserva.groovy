package cinemaweb

class Reserva {

	String reserva_key
	Date fecha

	static belongs_to = [funcion: Funcion]

	static hasMany = [asientos: Asiento]

    static constraints = {
    	reserva_key  blank:false, unique:true
    	fecha 		 nullable:false
    }

 	public static def getPeliculasReservables(){
 	   	def peliculasReservables = []
    	Pelicula.getAll().each(){
 	   		if(it.funciones.size() > 0){	
 	   			peliculasReservables << it
 	   		}
 	   	}

 	   	return peliculasReservables
 	}   
}
