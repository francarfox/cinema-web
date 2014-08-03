package cinemaweb

class Tarjeta {
	String nombre
	int saldo

    static constraints = {
    	nombre blank: false
    	saldo min: 0
    }
}
