package cinemaweb

class PromocionController {
	def scaffold = true
	def promocionService

    def index() {
    	def promos = promocionService.list()
    	[promos: promos]
    }
}
