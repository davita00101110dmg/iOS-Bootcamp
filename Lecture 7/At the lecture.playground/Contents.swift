import Foundation

//extension String {
//    mutating func removeVowels() {
//        let vowels = ["a", "e", "i", "o", "u"]
//        self = self.filter { char in
//            !vowels.contains(String(char))
//        }
//    }
//
//    func printFullDescription() {
//        print("მნიშვნელობა არის \(self)")
//    }
//}
//
//var name = "name1"
//name.removeVowels()
//name

//extension Array {
//    var middleElement: Element? {
//        if self.count % 2 == 0 {
//            return nil
//        } else {
//            let indexOfMiddleElement = self.count / 2
//            return self[indexOfMiddleElement]
//        }
//    }
//}
//
//var arrayOfIntegers = [1, 2, 3, 4, 5]
//var arrayOfStrings = ["a", "b", "c"]
//
//arrayOfIntegers.middleElement
//arrayOfStrings.middleElement


//extension Double {
//    func turnToString() {
//        String(self)
//    }
//}
//
//var a = 2.2
//a.turnToString()

//extension Dictionary where Key == String, Value == Int {
//    mutating func duplicateValues() {
//        self.map { value, key in
//            self[value] = key * 2
//        }
//    }
//}
//
//var dict = ["as": 2, "asd": 3]
//
//dict.duplicateValues()
//
//var dict1 = [1: 2, 1: 3]


//extension Int {
//    func isIntEven() -> Bool {
//        if self % 2 == 0 {
//            return true
//        } else {
//            return false
//        }
//    }
//}

// Task 1
//extension Int {
//    func isIntPositive() -> Bool {
//        if self > 0 {
//            return true
//        }
//        return false
//    }
//}
//
//var a = 5
//var b = -5
//a.isIntPositive()
//b.isIntPositive()

// Task 2

//extension Int {
//    func isIntPrime() -> Bool {
//        for num in 2..<self {
//            if (self % num) == 0 {
//                return false
//            }
//        }
//        return true
//    }
//}
//
//var a = 4
//a.isIntPrime()

//extension String {
//    func containsDuplicates() -> Bool {
//        var tempList: [Character] = []
//        for char in self {
//            tempList.append(char)
//            if tempList.contains(char) {
//                return true
//            }
//        }
//        return false
//    }
//}
//
//var a = "asda"
//a.containsDuplicates()
