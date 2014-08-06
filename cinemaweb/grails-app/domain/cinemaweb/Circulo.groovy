package cinemaweb

class Circulo extends Comentable {

	String nombre
	String tags
	String administrador
    String foto
    Encuesta encuesta
    Integer cantUsuarios = 1
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
    }

    def expulsarUsuario(usuario) {
        usuario.removeFromCirculos(this)
    }

    def mostrarUsuariosSinAdmin(){
        def lista = usuarios.findAll{it.getUserId() != this.getAdministrador()}
        return lista
    }

    def eliminarCirculo() {
        this.delete()
    }

    def eliminarUsuarios() {
        this.usuarios.toList().each{ this.removeFromUsuarios(it) }
    }

    def eliminarEncuesta() {
        this.encuesta = null
        //this.encuesta.delete()
    }

    def getCantidadUsuarios() {
        return this.usuarios.size()
    }

    def sumarCantidadUsuarios() {
        this.cantUsuarios = this.cantUsuarios + 1
    }
}
