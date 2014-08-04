package cinemaweb

class Reserva {

	String reserva_key
	Date fecha_reserva
	Date fecha_funcion
	String	transaccionID

	static belongsTo = [funcion: Funcion]

	static hasMany = [asientos: Asiento]

    static constraints = {
    	reserva_key  		 unique:true
    	fecha_reserva		 nullable:false
    	transaccionID		 nullable:true
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
