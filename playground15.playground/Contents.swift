import UIKit

/* for loop with Optionals */

let names: [String?] = ["John Smith", nil, "Susan Smith", "Joanna Holloway", "Matthew Clark", nil, "Mark Hallaway"]


print("\nNon nil, displaying 'nil' using ??")
for (index, name) in names.enumerated() {
    print("\(index): \(name ?? "nil")")
}

print("\nNon nil, with index:")
for case let (index, name?) in names.enumerated() {
    print("\(index): \(name)")
}

print("\nNon nil and prefix of 'Jo':")
for case let name? in names where name.hasPrefix("Jo") {
    print(name)
}

print("\nNon nil and suffix of 'way':")
for case let name? in names where name.hasSuffix("way") {
    print(name)
}

print("\nNon nil and NOT suffix of 'way':")
for case let name? in names where !name.hasSuffix("way") {
    print(name)
}
for day in ["Monday", "Tuesday", "Wednesday", "thursday", "Friday", "Saturday", "Sunday"] {
    print("\nDay: \(day).")
    for tic in stride(from: 3, through: 24, by: 3) {
        switch tic {
        case 24: print("It's now Midnight.")
        default: print("It's now \(tic) o'clock.")

        }
    }
}

print("\nguard: ")
for num in 1...80 {
    guard num % 8 == 0 else { continue }
    print(num)
}

for num in 1...80 where (num % 8 == 0) {
    print(num)
}


// Lazy sequences

func fibonacci (_ num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(num - 1) + fibonacci(num - 2)
    }
}

print("\n~~~~~~~~~~~~\n")

//let fiboSeq = (0...20).map(fibonacci)
//print(fiboSeq[19])

let lazyFiboSeq = Array(0...20).lazy.map(fibonacci)
print(lazyFiboSeq[19])
