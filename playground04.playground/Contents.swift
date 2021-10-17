import UIKit

let myArray = ["Bon Jovi", "Gabrielle", "Cher", "Abba", "Elton John"]

// Sorting using a separate function
func backwards (s1: String, s2: String) -> Bool {
    return s1 > s2
}

let reverseOrderArray01 = myArray.sorted(by: backwards)
print(reverseOrderArray01)

// Sorting using a closure expression
let reverseOrderArray02 = myArray.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})
print(reverseOrderArray02)

// Sorting using a closure with inferred parameter types
let reverseOrderArray03 = myArray.sorted(by: { s1, s2 in return s1 > s2 })
print(reverseOrderArray03)

// Sorting using a closure with inferred parameter types and implicit return
let reverseOrderArray04 = myArray.sorted(by: { s1, s2 in s1 > s2 })
print(reverseOrderArray04)

// Sorting using shorthand argument names (they are implicit in inline closures)
let reverseOrderArray05 = myArray.sorted(by: { $0 > $1 })
print(reverseOrderArray05)

// Sorting using operator methods! :D
let reverseOrderArray06 = myArray.sorted(by: > )
print(reverseOrderArray06)

// Sorting using a trailing closure:
let reverseOrderArray07 = myArray.sorted() { $0 > $1 }
print(reverseOrderArray07)

// Sortingusing a trailing closure without parentheses () as the closure
// will be the only argument
let reverseOrderArray08 = myArray.sorted { $0 > $1 }
print(reverseOrderArray08)

// map(_:)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [18, 25, 274]

// NB dictionary subscripts return an optional, hence the !
// Probably because you can't be certain you'll find the dictionary
// item you want.
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        print("number BEFORE is \(number) and output BEFORE is \(output)")
        output = digitNames[number % 10]! + output // stores rightmost digit
        number = number / 10 // gets rid of rightmost digit
        print("number AFTER is \(number), output AFTER is \(output)")
        print(" ~~~~ ")
    } while number > 0
    return output
}

print(strings)

// A closure remembers values in the block of code where it was defined
// In this case it remember the variable "total"
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var total = 0
    func incrementer() -> Int {
        total += amount
        return total
    }
    return incrementer
}
let increment10 = makeIncrementer(forIncrement: 10)
print(increment10())
print(increment10())
print(increment10())

let increment5 = makeIncrementer(forIncrement: 5)
print(increment5())
print(increment5())
print(increment5())

func countDownToZero (from startingTime: Int) -> () -> Int {
    var currentTime = startingTime+1
    func countDown() -> Int {
        if currentTime > 0 {
            currentTime -= 1
        }
        return currentTime
    }
    return countDown
}

let countDown5 = countDownToZero(from: 5)
for _ in 0..<7 {
    print(countDown5())
}

let countDown10 = countDownToZero(from: 10)
for _ in 0...11 {
    print(countDown10())
}

// More advanced topics to look into when coming across real problems:
// Look into @escaping closures, used for async operations
// Look into escaping closures that refer to self
// Look into @autoclosures
