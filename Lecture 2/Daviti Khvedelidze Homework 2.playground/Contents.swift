import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

// დავალება 1

//var grade = Int.random(in: 1...100)
//
//switch grade {
//case 90...100: print("Grade \(grade) - A")
//case 80...90: print("Grade \(grade) - B")
//case 70...80: print("Grade \(grade) - C")
//case 60...70: print("Grade \(grade) - D")
//case 40...60: print("Grade \(grade) - E")
//case 0...40: print("Grade \(grade) - F")
//default: print("error")
//}

// დავალება 2

//var intArray: [Int?] = []

// Ternery operator - ის გამოყენებით

//for _ in 0..<10 {
//    let randomNumber = Int.random(in: 0...100)
//    intArray.append(randomNumber % 5 == 0 ? nil : randomNumber)
//}
//
//print(intArray)

// Ternery operator - ის გარეშე

//for _ in 0..<10 {
//    let randomNumber = Int.random(in: 0...100)
//    if randomNumber % 5 == 0 {
//        intArray.append(nil)
//    } else {
//        intArray.append(randomNumber)
//    }
//}
//
//print(intArray)

// დავალება 3 (სჭირდება მე - 2 დავალების კომენტარის მოხსნა გასაშვებად)

//var secondArray: [Int] = []
//
//// გზა 1 if-else
//
//for item in intArray {
//    if item != nil {
//        secondArray.append(item!)
//    }
//}
//
//print(secondArray)
//
//// გზა 2 if-let
//
//for item in intArray {
//    if let unwrappedItem = item {
//        secondArray.append(unwrappedItem)
//    }
//}
//
//print(secondArray)
//
//// გზა 3 nil coalesing
//
//for item in intArray {
//    secondArray.append(item ?? 0)
//}
//
//print(secondArray)

// დავალება 4

//let intArray = [1, 7, 12, 15, 7, 13, 5, 7, 9, 12, 23, 7]
//print(intArray)
//var uniqueArray: [Int] = []
//
//for item in intArray {
//    if uniqueArray.contains(item) == false {
//        uniqueArray.append(item)
//    }
//}
//
//print(uniqueArray)
//
//// Set - ის გამოყენებით
//
//var uniqueSet = Set(intArray)
//
//print(uniqueSet)

// დავალება 5

//let names = ["გელა", "ზაირა", "შალვა", "მურადი", "მაყვალა"]
//let grades = [80, 23, 71, 75, 100]
//var dict = [String: Int]()
//var secondIndex = names.count - 1
//
//for index in 0...names.count - 1 {
//    dict[names[index]] = grades[secondIndex]
//    secondIndex -= 1
//}
//
//print(dict)
//
//var maxValue = dict.values.max()!
//
//for (x, y) in dict {
//    if y == dict.values.max()! {
//        print("სახელი რომელსაც ყველაზე დიდი შეფასება აქვს \(x), შეფასება - \(y)")
//    }
//}

// დავალება 6

//var intArray: [Int] = []
//var dict = [Int: Int]()
//for _ in 0..<100 {
//    let number = Int.random(in: 0...10)
//    intArray.append(number)
//    dict[number] = (dict[number] ?? 0) + 1
//}
//print("100 რიცხვისგან შემდგარი Array - \(intArray)")
//print("")
//print("რიცხვების კოლექცია და მათი სიხშირე - \(dict)")
//print("")
//for (x, y) in dict {
//    if y == dict.values.max()! {
//        print("რიცხვი რომელიც ყველაზე მეტჯერ განმეორდა \(x), რაოდენობა - \(y)")
//    }
//}

// დავალება 7

//let num1 = Int.random(in: 1...100)
//let num2 = Int.random(in: 1...100)
//
//var num1_Divisors: [Int] = []
//var num2_Divisors: [Int] = []
//
//var sumOfDivisorsOfNum1 = 0
//var sumOfDivisorsOfNum2 = 0
//
//for i in 1...num1 {
//    if num1 % i == 0 {
//        num1_Divisors.append(i)
//        sumOfDivisorsOfNum1 += i
//    }
//}
//
//for i in 1...num2 {
//    if num2 % i == 0 {
//        num2_Divisors.append(i)
//        sumOfDivisorsOfNum2 += i
//    }
//}
//
//print("პირველი შემთხვევითი რიცხვი \(num1), მისი გამყოფები - \(num1_Divisors), გამყოფების ჯამი - \(sumOfDivisorsOfNum1)")
//print("მეორე შემთხვევითი რიცხვი \(num2), მისი გამყოფები - \(num2_Divisors), გამყოფების ჯამი - \(sumOfDivisorsOfNum2)")
//
//print("Winner - \(sumOfDivisorsOfNum1 > sumOfDivisorsOfNum2 ? num1 : num2)")

// დავალება 8

//var number = Int.random(in: 1..<1000000)
//print("რიცხვი \(number), სიგრძე - \(String(number).count)")
