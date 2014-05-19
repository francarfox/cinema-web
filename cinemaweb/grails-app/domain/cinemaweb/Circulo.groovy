package cinemaweb

class Circulo {

	String nombre
	String tags
	Usuario administrador

	//static hasMany = [usuarios:Usuario, comentarios:Comentario]

    static constraints = {

    	nombre blank:false, nullable:false
    	tags blank:false, nullable:false, inList:["Acción", "Thriller‎", "Drama", "Suspenso", "Terror", "Infantil", "Artes Marciales", "Aventura", "Biógraficas", "Adultas", "Cómicas", "Catástrofes", "Deportivas", "Documentales", "Fantasticas", "Guerra", "Historia", "Musicales", "Policiales", "Romanticas", "Western"]
    	administrador blank:false, nullable: false
    }
}
