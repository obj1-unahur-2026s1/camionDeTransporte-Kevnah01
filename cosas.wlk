object knightRider {
    method peso(){
        return 500
    }
    method peligrosidad(){
        return 10
    }
    method bultosQueOcupa(){
        return 1
    }
    method efectoAlCargarse(){ 
    }
}
object bumblebee {
    var esAuto = true
    method peso(){
        return 800
    }
    method peligrosidad(){
        return if(esAuto){
            15
        }
        else{
            30
        }
    }
    method convertirEnAuto(){
        esAuto = true
    }
    method convertirEnRobot(){
        esAuto = false
    }
    method bultosQueOcupa(){
        return 2
    }
    method efectoAlCargarse(){
       esAuto = false 
    }
}
object paqueteDeLadrillos {
    var property cantidadLadrillos = 20
    method peso(){
        return cantidadLadrillos * 2
    }
    method peligrosidad(){
        return 2
    }
    method bultosQueOcupa(){
        if (cantidadLadrillos <= 100){
            return 1
        }
        else{
            if (cantidadLadrillos >= 101 and cantidadLadrillos <= 300){
                return 2
            }
            else{
                return 3
            }
        }
        
    }
    method efectoAlCargarse(){
        cantidadLadrillos += 12
    }
}
object arenaAGranel {
    var property peso = 100
    method peligrosidad(){
        return 1
    }
    method bultosQueOcupa(){
        return 1
    }
    method efectoAlCargarse(){
        peso -= 10
    }
}
object bateriaAntiaerea {
    var tieneMisiles = false
    method peso(){
        return if(tieneMisiles){
            300
        }
        else{
            200
        }
    }
    method peligrosidad(){
        return if(tieneMisiles){
            100
        }
        else{
            0
        }
    }
    method colocarMisiles(){
        tieneMisiles = true
    }
    method sacarMisiles(){
        tieneMisiles = false
    }
    method bultosQueOcupa(){
        if (not tieneMisiles){
            return 1
        }
        else{
            return 2
        }
    }
    method efectoAlCargarse(){
      tieneMisiles = true  
    }
}
object contenedorPortuario {
    const objetos = []
    
    method peso(){
        return 100 + objetos.sum({o => o.peso()})
    }
    method peligrosidadesDeObjetos(){
        return objetos.map({o => o.peligrosidad()})
    }
    method peligrosidad(){
        if (not objetos.isEmpty()){
            return self.peligrosidadesDeObjetos().max()
        }
        else{
            return 0
        }
    }
    method agregarObjetos(unaCosa){
        objetos.add(unaCosa)
    }
    method descargarObjetos(unaCosa){
        if (not objetos.contains(unaCosa)){
            self.error("No se encuentra en la carga del contenedor")
        }
        objetos.remove(unaCosa)
    }    
    method bultosQueOcupa(){
        return 1 + objetos.sum({o => o.bultosQueOcupa()})
    }
    method efectoAlCargarse(){
        objetos.forEach({o => o.efectoAlCargarse()})
    }
}
object residuosRadioactivos {
    var property peso = 10 

    method peligrosidad(){
        return 200
    }
    method bultosQueOcupa(){
        return 1
    }
    method efectoAlCargarse(){
        peso += 15
    }
}
object embalajeDeSeguridad {
    var objetoEnvuelto = residuosRadioactivos

    method peso(){
        return objetoEnvuelto.peso()
    }
    method peligrosidad(){
        return objetoEnvuelto.peligrosidad() / 2
    }
    method embalarObjeto(nuevoObjeto){
        objetoEnvuelto = nuevoObjeto
    }
    method bultosQueOcupa(){
        return 2
    }
    method efectoAlCargarse(){
    }
}
