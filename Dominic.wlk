object dominic{
  const autos = []
  method comprar(unAuto){autos.add(unAuto)}
  method noPuedenCorrer() = autos.filter({x => not x.enCondiciones()})
  method puedenCorrer() = autos.filter({x => x.enCondiciones()})
  method mandarAutosAlTaller() {taller.recibirAutos(self.noPuedenCorrer())}
  method hacerPruebasDeVelocidad(){autos.forEach({a => a.pruebaDeVelocidad()})}
  method venderAutos(){autos.clear()}
  method promedioVelocidades() = autos.sum({a => a.velocidadMaxima()}) / autos.size()
  method autoMasRapidoEnCondiciones() = self.puedenCorrer().max({a => a.velocidadMaxima()})
  method hayUnAutoMuyRapido() = self.autoMasRapidoEnCondiciones().velocidadMaxima() > 2 * self.promedioVelocidades() 


}
object taller {
  const autos = []
  method recibirAutos(listaDeAutos) {autos.addAll(listaDeAutos)}
  method repararAutos(){autos.forEach({a => a.reparar()})
  autos.clear()
  }
}

object ferrari {
  var motor = 87
  method enCondiciones() = motor >= 65
  method reparar() {motor = 100}
  method velocidadMaxima() =  if(motor >75) 125 else 110
  method pruebaDeVelocidad(){motor = (motor - 30).max(0)}
}

object flecha {
  var nivelCombustible = 100  
  var property combustible = gasolina
  var color = azul
  method enCondiciones() = nivelCombustible > combustible.nivelMinimo() && 
    color == rojo
  method pruebaDeVelocidad() = (nivelCombustible-5).max(0)
  method reparar() {
    nivelCombustible = nivelCombustible * 2
    color = color.cambiarDeColor()
  }
  method velocidadMaxima() = nivelCombustible * 2 + combustible.velMaxima(nivelCombustible)
}

object gasolina {
  method nivelMinimo() = 85
  method velMaxima(unNivel) = 10
}
object nafta {
  method nivelMinimo() = 50
  method velMaxima(unNivel) = -1 *((unNivel *2)* 0.10)
}
object nitrogeno {
  method nivelMinimo() = 0
  method velMaxima(unNivel) = unNivel *2 *10
}

object azul {
  method cambiarDeColor() = verde
}
object rojo {
  method cambiarDeColor() = azul
}
object verde {
  method cambiarDeColor() = rojo
  
}

object intocable{
  var enCondiciones = true
  method hacerPrueba() {enCondiciones = false}
  method reparar() {enCondiciones = true}
}