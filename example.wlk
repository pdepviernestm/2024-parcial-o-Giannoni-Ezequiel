
class Persona{
  var edad
  var emociones = []
  var intensidad

  method esAdolescente() = edad.between(12, 19)
  method emocionNueva(emocion) = emociones.add(emocion)
  method estaPorExplotar(){
    emociones.all({emocion => emocion.puedeSerLiberada()})
  }
  /*method vivirEvento(){
    personas.forEach(persona => )}*/
  /*method intensidades(intensidad){
    emociones.forEach(emocion => emocion.intensidad(intensidad))
  }
  method intensidad(){}
  
  method grupoDePersonas(){}
  */
}
class GrupoDePersonas{
  const personas = []
  
}
class Evento{
  const property impacto
  const property descripcion

  /*method impacto(){
    impacto > 0
  } */
}

class Emocion{
  var property valor = 0
  var property intensidad
  var property intensidadLeve
  var eventosExperimentados = 0
  var causa

  method puedeSerLiberada(){}
  method liberarse(){}
  method intensidadElevada(){
    return intensidad > intensidadLeve
  }
  /*method cantEventosVividos(){
    return eventosExperimentados -= evento.impacto()
  }*/
  
}

class Furia inherits Emocion(intensidad=100){
  var serieDePalabrotas = []

  method conocePalabrotaMayor(){
    //serieDePalabrotas.any({palabra => palabra.})
  }
  //method puedeSerLiberada(){}
  method liberarse(evento){
    intensidad =- evento.impacto()
    serieDePalabrotas = serieDePalabrotas.drop(1)
  }
  method nuevaPalabrota(palabrota){
    serieDePalabrotas.add(palabrota)
  } 
}
class Alegria inherits Emocion{
  /*method liberarse(){
    if(self.puedeSerLiberada()){}
  }*/
  method cantEventosVividos(){
    return eventosExperimentados %2 == 0 //es par
  }
}

class Tristeza inherits Emocion{
  method liberarse(evento){
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
  /*method liberarse(){

  }
  override method puedeSerLiberada() = self.intensidadElevada() && cantEventosVividos() -= 
  */
}
class Desagrado inherits EmocionNegativa{}
class Temor inherits EmocionNegativa{}
class Ansiedad inherits Emocion(intensidad = 50){
  /*
  method puedeSerLiberada(){}
  method liberarse(){}
  */
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