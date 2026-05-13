import cosas.*
object camion {
    const carga = []

    method peso(){
        return 1000
    }
    method pesoTotal(){
        return carga.sum({c => c.peso()})
    }
    method cargarCosa(unaCosa){
        carga.add(unaCosa)
    }
    method descargarCosa(unaCosa){
        if (not carga.contains(unaCosa)){
            self.error("No se encuentra en la carga del camion")
        }
        carga.remove(unaCosa)
    }
    method pesoDeCadaCosaCargadaEsPar(){
        return carga.all({c => c.peso() % 2 == 0})
    }
    method hayCosaConPesoDeterminado(unPeso){
        return carga.any({c => c.peso() == unPeso})
    }
    method primerCosaConPeligrosidad(){
        return carga.find({c => c.peligrosidad() != 0})
    }
    method cosasConPeligrosidad(){
        return carga.filter({c => c.peligrosidad() > 0})
    }
    method cosasQueSuperanPeligrosidad(unaCosa){
        return carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }

    method estaExcedidoDePeso(){
        return self.pesoTotal() > 2500
    }
    method cosasCargadasNoSuperanPeligrosidad(unaPeligrosidad){
        return carga.all({c => c.peligrosidad() < unaPeligrosidad})
    }
    method puedeCicular(nivelPeligrosidad){
        return not self.estaExcedidoDePeso() and self.cosasCargadasNoSuperanPeligrosidad(nivelPeligrosidad)
    }
    // Agregados al camion
    method tieneUnaCosaEntre(unMinimo, unMaximo){
        return carga.any({c => c.peso().between(unMinimo, unMaximo)})
    }
    method cosaMasPesada(){
        return carga.max({c => c.peso()})
    }
    // Parte #2
    method totalDeBultosCargados(){
        return carga.sum({c => c.bultosQueOcupa()})
    }
}