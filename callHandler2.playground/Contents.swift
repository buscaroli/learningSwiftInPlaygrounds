// In this case we have a Pizzaiolo that delegates the sale of pizzas to one of three stores.
// The type of pizza is given as an argument to the Pizzaiolo.


protocol SellsPizzaDelegate {
    func sells(_ type: String)
}

class Pizzaiolo {
    var delegate: SellsPizzaDelegate?
    
    func bakesPizza(_ type: String) {
        let pizza = "Pizza \(type)"
        
        delegate?.sells(pizza)
    }
    
}

struct Pizzeria: SellsPizzaDelegate {
    
    init(with cook: Pizzaiolo) {
        cook.delegate = self
    }
    
    func sells(_ type: String) {
        print("The Pizzeria handmakes a large \(type) and serves it with love.")
    }
}

struct Restaurant: SellsPizzaDelegate {
    
    init(with cook: Pizzaiolo) {
        cook.delegate = self
    }
    
    func sells(_ type: String) {
        print("The Restaurant serves a small \(type) and some parsley on a side.")
    }
}

struct Supermarket: SellsPizzaDelegate {
    
    init(with cook: Pizzaiolo) {
        cook.delegate = self
    }
    
    func sells(_ type: String) {
        print("The Supermarket hands out a box with a \(type) to whoever swiped their card.")
    }
}

let mario = Pizzaiolo()
let luigi = Pizzaiolo()
let mike = Pizzaiolo()

let tesmo = Supermarket(with: mario)
let daLuigi = Pizzeria(with: luigi)
let excelsiorGold = Restaurant(with: mike)

mario.bakesPizza("Pizza Salame")
luigi.bakesPizza("Pizza Margherita")
mike.bakesPizza("with sliced pineapples on top")
