// About Struct and Class Initialisers

import UIKit

// Memberwise initialisers: they are the initialisers created by default
// by Swift.

enum Pawn: CaseIterable {
    case shoe, car, cat, iron
}

struct Player {
    let name: String
    let pawn: Pawn
}

let john = Player(name: "John", pawn: .shoe)

print("Name: \(john.name) \nPawn: \(john.pawn)")

print("~~~ Custom initializers ~~~")
// If you want to be able to create a struct by passing only part of the
// parameters, create a custom initialiser. However this way you can't
// use the memberwise initialiser.

struct Player2 {
    let name: String
    let pawn: Pawn
    
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

let susan = Player2(name: "Susan")
print("Name: \(susan.name) \nPawn: \(susan.pawn)")
// You can't create a structure passing both name and pawn, you've lost
// the memebrwise initialiser!

print("~~~ Using a custom initialiser AND restoring the memberwise initialiser ~~~")
// You have to create a struct and then extend it with the custom initialiser.
// This way you keep the memberwise initialiser too.

struct Player3 {
    let name: String
    let pawn: Pawn
}

extension Player3 {
    init(name: String) {
        self.name = name
        self.pawn = Pawn.allCases.randomElement()!
    }
}

let jack = Player3(name: "Jack")
print("Name: \(jack.name) \nPawn: \(jack.pawn)")

let daniel = Player3(name: "Daniel", pawn: .cat)
print("Name: \(daniel.name) \nPawn: \(daniel.pawn)")

print("~~~ Pancake example of memberwise initialiser loss ~~~")
struct Pancakes {
    enum SyrupType {
        case corn
        case molasses
        case maple }
    let syrupType: SyrupType
    let stackSize: Int
    init(syrupType: SyrupType) {
        self.stackSize = 10
        self.syrupType = syrupType
    }
}

let morePancakes = Pancakes(syrupType: .maple)
print(morePancakes.syrupType, morePancakes.stackSize)
// the following won't work, there is no memberwise initialiser!
// let pancakes = Pancakes(syrupType: .corn, stackSize: 8)


print("~~~ Designated and Convenience Initialisers ~~~ ")

class BoardGame {
    let players: [Player3]
    let numberOfTiles: Int
    
    // designated initialiser
    init(players: [Player3], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    // convenience initialiser: just pass the names of the players
    convenience init(names: [String]) {
        var players = [Player3]()
        for name in names {
            players.append(Player3(name: name))
        }
        // call the designated initialiser passing the parameters
        self.init(players: players, numberOfTiles: 32)
    }
    
    // convenience initialiser: just pass an array of players
    convenience init(players: [Player3]) {
        self.init(players: players, numberOfTiles: 32)
    }
    
}

let playersGroup1 = [
    Player3(name: "Anne"),
    Player3(name: "Bob"),
    Player3(name: "Charlie")
]

// creating a board game passing an array of players
let boardGame1 = BoardGame(players: playersGroup1)

// creating a board game passing an array of names
let boardGame2 = BoardGame(names: ["Jack", "John", "James"])

// creating  board game using the designated initialiser
let boardGame3 = BoardGame(players: playersGroup1, numberOfTiles: 24)

print("~~~ Subclassing ~~~")

// creating a subclass called MutabilityLand that subclasses BoardGame

class MutabilityLand: BoardGame {
    // no initialisers because:
    // scoreBoard is initialised outside the initialiser
    // winner is an Optional (Player3?)
    var scoreBoard = [String: Int]() // keeps track of the ganmes
    var winner: Player3? // keeps track of the winner (nil on first game)
}

// inheriting a convenience initialiser
let mutaLandGame1 = MutabilityLand(names: ["Alex", "Barbara", "Carina"])

// inheriting another convenience initialiser
let mutaLandGame2 = MutabilityLand(players: playersGroup1)

// inheriting the designated initialiser
let mutaLandGame3 = MutabilityLand(players: playersGroup1, numberOfTiles: 24)

// By adding an unpopulated property to a subclass you LOSE ALL THE INITIALISERS!!

class AnotherLand: BoardGame {
    // no initialisers because:
    // scoreBoard is initialised outside the initialiser
    // winner is an Optional (Player3?)
    var scoreBoard = [String: Int]() // keeps track of the ganmes
    var winner: Player3? // keeps track of the winner (nil on first game)
    
