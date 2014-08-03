package cinemaweb

class Asiento {
	Integer fila
	Integer columna

	static belongsTo = [Sala,Reserva]

    static constraints = {
    }
}
