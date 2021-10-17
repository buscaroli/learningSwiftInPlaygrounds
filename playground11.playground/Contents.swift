// ERROR HANDLING IN SWIFT

import UIKit

print("~~~ Error handling ~~~")

print("\nThrowing errors: maintaining a predictable state by using immutable functions ~~~")

enum ParseLocationError: Error {
    case invalidData
    case locationDoesNotExidt
    case middleOfTheOcean
}

struct Location {
    let latitude: Double
    let longitude: Double
}

// To add a description click on the function declaration then press 'Cmd + Opt + /'
/// <#Description#>
/// - Parameters:
///   - latitude: A string with the latitude of the location
///   - longitude: A string with the longitude of the location
/// - Throws: Throws an Error of tipe ParseLocationError.invalidData if latitude or longitude can't be converted to Double
/// - Returns: A Location struct
func parseLocation(_ latitude: String, _ longitude: String) throws -> Location {
    guard let latitude = Double(latitude), let longitude = Double(longitude) else {
        throw ParseLocationError.invalidData
    }
    
    return Location(latitude: latitude, longitude: longitude)
}

print("\n~~~ passing valid arguments ~~~")
do {
    let myLocation = try parseLocation("52.4", "4.899431")
    print("Location: \(myLocation)")
} catch {
    print("Error: \(error)")
}

print("\n~~~ passing an invalid argument ~~~")
do {
    let myLocation = try parseLocation("not a Double", "4.899431")
    print("Location: \(myLocation)")
} catch {
    print("Error: \(error)")
}

print("~~~ Throwing errors and maintaining a predictable state: mutating temporary values ~~~")

// Use a temporary variable to store a change of state and copy it back to the
// definitive variable only after no error has been thrown

enum ListError: Error {
    case invalidValue
}

struct TodoList {
    private var values = [String]()
    
    mutating func append(strings: [String]) throws {
        var trimmedStrings = [String]()
        for string in strings {
            var trimmedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if trimmedString.isEmpty {
                throw ListError.invalidValue
            } else {
                trimmedStrings.append(trimmedString)
            }
        }
        values.append(contentsOf: trimmedStrings)
    }
    
    func printTodos() {
        if values.isEmpty {
            Swift.print("Todo list is empty, start planning man...")
        } else {
            for todo in values {
                Swift.print("- \(todo)")
            }
        }
    }
}

print("\n~~~ passing valid strings ~~~")
var firstList = TodoList()
do {
    try firstList.append(strings: ["Walk the dog", "Cook dinner", "Exercise", "Code"])
    } catch {
    print("Error: \(error)")
}
firstList.printTodos()

print("\n~~~ passing an invalid array of strings ~~~")
var secondList = TodoList()
do {
    try secondList.append(strings: ["Walk the dog", "", "Exercise", "Code"])
    } catch {
    print("Error: \(error)")
}
secondList.printTodos()


print("~~~ Throwing errors and maintaining a predictable state:  using 'defer' ~~~")
// Using 'defer' for a cleanup operation
// see ex 6.7 pag107 of Swift in Depth published by Manning

print("~~~ Propagating and catching errors ~~~")
/* It can be done in four ways:
 1. Simply catch the errors by using 'do try catch'
 2. Propagate the errors (bubble them up), which means throwing them higher up the stack
 3. Turn errors into Optionals with try?
 4. Assert that an error doesn't happen with try!
 
 See Chapter 6.2 @ pag 107 of Swift in Depth published by Manning*/
