class Planta{
	var property anioObtencion = 0
	var property altura = 0
	
	method horasDeSolQueTolera() = 7
	
	method esFuerte(){
		return self.horasDeSolQueTolera() > 9
	}
	method daSemillas(){
		return self.esFuerte()
	}
	method espacioQueOcupa()
}

class Menta inherits Planta{
	override method daSemillas(){
		return altura > 0.4
	}
	override method espacioQueOcupa(){
		return altura * 3
	}
}

class Soja inherits Planta{
	override method horasDeSolQueTolera(){
		if (altura < 0.5){
			return 6
		}
		else if (altura.between(0.5,0.9)){
			return 8
		}
		else return 12
	}
	override method daSemillas(){
		return self.anioObtencion() > 2007 and 
			self.altura().between(0.75,0.9)
	}	
	override method espacioQueOcupa(){
		return altura / 2
	}
}

class Quinoa inherits Planta{
	var property espacioQueOcupara = 0
	
	override method espacioQueOcupa(){
		return espacioQueOcupara
	}
	override method horasDeSolQueTolera(){
		if (self.espacioQueOcupa() < 0.3){
			return 10
		}
		else return super()
	}
	override method daSemillas(){
		return super() or anioObtencion < 2005
	}
}
class SojaTransGenica inherits Planta{
	override method daSemillas(){
		return false
	}
}
class HierbaBuena inherits Planta{
	override method espacioQueOcupa(){
		return super()*2
	}
}











