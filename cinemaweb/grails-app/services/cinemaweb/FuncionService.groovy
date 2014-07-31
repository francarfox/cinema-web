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

    @Transactional
    def protected submitDomainAttributes(domain,attributes){
        domain.properties = attributes
        def dateErrors = this.checkDateAttrs(attributes.desde, attributes.hasta)
        if(!dateErrors && domain.validate()){
            domain.save(flush: true)    
            return null
        }else{
            domain.discard()
            return domain.errors.getAllErrors() // dateErrors
        }
    }


    def checkDateAttrs(desde, hasta){
        if(desde.compareTo(hasta) > 0){
            return ["Chequea las fechas"]
        }else{
            return null
        }
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
    	if(Pelicula.count() == 0){
    		throw new Exception("No hay peliculas");
    	}

    	//chequeo que hayan cines, salas y asientos
    	if(Cine.count() > 0){
    		//chequeo si cada sala tiene salas
    		def haySalas = false
            def hayAsientos = false
    		Cine.getAll().each(){
    			if(it.salas.size() > 0){
    				haySalas = true
    			   //chequeo si alguna de las salas tiene asientos
                   it.salas.each(){ sala ->
                        if(sala.getAsientosOcupados().size() > 0){
                            hayAsientos = true
                        }
                   }
                }
    		}
            //exception si no hay salas
            if(!haySalas){
                throw new Exception("No hay salas para ningun cine")
            }

            if(!hayAsientos){
                throw new Exception("No hay asientos para ninguna de las salas creadas")
            }
    	}else{
            throw new Exception("No hay cines")
        }

    }


    @Transactional
    def getCinesData(){
    	//traigo los cines y para cada uno su sala
    	return Cine.list().collect(){it -> if(it.salas.size() > 0){
                                            def currentsalas = it.salas.collect(){currentSala->
                                                        if(currentSala.getAsientosOcupados().size() > 0){
                                                            [id:currentSala.id, nombre:currentSala.nombre]
                                                        }
                                                     }.findAll{ obj -> obj != null}

                                            if(currentsalas){
                                                [id:it.id,nombre:it.nombre, salas: currentsalas.sort {a,b -> a.id <=> b.id}]
                                             }
                                           }
    									}.findAll { obj -> obj != null}
    }

    @Transactional
    def getPeliculas(){
    	return Pelicula.list()
    }
}
