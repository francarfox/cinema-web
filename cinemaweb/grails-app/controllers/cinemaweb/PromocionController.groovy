package cinemaweb

class PromocionController {
	def scaffold = true
	def promocionService

    def index() {
    	def promos = promocionService.list()
    	[promos: promos]
    }

    def show() {
    	def promo = promocionService.get(params.id)
    	[promo: promo]
    }
}
