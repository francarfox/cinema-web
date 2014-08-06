package cinemaweb

class Promocion {
	String nombre
	String descripcion
	Date vigencia
	Empresa empresa
	Tarjeta tarjeta

	String foto = "default.png"

    static constraints = {
    	nombre blank: false
    	descripcion blank: false
    	vigencia nullable: true	//test
    	empresa nullable: true
    	tarjeta nullable: true
    }
}
