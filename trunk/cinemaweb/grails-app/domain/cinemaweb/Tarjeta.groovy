package cinemaweb

class Tarjeta {
	String banco
	int saldo = 0

    static constraints = {
    	banco blank: false
    	saldo min: 0
    }
}
