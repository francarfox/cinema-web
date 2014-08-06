package cinemaweb

class Comentario {
	Usuario autor
	String mensaje
	Comentable comentable
	Date fecha = new Date()

    static constraints = {
    	mensaje blank: false
    }
}
