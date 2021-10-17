import UIKit

enum Suit {
    case hearts
    case clubs
    case diamonds
    case spades
}

// initialising a variable with a type of "Suit"
var card1 = Suit.hearts
print(card1)
// no need to use "Suit" before .diamonds as card1 had already been initialised and
// the compiler understands we are working with a type of "Suit"
card1 = .diamonds
print(card1)


enum Drinks: CaseIterable {
    case coffee, tea, lemonade
}

let allDrinks = Drinks.allCases

for item in allDrinks {
    print(item)
}

// Associated values (or discriminated unions, tagged unions, variants)

// a barcode can be either an upc OR a qrCode (not both)
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(23, 53, 345, 85)
print(productBarcode)

// we can assign a qrCode to it IN PLACE OF the upc code
productBarcode = .qrCode("AJFNSJMSDDNSNSMQMNCJCO")
print(productBarcode)
print("~~~~~")

func showBarcode(code: Barcode) {
    print("BARCODE:")
    switch code {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
}

showBarcode(code: productBarcode)

// RAW Values

// We can assign default values to the elements of the enumeration, but
// they need to be all of the same type (in this case Character).
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

/* NB (from Apple's Swift Programming Language Guide)
 
 The raw value for a particular enumeration case is always the same. Associated values
 are set when you create a new constant or variable based on one of the enumeration’s
 cases, and can be different each time you do so.
*/

// When assigning an Int to the elements of an enumeration, the values are assigned
// by adding 1 to the first value. // If the first case doesn't have a value it will be
// set to 0.
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Enumerations of type String have implicit raw values equal to their names,
// eg "north", "south" etc.
enum CompassPoint: String {
    case north, south, east, west
}

// You can access the rawValues with the rawValue property
let earthsOrder = Planet.earth.rawValue
print(earthsOrder)

let shoreDirection = CompassPoint.east.rawValue
print(shoreDirection)

// When defining an enumeration with a raw value, it is not certain that that value
// will exist (similarly to what happen with dictionaries) so the compiler returns
// an optional type.
let jupiter = Planet(rawValue: 5)
print(jupiter!) // unwrapping the optional type

func selectPlanet(planetNumber: Int) {
    if let planet = Planet(rawValue: planetNumber){
        switch planet {
        case .earth:
            print("Nice corner of the Universe!")
        case .mercury, .venus:
            print("A bit too hot in there!")
        case .mars:
            print("Lots of weird shy people around...")
        default:
            print("You must be joking...")
        }
    } else {
        print("You just made that up mate...")
    }
}

selectPlanet(planetNumber: 11)
selectPlanet(planetNumber: 3)
selectPlanet(planetNumber: 4)
selectPlanet(planetNumber: 6)

// Recursive Enumerations
// Check it out again later

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// Alternatively:
//indirect enum ArithmeticExpression {
//    case number(Int)
//    case addition(ArithmeticExpression, ArithmeticExpression)
//    case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
