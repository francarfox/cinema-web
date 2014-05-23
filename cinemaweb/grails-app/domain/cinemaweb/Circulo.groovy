package cinemaweb

class Circulo {

	String nombre
	String tags //List<String> tags
	Usuario administrador

	static hasMany = [usuarios:Usuario] //comentarios:Comentario

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
}
