
class Persona{
  var edad
  var property emociones = []
  var property intensidad

  method esAdolescente() = edad.between(12, 19)
  method cumpleAnios(){edad = edad + 1} 
  method emocionNueva(emocion) = emociones.add(emocion)
  method estaPorExplotar(){
    emociones.all({emocion => emocion.puedeSerLiberada()})
  }
  method vivirEvento(){
    emociones.forEach({
      emocion => emocion.vivirEvento()
      emocion.cantEventosVividos()
      emocion.sumarEventosExp()})
  }
  method intensidades(){
    emociones.forEach({emocion => emocion.intensidad(intensidad)})
  }
  /**/
  /*
  
  
  method grupoDePersonas(){}
  */
}
class GrupoDePersonas{
  const personas = []
  
}
class Evento{
  const property impacto
  const property descripcion

  method impacto(){
    return impacto.abs()
  }
}

class Emocion{
  var property valor = 0
  var property intensidad
  var property intensidadLeve
  var eventosExperimentados = 0
  var property causa
  var property impacto

  method puedeSerLiberada(){}
  method liberarse(){}
  method intensidadElevada(){
    return intensidad > intensidadLeve
  }
  method sumarEventosExp(){
  eventosExperimentados += 1}
  method cantEventosVividos(evento){
     eventosExperimentados -= evento.impacto()}
  /*
  }*/
  method liberarse(evento){
    intensidad -= evento.impacto()
  }
}

class Furia inherits Emocion(intensidad=100){
  var property serieDePalabrotas = []

  method conocePalabrotaMayor(){
    serieDePalabrotas.any({palabra => palabra.size()>7})
  }
  // 
  method puedeSerLiberada(evento){
    return self.intensidad()
  }
  override method liberarse(evento){
  if(self.puedeSerLiberada(evento)){
    intensidad -= evento.impacto()
    self.olvidarPalabrota(serieDePalabrotas.head())
  }}
  /*override method liberarse(evento){
    intensidad =- evento.impacto()
    serieDePalabrotas = serieDePalabrotas.drop(1)
  }*/
  method nuevaPalabrota(palabrota){
    serieDePalabrotas.add(palabrota)
  }
  method olvidarPalabrota(palabrota){
    serieDePalabrotas.remove(palabrota)
  } 
}
// self. eventos experimentados > intensidad
class Alegria inherits Emocion{
  method puedeSerLiberada(evento){
    self.intensidadElevada()
    self.cantEventosVividos(evento)
    return true
  }
  override method liberarse(evento){
    if(self.puedeSerLiberada(evento)){
    self.intensidadElevada() -= evento.imacto()
    } 
  }
  method cantEventosVividos(){
    return eventosExperimentados %2 == 0 //es par
  }
}

class Tristeza inherits Emocion{
  override method liberarse(evento){
    if(self.puedeSerLiberada(evento)){
      causa = evento.descripcion()
      intensidad -= evento.impacto()
    }
    //intensidadElevada()
  }
  method puedeSerLiberada(evento){
    return self.intensidadElevada() && !self.melancolia(evento)
  }
  method melancolia(evento){
    return causa == "melancolia"
  }
}
class EmocionNegativa inherits Emocion{
  method puedeSerLiberada(evento){
    self.intensidadElevada() && eventosExperimentados > intensidad
  }
 
  override method liberarse(evento) {self.intensidadElevada() && eventosExperimentados -= evento.impacto()}
  
}
class Desagrado inherits EmocionNegativa{}
class Temor inherits EmocionNegativa{}
class Ansiedad inherits Emocion(intensidad = 50){
  override method liberarse(evento){
    if(self.puedeSerLiberada(evento)){
      causa = evento.descripcion()
      intensidad -= evento.impacto()
    }
    //intensidadElevada()
  }
  method puedeSerLiberada(evento){
    return self.intensidadElevada() && eventosExperimentados > intensidad
  }
  
}

/*
 ** POLIMORFISMO:
     + Ansiedad entiende los mensajes de Emocion, tiene los mismos metodos presentando comportamientos distintos 
     + Entiende el atributo intensidad por ejemplo, y es inicializado con un valor distinto
     +
 ** HERENCIA: 
     + Ansiedad hereda los mensajes y atributos de Emocion.
     + A traves de la herencia comparten comportamientos, y habilita muchas maneras de combinarlos
     +
*/