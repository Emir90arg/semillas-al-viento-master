import plantas.*
class Parcela{
	var property ancho = 0
	var property largo = 0
	var property horasDeSolRecibidas = 0
	var property plantasQueTiene = []
	
	method superficie(){
		return ancho * largo
	}
	method cantidadMaximaDePlantas(){
		if (ancho > largo){
			return self.superficie() /5
		}
		else{
			return self.superficie() / 3 + largo
		}
	}
	method tieneComplicaciones(){
		return plantasQueTiene.any({planta=> planta.horasDeSolQueTolera() < horasDeSolRecibidas})
	}
	method toleraParcela(planta){
		return (planta.horasDeSolQueTolera() -horasDeSolRecibidas).abs() <= 2
	}
	method cantidadDePlantasQueTengo(){
		return plantasQueTiene.size()
	}
	method tengoLugar(){
		return self.cantidadDePlantasQueTengo() < self.cantidadMaximaDePlantas()
	}
	method puedoPlantar(planta){
		return self.tengoLugar() and self.toleraParcela(planta)
	}
	method plantarPlanta(planta){
		if (self.puedoPlantar(planta)){
			plantasQueTiene.add(planta)
		}
		else{
			throw new Exception(message = "no hay lugar o la planta no tolera la parcela")			
		}		
	}
	method tienePlantasAltas(){
		return plantasQueTiene.any({planta=> planta.altura() == 1.5})
	}
	method cantidadDeTiposDePlantas(){
		return plantasQueTiene.asSet().size()
	}
	method esMonocultivo(){
		return self.cantidadDeTiposDePlantas() == 1
	}
	method seAsocianBien(planta)	
}

class ParcelaEcologica inherits Parcela{
	override method seAsocianBien(planta){
		return (not self.tieneComplicaciones()) and planta.esParcelaIdeal(self)
	}
}

class ParcelaIndustrial inherits Parcela{
	override method seAsocianBien(planta){
		return self.cantidadDePlantasQueTengo() <= 2 and planta.esFuerte()
	}
}



