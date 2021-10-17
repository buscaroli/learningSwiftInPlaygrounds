// GENERICS IN SWIFT

import UIKit


print("""
~~~
Generics allow you to reuse code and avoid the use of the <Any> type.
1. You can reuse your code without the need to reimplement the same function
    with a different type each time (Swift does this for you behind the scenes
    but it also does it in a smart way, avoiding to create functions with
    types that aren't necessary.
2.  TODO Check why in my example there is no need to downcast!
    By using a generic instead of Any, you have your code checked at compile-time
    rather than at runtime.
    If you tried to check the type of a variable in a function that's using ANy
    you would get <Any>, but if you did this in a function that's using Generics
    you would get the appropriate type eg <Int>, <String> etc.
~~~
""")

func firstLast (elements: [Any]) -> (Any, Any) {
    return (elements[0], elements[elements.count-1])
}

let stringArray = ["Matt", "Mel", "John", "Sue", "Clare", "Sally"]
let intArray = [1, 3, 5, 2, 4, 6]

let strOne, strTwo: Any
let intOne, intTwo: Any

print("firstLast with Any: you are supposed to downcast to String")
(strOne, strTwo) = firstLast(elements: stringArray)
print("strOne: \(strOne)")
print("strTwo: \(strTwo)")
print("type of strOne: \(type(of: strOne))")
print("""
\nTODO
I was expecting the type of strOne to be <Any> but it is <String>. Will have
to check why at point 2. of the intro Swift in Depth mentioned the need to
downcast. Maybe it was referring to the fact that the two variables strOne and
strTwo needs to be initialised to Any in order for it to work. Also, if you
OPTION + CLICK on strOne you get the type of Any.\n
""")



print("firstLast with Any: you are supposed to downcast to Int")
(intOne, intTwo) = firstLast(elements: intArray)
print("intOne: \(intOne)")
print("intTwo: \(intTwo)")
print("type of intOne: \(type(of: intOne))")
print("""
\nTODO
I was expecting the type of intOne to be <Any> but it is <Int>. Will have
to check why at point 2. of the intro Swift in Depth mentioned the need to
downcast. Maybe it was referring to the fact that the two variables strOne and
strTwo needs to be initialised to Any in order for it to work. Also, if you
OPTION + CLICK on intOne you get the type of Any.\n
""")

print("""
~~~
Creating a Generic Function. This time I can use variables that have been
assigned to a specific type, eg String or Int
~~~
""")
func firstLastGeneric<T> (array: [T]) -> (T, T) {
    return (array[0], array[array.count-1])
}

let strThree, strFour: String
let intThree, intFour: Int

(strThree, strFour) = firstLastGeneric(array: stringArray)
print("strThree: \(strThree), strFour: \(strFour).")
print("type of strThree: \(type(of: strThree)).")

(intThree, intFour) = firstLastGeneric(array: intArray)
print("intThree: \(intThree), intFour: \(intFour).")
print("type of intThree: \(type(of: intThree)).")

print("\n~~~ Constraining Generics: Comparable ~~~\n")

print("""
If comparing two variables initialised as Generics you need to constrain the
function with a protocol, in this case 'Comparable', otherwise a function like
sorted() wouldn't know what T is and how to compare it.
""")
func lowest<T: Comparable> (_ array: [T]) -> T? {
    return array.sorted().first
}

print("lowest of stringArray: \(lowest(stringArray)!).")
print("lowest of intArray: \(lowest(intArray)!).")

print("""
We can use the 'lowest' function with our types as long as we provide an
implementation of 'Comparable'.
You just need to implement '<' and Swift can automatically implement '=='
and with '<' and '==' Swift can also automatically implement '>' .
""")
enum Grade: Comparable {
    case excellent, good, poor
    
    static func <(lhs: Grade, rhs: Grade) -> Bool {
        switch (lhs, rhs) {
        case (good, excellent): return true
        case (poor, good): return true
        case (poor, excellent): return true
        default: return false
        }
    }
}

print("excellent < poor: \(Grade.excellent < Grade.poor).")
print("good > poor: \(Grade.good > Grade.poor).")
print("good > good: \(Grade.good > Grade.good).")
print("excellent == excellent: \(Grade.excellent == Grade.excellent).")
print("lowest of Grades: \(lowest([Grade.good, Grade.excellent, Grade.poor])!).")

print("\n~~~ Constraining Generics: Hashable ~~~\n")

print("Creating a function that given an array returns a dictionary of the occurences of the elements.")
func occurrences<T: Hashable> (_ array: [T]) -> [T: Int] {
    var dict = [T: Int]()
    
    for element in array {
        dict[element, default: 0] += 1
    }
    
    return dict
}

print("occurences of an array of chars: \(occurrences(["h", "e", "l", "l", "o", "l", "o", "u", "i", "s", "e"])).")


print("\n~~~ Creating a Generic Type  TODO  pag 134~~~\n")
