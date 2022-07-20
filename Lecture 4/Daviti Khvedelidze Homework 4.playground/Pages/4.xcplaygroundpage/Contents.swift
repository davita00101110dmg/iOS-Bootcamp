import Foundation

/*
 დააგენერირეთ ანბანის მასივის შემთხვევითი წევრებისგან 30 წევრიანი მასივი სადაც არ იქნება შემდეგი ასოები: - D, E, და Q და დააბრუნეთ true თუ მასივი შეიცავს C-ს.
 */

var alphabetArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var randomLetters = (0...30).map { _ in alphabetArray[Int.random(in: 0..<alphabetArray.count)]
}

let ifContainsC = randomLetters.filter { $0 != "D" && $0 != "E" && $0 != "Q"}.contains { $0 == "C" }

print("Random 30 letters \(randomLetters)")
print("It is - \(ifContainsC) that this array contains letter 'C'")
