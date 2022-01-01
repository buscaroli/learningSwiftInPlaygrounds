import UIKit

// Protocol: any Class or Struct adhering to this protocol must implement a "deliver" function
// with the same signature.
protocol HasVan {
    func deliver(to address: String) -> Void
}


// Class using the delegate pattern.
// Needs to have a delegate var of the same type as the Protocol in order to connect to the other
// structs and classes.
class CentralHUB {
    var delegate: HasVan?
    
    func pingDriver(to address: String) {
        delegate?.deliver(to: address)
    }
    
    func startOfDay() {
        print("Unit opening...")
    }
}

// Struct adhering to the protocol.
// Needs to implement the function of the protocol (deliver).
// Needs to "sign up" with the class that is using the delegate pattern, which has a var generally called delegate.
// This can be done in the initializer.
struct CarDriver:HasVan {
    init(_ handler: CentralHUB) {
        handler.delegate = self
    }
    
    func deliver(to address: String) {
        print("The Car driver is delivering to \(address).")
    }
}

struct BikeDriver:HasVan {
    init(_ handler: CentralHUB) {
        handler.delegate = self
    }
    
    func deliver(to address: String) {
        print("The Bike Driver is delivering to \(address).")
    }
}

// TESTING

let london01 = CentralHUB()
let london02 = CentralHUB()

london01.startOfDay()
london02.startOfDay()

let john = CarDriver(london01)
let mike = BikeDriver(london02)

london01.pingDriver(to: "Victor Meldrew, the Pain in the Arse, Luton")
london02.pingDriver(to: "Roy and Moss, the Basement, Denholm Industries")

london01.pingDriver(to: "John and Mary, the Shop, Craggy Island")
london02.pingDriver(to: "Manuel, the room with a view, Fawlty Towers, Cornwall")
