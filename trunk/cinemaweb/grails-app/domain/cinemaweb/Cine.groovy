package cinemaweb

class Cine {
	String nombre
    String ubicacion
    Float  precioBase
    String apertura
    String cierre
    String foto

    //falta agregar funcion
	static hasMany = [comentarios: Comentario, salas: Sala, funciones: Funcion]

    static constraints = {
    	nombre blank: false, unique: true
        ubicacion blank: false
        precioBase nullable: false
        foto nullable: true, blank: true
    }   

    def agregarComentario(comentario) {
    	comentarios.add(comentario)
    }

    def obtenerComentarios() {
    	//comentarios.sort(true)
    	return comentarios
    }


    //devuelve el listado de horas de apertura y cierre para el pulldown
    public static def getOpenCloseHours(){
        return ["00:00", "01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
                "12:00", "13:00","14:00", "15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"
        ]
    }
}
