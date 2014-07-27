package cinemaweb

class Perfil {

	String nombre
	String apellido
	String email
	String foto
	String localidad
	String pais
	//Inbox inbox


	static belongsTo = Usuario

    static constraints = {

    	nombre blank:false

    	apellido blank:false
    	
    	email email:true, blank:false, unique:true

    	localidad blank:true, nullable:true	

    	pais blank: true, nullable:true	

    	foto nullable: true, blank: true
    }
}
