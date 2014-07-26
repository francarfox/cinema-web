package cinemaweb

import grails.transaction.Transactional

class FuncionService extends DomainService{

    @Transactional
    public def getDomainInstance(String id = ""){
    	return (id) ? Funcion.get(id) : new Funcion()
    }

    @Transactional
	public def create(def attributes){
		def domain = this.getDomainInstance()
		this.submitDomainAttributes(domain,loadDateAttributes(attributes))
	}

	@Transactional
	public def edit(String id, def attributes){
		def domain = this.getDomainInstance(id)
		this.submitDomainAttributes(domain,loadDateAttributes(attributes))
	}

	def getFuncion(String id){
		return this.getDomainInstance(id)
	}

	def getFunciones(){
		return Funcion.list()
	}


	@Transactional
	def loadDateAttributes(attributes){
		def fechaDesde =  new Date(attributes.desde_value)
		def fechaHasta =  new Date(attributes.hasta_value)
		attributes.putAt("desde",fechaDesde)
		attributes.putAt("hasta",fechaHasta)
		return attributes
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
    	return Cine.list().collect(){it ->  def salas = it.salas.collect(){
    												 	[id:it.id, nombre:it.nombre]
    												 }.sort(){
    												 	a,b -> a.id <=> b.id
    												 }
    										[id:it.id,nombre:it.nombre, salas: salas]
    									}
    }

    @Transactional
    def getPeliculas(){
    	return Pelicula.list()
    }
}
