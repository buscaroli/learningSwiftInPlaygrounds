import UIKit
import CoreGraphics

protocol IsAuthorized {
    func givesPrize(_ recipient: Person)
}

struct Person {
    var name: String
    var address: String
}

class Jury {
    var award: String
    
    var delegate: IsAuthorized?
    
    init(_ award: String) {
        self.award = award
    }
    
    func introduction() {
        print("The Jury of \(award) has reached a verdict.")
    }
    
    func sendLetter(to person: Person) {
        print("\nSending a letter to notify \(person.name).")
        delegate?.givesPrize(person)
    }
}

struct Presenter: IsAuthorized {
    
    private var presenterName: String
    
    
    init(presenterName: String, jury handler: Jury) {
        self.presenterName = presenterName
        handler.delegate = self
    }
    
    func givesPrize( _ recipient: Person) {
        print("\(presenterName) gives the prize to \(recipient.name) at their place in \(recipient.address).")
    }
}


// TESTING

let nobel = Jury("the Nobel Prize")
let strega = Jury(" the Premio Strega")
let oscars = Jury(" the Oscars")

let george = Presenter(presenterName: "George", jury: nobel)
let marcello = Presenter(presenterName: "Marcello", jury: strega)
let ricky = Presenter(presenterName: "Ricky", jury: oscars)

let person1 = Person(name: "Mark", address: "123 commercial Road, NewTown")
let person2 = Person(name: "Patrizia", address: "via Indipendenza 24, Bologna")
let person3 = Person(name: "William", address: "3 Crescent Drive, Bath")

nobel.sendLetter(to: person1)
strega.sendLetter(to: person2)
oscars.sendLetter(to: person3)


