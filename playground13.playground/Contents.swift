import UIKit

// Enums
// raw values are assigned from 0, unless a different number is specified.
// In this case the first enum (ace) will have an associated raw number of 1,
// two will have 2 etc.

enum Card: Int {
    case ace = 1
    
    case two, three, four, five, six,
         seven, eight, nine, ten
    case jack, queen, king
    
    func description() -> String {
        switch self {
        case .ace:
            return "Ace"
        case .jack:
            return "Jack"
        case  .queen:
            return "Queen"
        case .king:
            return "King"
        default:
            return String(self.rawValue).capitalized(with: Locale(identifier: "en_GB"))
        }
    }
}

let cardSeven = Card.seven
let cardQueen = Card.queen
print(cardSeven.description())
print(cardQueen.description())

// Collections
var arrOfInt: [Int] = Array(repeating: 1, count: 3)
print(arrOfInt)
arrOfInt.append(2)
print(arrOfInt)
print(arrOfInt[arrOfInt.index(before: arrOfInt.count)])
arrOfInt[1...2] = [5]
print(arrOfInt)
arrOfInt += [10, 11, 12]
print(arrOfInt)
arrOfInt.remove(at: 4)
print(arrOfInt)

for item in arrOfInt {
    print("item: \(item).")
}

for (index, item) in arrOfInt.enumerated() {
    print("\(index). \(item)")
}

var setA = Set<String>()
setA.insert("Pizza")
setA.insert("Spaghetti")
setA.insert("Tortelli")
setA.insert("Nutella")

var setB: Set<String> = ["Bacon", "Fish and Chips", "Yorkshire pudding", "Nutella"]

print(setA.intersection(setB))
print(setA.union(setB))
print(setA.subtracting(setB))
print(setA.symmetricDifference(setB))

var numbers: [Int: String] = [:]
numbers[0] = "zero"
numbers[1] = "one"
numbers[2] = "two"
numbers[100] = "one hundred"

print(numbers[2] ?? "not available")
print(numbers[5] ?? "not available")

var colours: [String: String] = ["red": "rosso", "green": "verde", "blue": "blu", "yellow": "giallo"]
colours["red"]
colours["yellow"]
colours["pink"]
colours.updateValue("Azzurro", forKey: "blue")
print(colours)
colours.removeValue(forKey: "green")
print(colours)

for (key, value) in colours {
    print("The Italian for \(key) is \(value).")
}