    let instructions: String
    
    init(players: [Player3], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
}

// now we can only instantiate the class through the subclass initialiser!
let anotherLandGame1 = AnotherLand(players: playersGroup1, instructions: "Try not to die.", numberOfTiles: 48)

// Let's get those inherited initialisers back with 'override'
class BeautifulLand: BoardGame {
    // no initialisers because:
    // scoreBoard is initialised outside the initialiser
    // winner is an Optional (Player3?)
    var scoreBoard = [String: Int]() // keeps track of the ganmes
    var winner: Player3? // keeps track of the winner (nil on first game)
    
    let instructions: String
    
    init(players: [Player3], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    override init(players: [Player3], numberOfTiles: Int) {
        self.instructions = "Try not to die too soon."
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
}

let beautifulLandGame1 = BeautifulLand(names: ["Cindy", "Mandy", "Sally"])
let beautifulLandGame2 = BeautifulLand(players: playersGroup1)
let beautifulLandGame3 = BeautifulLand(players: playersGroup1, numberOfTiles: 24)

// We can also override with a 'conveninece override' initialiser!

class BadLand: BoardGame {
    // no initialisers because:
    // scoreBoard is initialised outside the initialiser
    // winner is an Optional (Player3?)
    var scoreBoard = [String: Int]() // keeps track of the ganmes
    var winner: Player3? // keeps track of the winner (nil on first game)
    
    let instructions: String
    
    init(players: [Player3], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: players, numberOfTiles: numberOfTiles)
    }
    
    // this convenience initialiser points to the designated iniitaliser above.
    // But now you have to pass a value for 'instructions', in this case hardcoded
    convenience override init(players: [Player3], numberOfTiles: Int) {
        self.init(players: players, instructions: "Try not to die", numberOfTiles: numberOfTiles)
    }
}

print("~~~ Required Initialisers: for Factory methods and Protocols. ~~~")
// TO BE REVIEWED

// required initialisers for Factory Method, which are used to facilitate creating
// instances of a class

class BoardGame2 {
    let players: [Player3]
    let numberOfTiles: Int
    
    // designated initialiser
    required init(players: [Player3], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    // convenience initialiser: just pass the names of the players
    convenience init(names: [String]) {
        var players = [Player3]()
        for name in names {
            players.append(Player3(name: name))
        }
        // call the designated initialiser passing the parameters
        self.init(players: players, numberOfTiles: 32)
    }
    
    // convenience initialiser: just pass an array of players
    convenience init(players: [Player3]) {
        self.init(players: players, numberOfTiles: 32)
    }
    
    // factory method, only works if adding required to the designated initialiser
    // of the BoardGame2 class
    class func makeGame(players: [Player3]) -> Self {
        let boardGame = self.init(players: players, numberOfTiles: 32)
        // config in here
        return boardGame
    }
}


class StinkyLand: BoardGame2 {
    var scoreBoard = [String: Int]() // keeps track of the ganmes
    var winner: Player3? // keeps track of the winner (nil on first game)
    
    let instructions: String

    
    init(players: [Player3], instructions: String, numberOfTiles: Int) {
        self.instructions = instructions
        super.init(players: playersGroup1, numberOfTiles: numberOfTiles)
    }

    convenience required init(players: [Player3], numberOfTiles: Int) {
        self.init(players: players, instructions: "Do your best", numberOfTiles: numberOfTiles)
    }
}

// Required initialisers for Protocols
protocol BoardGameType {
    init(players: [Player3], numberOfTiles: Int)
}

class BoardGame3: BoardGameType {
    let players: [Player3]
    let numberOfTiles: Int
    
    // designated initialiser
    required init(players: [Player3], numberOfTiles: Int) {
        self.players = players
        self.numberOfTiles = numberOfTiles
    }
    
    // convenience initialiser: just pass the names of the players
    convenience init(names: [String]) {
        var players = [Player3]()
        for name in names {
            players.append(Player3(name: name))
        }
        // call the designated initialiser passing the parameters
        self.init(players: players, numberOfTiles: 32)
    }
    
    // convenience initialiser: just pass an array of players
    convenience init(players: [Player3]) {
        self.init(players: players, numberOfTiles: 32)
    }
}

// If the class if declared as 'final' the required keyword is NOT needed anymore!
