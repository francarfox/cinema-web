package cinemaweb

class Sala {

	String 	nombre
	Integer filas
	Integer columnas

	static hasMany = [asientos: Asiento]

    static constraints = {
    }
}
