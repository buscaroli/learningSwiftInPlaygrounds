import UIKit

var str = """
This is my \
first string let's \
check it out
"""

print(str)

var arr = [1, 3]
print(arr)

var tup: (one: String, two: String) = (one: "Matt", two: "Mel")
print(tup)

var dict: [String: String] = [
    "Matt": "Pistachio",
    "Mel": "Cream"
]

print(dict)

for (name, flavour) in dict {print("name: \(name) and flavour: \(flavour)")}

print(dict["Matt"]!)
print(dict["Bob", default: "Chocolate"])

var emptyDic = [String: String]()
print(emptyDic)

var emptyArray = [String]()
print(emptyArray)

var emptySet = Set<Int>()
print(emptySet)

enum Colour {
    case blue
    case yellow
    case red
}

print(Colour.blue)

var arr2 = [6, 7, 8]

var arr3 = arr + arr2
print(arr3)

var str1 = "Hi there "
var str2 = "how you doing?"
var str3 = str1 + str2
print(str3)

//for i in 1...10 {
//    for j in 1...10 {
//        let product = i * j
//        print ("\(i) * \(j) is \(product)")
//    }
//}

func squareNum(num: Int) -> Int {
    return num * num
}
print(squareNum(num: 5))

func square(numbers: Int...) {
    for num in numbers {
        print(num*num)
    }
}

square(numbers: 3)
square(numbers: 1, 2, 3)

// Functions parameters are constant and can't be modified unless
// the keyword inout is added to the signature of the function
func doubleOriginalNumber(number: inout Int) {
    number*=2
}

var myNum = 5
doubleOriginalNumber(number: &myNum)
print(myNum)
doubleOriginalNumber(number: &myNum)
print(myNum)

func cube(_ num: Int) -> Int {
    return (num * num * num)
}

print(cube(5))

let cubeAgain: (Int) -> Int = {
    return ($0 * $0 * $0)
}

cubeAgain(4)

let greeting:(String, String) -> String = { (time:String, name:String) -> String in
    return "Good \(time), \(name)!"
}

let text = greeting("morning", "Arthur")
print(text)


let names = ["Zaphod", "Slartibartfast", "Trillian", "Ford", "Arthur", "Marvin"]
let sortedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 < s2 })
print(sortedNames)

print([1, 4, 54, 23, 76, 12].sorted(by: {(n1: Int, n2: Int) -> Bool in return n1 < n2}))

print([1,8,3,5].sorted { $0 < $1
})

struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicSportStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        } else {
            return "\(name) is NOT an Olympic Sport"
        }
    }
}

var tennis = Sport(name: "Tennis", isOlympicSport: false)

print(tennis)
print(tennis.name)
print(tennis.olympicSportStatus)

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var study = Progress(task:"Studying iOS development", amount: 25)


print(study)
print(study.amount)

study.amount = 50

let string = "What a Wonderful World!"
print(Set(string))
var string2 = Set(string.uppercased()).sorted().filter{$0 != "!" && $0 != " "}
print(string2)

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"


struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person2 = Person(name: "Matt")
print(person2)

class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
print(poppy.name)

class Human {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }

    deinit {
        print("\(name) is no more!")
    }}

for _ in 1...3 {
    let human = Human()
    human.printGreeting()
    print(human.name)
}

protocol Identifiable {
    var id: String { get set }
}

struct Nerd: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

var nerd1 = Nerd(id: "123456")
print(nerd1.id)

displayID(thing: nerd1)

extension Int {
    func squared() -> Int {
        return self * self
    }
}

print(12.squared())

extension Int {
    var isEven: Bool {
        print(self)
        return self % 2 == 0
    }
}

var thirteen: Int = 13
if thirteen.isEven {print("is Even!")} else {print("is NOT even")}
if 12.isEven {print("is Even!")} else {print("is NOT even")}


func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

greet("Mark")
greet(nil)

let names2 = ["John", "Paul", "George", "Ringo"]
print(names2.first?.uppercased())


class Animal { }
class Fish: Animal { }

class Doggy: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Doggy(), Fish(), Doggy()]

for pet in pets {
    if let dog = pet as? Doggy {
        dog.makeNoise()
    }
}


