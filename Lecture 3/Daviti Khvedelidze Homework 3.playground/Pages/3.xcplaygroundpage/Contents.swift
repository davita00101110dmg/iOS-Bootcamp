import Foundation

func isPalindrome(array: [String]) -> Int {
    var totalPalindromes = 0
    for word in array {
        if word.lowercased() == String(word.reversed()).lowercased() {
            totalPalindromes += 1
        }
    }
    return totalPalindromes
}

let arrayOfStrings = ["ABA", "AKKA", "0101", "00100", "Aba"]

print(isPalindrome(array: arrayOfStrings))
