import Foundation

protocol CPRCertified {
    func performCPR()
}

// Call-handler has a delegate property set as an Optional
// When a struct or class compliant with the CPRCertificate is instantiated,
// the a CallHandler object/instance is passed as an argument.
class CallHandler {
    var delegate: CPRCertified?
    
    func assessSituation () {
        print ("Everything OK")
    }
    
    func emergencyCall() {
        delegate?.performCPR()
    }
}

// When instantiating the Nurse struct, a CallHandler object needs to be passed as an argument
struct Nurse: CPRCertified {
    
    init(handler: CallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The nurse performs CPR")
    }
    
    func inject() {
        print("The nurse injects some adrenaline")
    }
        
}

struct Paramedic: CPRCertified {
   
    init(handler: CallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic performs CPR")
    }
    
    func giveMedicine() {
        print("The paramedic gives one tablet of anti-histamine")
    }
    
}

let romeo = CallHandler()

// sally is instantiated with romeo as the call-handler
let sally = Paramedic(handler: romeo)

// now romeo can run the emergency function without bothering who is gonna deliver it
// it can be any of the struct/class compliant with the CPRCertified protocol that has
// been instantiated.
romeo.emergencyCall()


