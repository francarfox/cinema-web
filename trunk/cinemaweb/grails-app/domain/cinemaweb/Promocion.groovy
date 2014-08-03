package cinemaweb

class Promocion {
	String descripcion
	Date vigencia
	Empresa empresa
	Tarjeta tarjeta

    static constraints = {
    	descripcion blank: false
    	tarjeta nullable: false
    }
}
