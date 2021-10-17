// OPTIONALS

import UIKit

struct Customer {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?
}


// if let
func checkName(of name: Customer) {
    if let name = name.firstName {
        print("name: \(name).")
    } else {
        print("Name wasn't entered in DB.")
    }
}

let john = Customer(id: "1", email: "john@mymail.com", balance: 10000, firstName: "John", lastName: nil)

print(john.email)
print(john.firstName)
checkName(of: john)

print("~~~")

let susan = Customer(id: "2", email: "susan@mymail.com", balance: 120000, firstName: nil, lastName: "Williams")
print(susan.firstName)
checkName(of: susan)

print("~~~")

func checkLastName (of name: Customer) {
    switch name.lastName {
    case .some(let name): print("Last Name: \(name).")
    case .none: print("Last name not in DB.")
    }
}

checkLastName(of: john)
checkLastName(of: susan)

print("~~~")

// Alternatively also using switch
func checkLastName2 (of name: Customer) {
    switch name.lastName {
    case let name?: print("Last Name, v2: \(name).")
    case nil: print("Last name v2: not in DB")
    }
}

checkLastName2(of: john)
checkLastName2(of: susan)

print("~~~ Combining optional unwrapping ~~~")

let mark = Customer(id: "3", email: "mark@mymail.com", balance: 8000, firstName: nil, lastName: nil)
let eleri = Customer(id: "4", email: "eleri@mymail.com", balance: 25000, firstName: "Eleri", lastName: "Llewellyn")

func checkFullName(of person: Customer) {
    if let fname = person.firstName, let lname = person.lastName {
        print("First name: \(fname), last name: \(lname).")
    } else {
        print("We don't know both the first and last names.")
    }
}

checkFullName(of: john)
checkFullName(of: susan)
checkFullName(of: mark)
checkFullName(of: eleri)

print("~~~ Checking for property but not interested in it, just that it's not nil ~~~")
// could also be done with a traditional nil check: if name.firstName != nil ...
func checkHasName(of name: Customer) {
    if let _ = name.firstName {
        print("First name in DB.")
    } else {
        print("First name NOT in DB.")
    }
}

checkHasName(of: john)
checkHasName(of: susan)


print("~~~ variable shadowing inside the extension ~~~")
// NB feel free to use variable shadowing!
// if let firstName = firstName is OK, you don't need to come up with a variation of the name
// like if let fname = firstName !!

extension Customer: CustomStringConvertible {
    var description: String {
        var customDescription: String = "\(id), \(email)"
        
        if let firstName = firstName {
            customDescription += ", \(firstName)"
        }
        
        if let lastName = lastName {
            customDescription += ", \(lastName)"
        }
        return customDescription
    }
}

print(john.description)
print(susan.description)
print(eleri.description)

print("~~~ computed property with a guard: NONE SHALL PASS!")

struct Customer2 {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?
    
    var displayName: String {
        // if neither firstName nor lastName are present, return an empty string
        guard let firstName = firstName, let lastName = lastName else {
            return ""
        }
        return "\(firstName) \(lastName)"
    }
}

let john2 = Customer2(id: "1", email: "john@mymail.com", balance: 10000, firstName: "John", lastName: nil)
let susan2 = Customer2(id: "2", email: "susan@mymail.com", balance: 120000, firstName: nil, lastName: "Williams")
let mark2 = Customer2(id: "3", email: "mark@mymail.com", balance: 8000, firstName: nil, lastName: nil)
let eleri2 = Customer2(id: "4", email: "eleri@mymail.com", balance: 25000, firstName: "Eleri", lastName: "Llewellyn")

print(john2.displayName)
print(eleri2.displayName)

print("~~~ Better option for the displayProperty: return an OPTIONAL STRING! ~~~")
// ometimes it makes sense to return an empty string, many times it doesn't as some part
// of your program needs to have something to work with or skip something entirely.
// In this case use an Optional, which is also safer as you get compile time peace of mind.
// When calling the method you'll have to be more verbose and handle the cases, but still
// better safe than sorry!
struct Customer3 {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?
    
    var displayName: String? {
        // if neither firstName nor lastName are present, return nil
        guard let firstName = firstName, let lastName = lastName else {
            return nil
        }
        return "\(firstName) \(lastName)"
    }
}

let john3 = Customer3(id: "1", email: "john@mymail.com", balance: 10000, firstName: "John", lastName: nil)
let susan3 = Customer3(id: "2", email: "susan@mymail.com", balance: 120000, firstName: nil, lastName: "Williams")
let mark3 = Customer3(id: "3", email: "mark@mymail.com", balance: 8000, firstName: nil, lastName: nil)
let eleri3 = Customer3(id: "4", email: "eleri@mymail.com", balance: 25000, firstName: "Eleri", lastName: "Llewellyn")

