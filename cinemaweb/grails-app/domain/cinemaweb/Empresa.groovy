package cinemaweb

class Empresa {
	String nombre
	//def hasMany = [promocion:Promocion]

    static constraints = {
    	nombre blank: false
    }
}
