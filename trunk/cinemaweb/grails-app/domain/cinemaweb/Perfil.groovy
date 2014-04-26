package cinemaweb

class Perfil {

	String nombre
	String apellido
	String email
	//byte[] foto
	String localidad
	String pais
	//Inbox inbox

	//static hasMany = [ circulos:Circulo, promociones:Promocion ]

	static belongsTo = Usuario

    static constraints = {

    	nombre blank:false

    	apellido blank:false
    	
    	email email:true, blank:false, unique:true

    	//foto nullable:true

    	localidad blank:true, nullable:true	//agregue nullable

    	pais blank: true, nullable:true	//agregue nullable
    }
}
