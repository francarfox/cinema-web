package cinemaweb

class Circulo {

	String nombre
	String tags //List<String> tags
	Usuario administrador
    Set<Usuario> usuarios = []
    Set<Comentario> comentarios = []

	static hasMany = [usuarios:Usuario, comentarios:Comentario]
    static belongsTo = Usuario

    static constraints = {

    	nombre blank:false, nullable:false
    	tags blank:false, nullable:false, inList:["Acción", "Thriller‎", "Drama", "Suspenso", "Terror", "Infantil", "Artes Marcial", "Aventura", "Biógrafica", "Adulta", "Cómica", "Catástrofe", "Deportiva", "Documental", "Fantástica", "Guerra", "Historia", "Musical", "Policial", "Romantica", "Western"]
    	administrador blank:false, nullable: false
    }

    def estaUsuario(Usuario user){
    	for(usuario in this.usuarios) {
    		if(user.userId == usuario.userId){
    			return true
    		}	
    	}
    	return false
    }

    def agregarComentario(comentario) {
        comentarios.add(comentario)
    }

    def agregarUsuario(usuario) {
        usuario.addToCirculos(this)
    }

    def expulsarUsuario(usuario) {
        this.removeFromUsuarios(usuario)
    }

    String obtenerAdministrador() {
        return administrador.toString()
    }

}
