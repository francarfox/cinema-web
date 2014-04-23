package cinemaweb

class Comentario {
	Usuario autor
	String mensaje
	Date fecha = new Date()

    static constraints = {
    	mensaje blank: false
    }
}
