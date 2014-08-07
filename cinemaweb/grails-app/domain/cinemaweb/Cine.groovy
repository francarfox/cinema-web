package cinemaweb

class Cine extends Comentable {
	String nombre
    String ubicacion
    Float  precioBase
    String apertura
    String cierre
    String foto

	static hasMany = [salas: Sala, funciones: Funcion, promos: Promocion]

    static constraints = {
    	nombre blank: false, unique: true
        ubicacion blank: false
        precioBase nullable: false
        foto nullable: true, blank: true
    }   


    //devuelve el listado de horas de apertura y cierre para el pulldown
    public static def getOpenCloseHours(){
        return ["00:00", "01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00",
                "12:00", "13:00","14:00", "15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"
        ]
    }

    def agregarPromocion(Promocion promo){
        this.addToPromos(promo)
    }
}
