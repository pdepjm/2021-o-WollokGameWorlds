class Partida{
	// new List() es lo mismo que [] -> acepta repetidos
	// new Set() es lo mismo que #{} -> no acepta repetidos y no hay orden, por lo tanto no se puede hacer first ni last
	var participantes = #{}
	
	method agregarParticipante(participante){
		participantes.add(participante)
	}
	
	method comenzar(){
		participantes.forEach({participante => participante.jugar()}) // -> polimorfismo
	}
	
	method ganador() = participantes.max({participante => participante.habilidad()})// -> polimorfismo
}

class Equipo{	// TAREA
	var jugadores = #{}
	
	method contratarJugador(jugador){
		jugadores.add(jugador)
	}
		
	method jugar(){} 
	method habilidad(){} 
}

class Jugador{
	const antiguedad = 0
	const competenciasInternacionales = 0
	var  nivelCansancio = 0
	var amigo = null
	
	method esTitular() = antiguedad > 3
	
	method puedeJugar() = self.esTitular() && self.tieneExperiencia()
	
	method tieneExperiencia() = competenciasInternacionales > 2
	
	//method crearAmigo() {
	//	new Jugador()
	//}
	
	//method amigo() = amigo
	
	//method testo() = self
	
	method tomarBebidaEnergizante(cantidad) {
		nivelCansancio = (nivelCansancio - cantidad*10).max(0)
	}
	
	method jugar(){
		nivelCansancio = nivelCansancio + 20
	}
	
	method habilidad() = (antiguedad*2 + competenciasInternacionales*3 - nivelCansancio).max(0)
}

// WKO
object faker {
	var tilteado = false
	var habilidad = 0

	method tilteado() = tilteado
	
	method tomarTecito(){
		tilteado = false
	}
	
	method jugar(){
		habilidad += 50
	}
	
	method habilidad() = if(tilteado) 0 else habilidad
}