package cinemaweb

class Sala {

	String 	nombre
	Integer filas
	Integer columnas

	static hasMany = [asientos: Asiento]

    static constraints = {
    }

    public def getAsiento(def fila, def columna){
    	for(asiento in this.asientos) {
    		if(asiento.fila == fila && asiento.columna == columna){
    			return asiento
    		}	
    	}
    }
}
