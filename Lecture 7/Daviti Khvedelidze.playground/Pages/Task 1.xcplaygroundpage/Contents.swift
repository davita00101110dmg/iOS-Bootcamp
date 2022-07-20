import Foundation

extension String {
    func vowelsCounter() -> Int {
        let vowelsArray = ["a", "e", "i", "o", "u"]
        let vowelsAmount = self.filter { char in
            vowelsArray.contains(String(char).lowercased())
        }.count
        return vowelsAmount
    }
    
    func consonantsCounter() -> Int {
        let vowelsArray = ["a", "e", "i", "o", "u"]
        let consonantsAmount = self.filter { char in
            !vowelsArray.contains(String(char).lowercased())
        }.count
        return consonantsAmount
    }
    
    func reversedString() -> String {
        String(self.reversed())
    }
    
    func isUppercasedMore() -> Bool {
        var uppercasedChar = 0, lowercasedChar = 0

        self.forEach { char in
            uppercasedChar += String(char) == char.uppercased() ? 1 : 0
            lowercasedChar += String(char) == char.lowercased() ? 1 : 0
        }
        return uppercasedChar > lowercasedChar
    }
}

var text = "AEIOUaeiouB"

print(text.vowelsCounter())
print(text.consonantsCounter())
print(text.reversedString())
print(text.isUppercasedMore())
