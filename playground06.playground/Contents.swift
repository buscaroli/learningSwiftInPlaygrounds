// ABOUT ENUMS

import UIKit
import Foundation

let mixedArray: [Any] = [3, "Hi there", true, 4, "not again...", false]

func logMixedArray (name: [Any]) {
    for element: Any in mixedArray {
        switch element {
        case let num as Int: print("The item is an Int of value \(num).")
        case let str as String: print("The item is a String of value \(str).")
        case let boo as Bool: print("The item is a Boolean of value \(boo).")
        default: print("Item unrecognised.")
        }
    }
}

logMixedArray(name: mixedArray)

let now = Date()
let oneHourFromNow = Date(timeIntervalSinceNow: 3600)

enum DateType {
    case singleDate(Date)
    case dateRange(Range<Date>)
}

let dates: [DateType] = [
    DateType.singleDate(now),
    DateType.dateRange(now..<oneHourFromNow)
]

for dateType in dates {
    switch dateType {
    case .singleDate(let date): print("Date is \(date)")
    case .dateRange(let range): print("Range is \(range)")
    }
}

enum PaymentType {
    case invoice
    case creditcard
    case cash
}

//struct PaymentStatus {
//    let paymentDate: Date?
//    let isRecurring: Bool
//    let paymentType: PaymentType
//}
// Converting the struct into an enum
enum PaymentStatus {
    case invoice(paymentDate: Date?, isRecurring: Bool)
    case creditcard(paymentDate: Date?, isRecurring: Bool)
    case cash(paymentDate: Date?, isRecurring: Bool)
}

// Exercise

enum Topping {
    case creamCheese
    case peanutButter
    case jam
}

enum BagelType {
    case cinnamonRaisin
    case glutenFree
    case oatMeal
    case blueberry
}

//struct Bagel {
//    let topping: Topping
//    let type: BagelType
//}
// Converting the struct into a enum

enum Bagel {
    case cinnamonRaisin(topping: Topping)
    case glutenFree(topping: Topping)
    case oatMeal(topping: Topping)
    case blueberry(topping: Topping)
}

// The other way around would also work
enum Bagel2 {
    case creamCheese(BagelType) // or creamCheese(type: BagelType)
    case peanutButter(BagelType)// should be the same, to be confirmed!
    case jam(BagelType)
}



//enum Puzzle {
//    case baby(numberOfPieces: Int)
//    case toddler(numberOfPieces: Int)
//    case preschooler(numberOfPieces: Int)
//    case gradeschooler(numberOfPieces: Int)
//    case teenager(numberOfPieces: Int)
//}
// Converting it into a Struct

enum Age {
    case baby
    case toddler
    case preschooler
    case gradeschooler
    case teenager
}

struct Puzzle {
    let age: Age
    let numberOfPieces: Int
}


