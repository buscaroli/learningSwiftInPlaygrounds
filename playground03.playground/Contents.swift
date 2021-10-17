import UIKit

var base: Int = 3
var exp: Int = 3
var result: Int = 1
for _ in 1...exp {
    result *= base
}
print(result)

for index in stride(from: 10, to: 51, by: 10) {
    print("10 to 51 by 10: \(index)")
}

for index in stride(from: 10, through: 50, by: 10) {
    print("10 through 50 by 10: \(index)")
}

let myPoint = (6, 4)
switch myPoint {
case (0, 0):
    print("Point \(myPoint) is at the origin.")
case (_, 0):
    print("Point \(myPoint) is on the x-axis.")
case (0, _):
    print("Point \(myPoint) is on the y-axis.")
case (-5...5, -5...5):
    print("Point \(myPoint) is inside your cartesian area.")
default:
    print("Point \(myPoint) is outside of your cartesian area.")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

func greet(name: String) -> String {
    return "Hello \(name)!"
}

func greetAgain(name: String) -> String {
    return "Hello again \(name)!"
}

// This greet function is different from the one implemented earlier
// as they have a different number of parameters!!
func greet(name: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(name: name)
    } else {
        return greet(name: name)
    }
}

print(greet(name: "Bob", alreadyGreeted: true))
print(greet(name: "Jack", alreadyGreeted: false))


// NB The RETURN TYPES are named! (min and max)
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
// As the return types of the functions were named we can
// use them as bounds.min and bounds.max!
print("min is \(bounds.min) and max is \(bounds.max)")


// Only using parameter names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// Also using one argument label
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// If you just want to pass a value with no name/label use _
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)


// You can assign default values to the function's parameters in order
// to avoid adding an if else statement at the beginning of the function
// to check if the parameter is not nil and what to assign it if it isn't
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
    print("parameterWithoutDefault is \(parameterWithoutDefault).")
    print("parameterWithDefault is \(parameterWithDefault).")
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)


// Variadic parameters, the function will work with an unspecified
// amount of values. NB you ARE NOT passing a vector/array but you
// are actually passing multiple arguments!!
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2.5, 3.7, 4.0, 5))

// If you don't want to create a variable just to copy the value
// of your parameters (which are constants by default) you can
// use the inout keyword
// JUST REMEMBER to use & when calling the function!
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var one: Int = 1
var two: Int = 2
// Using & when calling the function
swapTwoInts(&one, &two)
print("one is \(one)")
print("two is \(two)")

// Functions can be passed as Parameters

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print(mathFunction(5, 6))


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
printMathResult(multiplyTwoInts, 5, 10)
printMathResult(multiplyTwoInts(_:_:), 5, 10) // <- alternative

// Functions can be returned from functions

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

// The return type of the function is (Int) -> Int
// which matches the return type of both stepFprward and
// stepBackward, so they can be returned from within it
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 5
let moveToZero = chooseStepFunction(backward: currentValue > 0)
print("> currentValue is: \(moveToZero(currentValue))")
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveToZero(currentValue)
}
print("zero!")
