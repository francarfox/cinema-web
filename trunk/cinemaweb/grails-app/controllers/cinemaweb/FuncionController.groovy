package cinemaweb

import grails.converters.JSON

class FuncionController extends BaseController{

	def funcionService

    def index() { 
        if(!this.isAdminUser()){
            render(view:"access_denied")
        }else{
            [funciones: this.funcionService.getFunciones()]    
        }
    	
    }

    def show() {
        if(!this.isAdminUser()){
            render(view:"access_denied")
        }else{
    	   [funcion: this.funcionService.getFuncion(params.id),adminUserLogged: this.isAdminUser()]
    }   }

    def edit(){
    	if(!this.isAdminUser()){
            render(view:"access_denied")
        }else{
               //render params as grails.converters.JSON
            def errors = (params.submit) ? this.funcionService.edit(params.id,params) : null

            if(params.submit && !errors){
                redirect(action:"show",id: params.id)
            }else{
                
                def cinesData = this.funcionService.getCinesData() as grails.converters.JSON 
                //render dataToDisplay(params,this.funcionService.getFuncion(params.id)) as grails.converters.JSON 
                [
                 funcionID: params.id,
                 dataToDisplay: dataToDisplay(params,this.funcionService.getFuncion(params.id)),
                 horarios: Cine.getOpenCloseHours(),
                 peliculas: this.funcionService.getPeliculas(), 
                 cinesData: cinesData,
                 errors:errors,
                 adminUserLogged: this.isAdminUser()]           
            } 
        }
        
    }

    def create(){

        if(!this.isAdminUser()){
            render(view:"access_denied")
        }else{
                //render params as grails.converters.JSON
            def errors = (params.submit) ? this.funcionService.create(params) : null
            //render errors as grails.converters.JSON
            if(params.submit && !errors){
                redirect(action:"index")
            }else{
                try {
                    this.funcionService.canCreate()      
                }
                catch(Exception e) {
                    //no se puede crear funciones porque faltan peliculas, cines, salas o asientos
                    return [errorMessage: e.getMessage()]        
                }
            
                def cinesData = this.funcionService.getCinesData() as grails.converters.JSON 
                //render this.funcionService.getCinesData() as grails.converters.JSON
                //render dataToDisplay(params,null) as grails.converters.JSON 
                [dataToDisplay: dataToDisplay(params,null), 
                 horarios: Cine.getOpenCloseHours(),
                 peliculas: this.funcionService.getPeliculas(), 
                 cinesData: cinesData,
                 errors:errors]       
            }
        }

    }

    //metodos heredados 

    def dataToDisplay(def params, def domain){
		def porDefecto = null
        if(domain){
            porDefecto = extractDomainAttrs(domain)
        }else{
            porDefecto = getAtributosPorDefecto();
        }

        return porDefecto.inject([:]){map, attr -> 
        							def dateValue = attr.key + "_value"
        							if((attr.key == "desde" || attr.key == "hasta") && params.getAt(dateValue)){
                                    	//def df =  new java.util.Date.SimpleDateFormat();
                                    	//def newDate = df.parse(params.getAt(yearKey) + params.getAt(monthKey) + params.getAt(dayKey))
                                    	//newValue = Date(params.getAt(yearKey),params.getAt(monthKey),params.getAt(dayKey))
                                    	//params.putAt(attr.key, new Date(params.getAt(yearKey).toInteger(),params.getAt(monthKey).toInteger(),params.getAt(dayKey).toInteger()))
                                    	params.putAt(attr.key, new Date(params.getAt(dateValue)))
                                    }
        							
        							map + [(attr.key) : (params.getAt(attr.key)) ?: attr.value]
        						}
	}

    def getAtributosPorDefecto(){

        return [
                    nombre: "", 
                    pelicula:  "",
                    cine: "",
                    sala: "",
                    horario: "12:00",
                    precio: "50",
                    desde: new Date(),
                    hasta: new Date(),
        ]
    }

    def extractDomainAttrs(domain){
    	return [
                    nombre: domain.nombre, 
                    pelicula:  domain.pelicula.id,
                    cine: domain.cine.id,
                    sala: domain.sala.id,
                    horario: domain.horario,
                    precio: domain.precio,
                    desde: domain.desde,
                    hasta: domain.hasta,
       			 ]
    }

}
