package cinemaweb

import grails.transaction.Transactional

class FuncionService extends DomainService{

    @Transactional
    public def getDomainInstance(String id = ""){
    	return (id) ? Funcion.get(id) : new Funcion()
    }

    //chequeo si hay cines, salas y peliculas para poder crear una funcion
    @Transactional
    def canCreate(){
    	def canCreate = false
    	if(Pelicula.count() > 0){
    		canCreate = true
    	}

    	//si hay peliculas chequeo que hayan cines y salas
    	if(canCreate && Cine.count() > 0){
    		//chequeo si cada sala tiene salas
    		def tienenSalas = true
    		Cine.getAll().each(){
    			if(it.salas.size() == 0){
    				tienenSalas = false
    			}
    		}

    		canCreate = tienenSalas
    	}

    	return canCreate
    }


    @Transactional
    def getCinesData(){
    	//traigo los cines y para cada uno su sala
    	return Cine.getAll().collect([:]){ it-> [(it.id):[nombre: it.nombre, 
    										   ]}
    }
}