if let displayName1 = john3.displayName {
    print("\(displayName1) likes using Optionals in Swift.")
} else {
    print("Customer likes Optionals in Swift.")
}

if let displayName2 = eleri3.displayName {
    print("\(displayName2) likes using Optionals in Swift.")
} else {
    print("Customer happy likes Optionals in Swift.")
}

if let displayName3 = susan3.displayName {
    print("\(displayName3) likes using Optionals in Swift.")
} else {
    print("Customer happy likes Optionals in Swift.")
}

if let displayName4 = mark3.displayName {
    print("\(displayName4) likes using Optionals in Swift.")
} else {
    print("Customer happy likes Optionals in Swift.")
}

print("~~~ By replacing the guard with a switch statement we can gain some flexibility ~~~")
// Let's see how we can decide to accept an incomplete name (just first or last name)

struct Customer4 {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?
    
    var displayName: String? {
        // if neither firstName nor lastName are present, return nil
        switch (firstName, lastName) {
        case let (first?, last?): return first + " " + last
        case let (first?, nil): return first
        case let (nil, last): return last
        default: return nil
        }
    }
}

let john4 = Customer4(id: "1", email: "john@mymail.com", balance: 10000, firstName: "John", lastName: nil)
let susan4 = Customer4(id: "2", email: "susan@mymail.com", balance: 120000, firstName: nil, lastName: "Williams")
let mark4 = Customer4(id: "3", email: "mark@mymail.com", balance: 8000, firstName: nil, lastName: nil)
let eleri4 = Customer4(id: "4", email: "eleri@mymail.com", balance: 25000, firstName: "Eleri", lastName: "Llewellyn")

if let john4 = john4.displayName {
    print("\(john4) likes using Swift!")
} else {
    print("Customer likes using Swift!")
}

if let susan4 = susan4.displayName {
    print("\(susan4) likes using Swift!")
} else {
    print("Customer likes using Swift!")
}

if let eleri4 = eleri4.displayName {
    print("\(eleri4) likes using Swift!")
} else {
    print("Customer likes using Swift!")
}

if let mark4 = mark4.displayName {
    print("\(mark4) likes using Swift!")
} else {
    print("Customer likes using Swift!")
}

print("~~~ We can use the nil coalescing operator! ~~~")
// Let's improve the way we call the function
print("\(john4.displayName ?? "Customer") loves using the nil coalescing operator in Swift!")
print("\(susan4.displayName ?? "Customer") loves using the nil coalescing operator in Swift!")
print("\(eleri4.displayName ?? "Customer") loves using the nil coalescing operator in Swift!")
print("\(mark4.displayName ?? "Customer") loves using the nil coalescing operator in Swift!")


// Patter matching on an Optional

// gold: 10% discount, silver: 5% discount, no membership(nil) no discount
enum Membership {
    case gold
    case silver
}

struct Customer5 {
    let id: String
    let email: String
    let balance: Int
    let firstName: String?
    let lastName: String?
    
    let membership: Membership?
    
    var displayName: String? {
        // if neither firstName nor lastName are present, return nil
        switch (firstName, lastName) {
        case let (first?, last?): return first + " " + last
        case let (first?, nil): return first
        case let (nil, last): return last
        default: return nil
        }
    }
}

print("~~~ Pattern matching on an Optional ~~~ ")
let charlie = Customer5(id: "5", email: "charlie@mymail.com", balance: 10000, firstName: "Charlie", lastName: nil, membership: Membership.gold)
let elaine = Customer5(id: "6", email: "elaine@mymail.com", balance: 120000, firstName: nil, lastName: "Bennett", membership: nil)

if let charlieM = charlie.membership {
    switch charlieM {
    case .gold: print("10% discount")
    case .silver: print("5% discount")
    }
} else {
    print("No discount")
}

if let elaineM = elaine.membership {
    switch elaineM {
    case .gold: print("10% discount")
    case .silver: print("5% discount")
    }
} else {
    print("NO SOUP FOR YOU! COME BACK... ONE YEAR!")
}

print("~~ We can do better ~~~")
// Let's avoid using if let

switch charlie.membership {
case .gold?: print("10% discount")
case .silver?: print("5% discount")
case nil: print("No discount")
}

switch elaine.membership {
case .gold?: print("10% discount")
case .silver?: print("5% discount")
case nil: print("NO SOUP FOR YOU! COME BACK... ONE YEAR!")
}



