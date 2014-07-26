package cinemaweb

import grails.converters.JSON

class FuncionController {

	def funcionService

    def index() { }

    def create(){

    	render this.funcionService.getCinesData() as JSON 

    	//[canCreate: this.funcionService.canCreate(), horarios: Cine.getOpenCloseHours(), cinesData: ]
    }
}
