import parcelas.*
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
	
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta{
	override method daSemillas(){
		return altura > 0.4
	}
	override method espacioQueOcupa(){
		return altura * 3
	}
	override method esParcelaIdeal(parcela){
		return parcela.superficie() > 6
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
	override method esParcelaIdeal(parcela){
		return parcela.horasDeSolRecibidas() == self.horasDeSolQueTolera()
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
	override method esParcelaIdeal(parcela){
		return not parcela.tienePlantasAltas()
	}
}
class SojaTransGenica inherits Soja{
	override method daSemillas(){
		return false
	}
	override method esParcelaIdeal(parcela){
		return parcela.esMonocultivo() or parcela.cantidadDeTiposDePlantas() == 0
	}
}
class HierbaBuena inherits Menta{
	override method espacioQueOcupa(){
		return super()*2
	}
}











