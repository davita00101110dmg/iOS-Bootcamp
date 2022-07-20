import UIKit

//func someInfoAboutMe(profession: String, age: Int) {
//    print("მე მსურს \(age) წლის შემდეგ გავხდე \(profession) დეველოპერი")
//}
//
//someInfoAboutMe(profession: "Angular", age: 10)


//func someInfoAboutMe(profession: String, age: Int) -> String {
//    return "მე მსურს \(age) წლის შემდეგ გავხდე \(profession) დეველოპერი"
//}
//
//let k = someInfoAboutMe(profession: "Angular", age: 10)
//print(k)

//func textForProcess(text: String) -> (uppercased: String, lowercased: String) {
//    return (text.uppercased(), text.lowercased())
//}
//
//let l = textForProcess(text: "aBasdasBBUBU")
//print(l)
//print(l.uppercased)
//print(l.lowercased)

//func printAllOddElements(numbers: [Int]) {
//    for index in 0..<numbers.count {
//        if index % 2 == 1 {
//            print(numbers[index])
//        }
//    }
//}
//
//let nums = [1, 3, 34, 50]
//printAllOddElements(numbers: nums)


//func printAvarageOfArray (numbers: [Double]) {
//    var sum = 0.0
//    for number in numbers {
//        sum += number
//    }
//    print(sum / Double(numbers.count))
//}
//
//printAvarageOfArray(numbers: [1.0, 2.0, 3.0])

//func printMyFavoriteNumber(number: Int = 8) {
//    print("My favorite number is \(number)")
//}
//
//printMyFavoriteNumber()

//func printMyName(name text: String) {
//    print("ჩემი სახელია \(text)")
//}
//
//printMyName(name: "დათო")

//var number1 = 10
//var number2 = 20
//
//func swapNumbers (num1: inout Int, num2: inout Int) {
//    let tempNumber = num1
//    num1 = num2
//    num2 = tempNumber
//}
//
//swapNumbers(num1: &number1, num2: &number2)
//print("Num1 = \(number1), Num2 = \(number2)")

// eseni ertad
//func isFirstGreaterThanLast(array: [Int]) -> Bool {
//    if array.count > 1 {
//        return array[0] > array[array.count - 1]
//    } else {
//        return false
//    }
//}
//
//func hasArrayMoreThanFiveElements(array: [Int]) -> Bool {
//    return array.count > 5
//}
//
//func mainFuncFor(array: [Int], function: ([Int]) -> Bool) -> Bool {
//    return function(array)
//}
//
//print(mainFuncFor(array: [1, 2, 3, 4, 5, 6], function: hasArrayMoreThanFiveElements))

//func    getMyName() -> String {
//    func printSomeText() {
//        print("mwvane")
//    }
//    printSomeText()
//    return "George"
//}
//
//let k = getMyName()
//print(k)
