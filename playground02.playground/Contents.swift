import UIKit

var str = "Hello, playground"

print(str.uppercased())

let myArray = ["Matt", "Mel", "Jack", "Daniel"]

for name in myArray[2...] {
    print(name.uppercased())
}

let myRange = 3...5
for number in myRange {
    print (number)
}


let multilineString = """
Line One \u{2665}.

Line Three \u{1f496}.

"""

// print(multilineString)
let multilineString2 = """
It is 15:\(6 * 5)
"""

print(multilineString + multilineString2)

for index in str.indices {
    print("\(str[index].uppercased())", terminator: " ")
}

var myArr1: Array<Int> = [1,2,3]
print(myArr1)

var myArr2: [Int] = [4,5,6]
print(myArr2)

var myArr3 = Array<Int>()
myArr3.append(30)
print(myArr3)

var myArr4 = Array(repeating: 1.0, count: 5)
print(myArr4)

var myArr5 = [1,2,3,4,5,6,7,8,9]
myArr5[2...4] = [10, 20] // 3->10, 4->20, 5 is lost
print(myArr5)

var mySet1 = Set<Int>()
mySet1 = [1,2,3,4,5,4,3,2,3,4]
print(mySet1)

print(mySet1.contains(2))
mySet1.insert(23)
print(mySet1)
print(mySet1.sorted(by: >))

var mySet2: Set<Int> = [3,4,5,4,0]
print(mySet2)

print(mySet1.intersection(mySet2))
print(mySet1.union(mySet2))
print(mySet1.symmetricDifference(mySet2))
print(mySet1.subtracting(mySet2))

var myDic1 = [String: Int]()
myDic1["Ada"] = 54
myDic1["Matt"] = 43
myDic1["Mel"] = 41
myDic1["John"] = 23
print(myDic1)

if let oldAge = myDic1.updateValue(100, forKey: "John") {
    print("John's age is \(myDic1["John"] ?? 1), his previous age was \(oldAge)")
}


for (name, age) in myDic1.sorted(by: { $0.value < $1.value }) {
    print("\(name) is \(age) years old.")
}


