import Foundation

struct Player {
    let name: String
    var number: Int
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    mutating func changeNumber(new number: Int) {
        self.number = number
    }
}

var player1 = Player(name: "name1", number: 9)
let player2 = Player(name: "name2", number: 9)
print(player1.number)
player1.changeNumber(new: 10)
print(player1.number)
