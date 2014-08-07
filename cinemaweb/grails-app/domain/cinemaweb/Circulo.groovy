package cinemaweb

class Circulo extends Comentable {

	String nombre
	String tags
	String administrador
    String foto
    Encuesta encuesta
    Integer cantUsuarios = 0
    Set<Usuario> usuarios = []

	static hasMany = [usuarios:Usuario]
    static belongsTo = Usuario

    static constraints = {

    	nombre blank:false, nullable:false
    	tags blank:false, nullable:false, inList:["Acción", "Thriller‎", "Drama", "Suspenso", "Terror", "Infantil", "Arte Marcial", "Aventura", "Biógrafica", "Adulta", "Cómica", "Catástrofe", "Deportiva", "Documental", "Fantástica", "Guerra", "Historia", "Musical", "Policial", "Romantica", "Western"]
    	administrador blank:false, nullable: false
        foto nullable: true, blank: true
        encuesta nullable: true, blank: true
    }

    def estaUsuario(Usuario user){
        def cant = usuarios.findAll{it.getUserId() == user.getUserId()}.size()
        if( cant == 0 ) {
            return false
        }
        else {
            return true
        }
    }

    def agregarUsuario(usuario) {
        usuario.addToCirculos(this)
        this.sumarCantidadUsuarios()
    }

    def expulsarUsuario(usuario) {
        usuario.removeFromCirculos(this)
    }

    def mostrarUsuariosSinAdmin(){
        def lista = usuarios.findAll{it.getUserId() != this.getAdministrador()}
        return lista
    }

    def eliminarCirculo() {
        this.eliminarUsuarios()
        this.eliminarComentarios()
        this.eliminarEncuesta()
        this.delete()
    }

    def eliminarUsuarios() {
        this.usuarios.toList().each{ this.expulsarUsuario(it) }
    }

    def eliminarEncuesta() {
        this.encuesta.eliminarEncuesta()
        this.encuesta = null
    }

    def getCantidadUsuarios() {
        return this.usuarios.size()
    }

    def sumarCantidadUsuarios() {
        this.cantUsuarios = this.cantUsuarios + 1
    }
}
