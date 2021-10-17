import UIKit

// Result Type

// 1.
// From: https://www.avanderlee.com/swift/result-enum-type/

/* The Result enum is defined as follows:
 
 enum Result<Success, Failure> where Failure: Error {
 
    case success(Success)
    case failure(Failure)
 
 }
 
 As you can see success can be anything, but failure needs
 to conform to the Error protocol.
 
 */

// defining the error type we could expect to find
enum EvenNumberError: Error {
    case emptyArray
}

// defining a function that fetches all even numbers of an Array.
// The only error case would be an empty Array, thus the
// EvenNumberError.emptyArray error type.
func evenNumbers(in collection: [Int]) -> Result<[Int], EvenNumberError> {
    guard !collection.isEmpty else {
        return .failure(EvenNumberError.emptyArray)
    }
    
    let evenNumbers = collection.filter{ element in element % 2 == 0 }
    return .success(evenNumbers)
}

let myCollection: [Int] = [3, 4, 6, 8, 7, 13, 24]
print(evenNumbers(in: myCollection)) // case Result.success
print(evenNumbers(in: []))           // case Result.failure

// we could embed the function in a switch case
switch evenNumbers(in:myCollection) {
case .success(let result):
    print("The even numbers are \(result)")
case .failure(let error):
    print("No even numbers found: \(error)")
}
