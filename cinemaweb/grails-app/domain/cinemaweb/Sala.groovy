package cinemaweb

class Sala {

	String 	nombre
	Integer filas
	Integer columnas

	static hasMany = [asientos: Asiento, funciones: Funcion]

    static belongsTo = [cine: Cine]

    static constraints = {
        nombre blank: false
    }

    public def getAsiento(def fila, def columna){
        return this.asientos.find { it.fila == fila && it.columna == columna }
    }

    public def getAsientosOcupados(){
        def asientosOcupados = []
        if (this.asientos) {
            this.asientos.each{asientosOcupados.add(it.fila + "," + it.columna)}   
        }
        return asientosOcupados
    }

}
