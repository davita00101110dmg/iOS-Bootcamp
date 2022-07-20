import Foundation

// 1 დავალება

// for-in ციკლით

//var startPoint = 100
//var endPoint = 400
//
//for number in startPoint...endPoint {
//    if number % 2 == 0 {
//    print(number, terminator: " ")
//    }
//}

// for-in ციკლით stride - ის მეშვეობით

//for number in stride(from: 100, through: 400, by: 2) {
//    print(number, terminator: " ")
//    }
//

// while ციკლით

//var index = 100
//
//while index <= 400 {
//    if index % 2 == 0 {
//        print(index, terminator: " ")
//    }
//    index += 1
//}

// repeat while ციკლით (ზედა სავარჯიშოში if - იც გამოვიყენე, აქ არა)

//var index = 100
//
//repeat {
//    print(index, terminator: " ")
//    index += 2
//} while index <= 400

// 2 დავალება

//for var number in 10...100 {
//    if number % 10 == 0 && number > 50 {
//        number *= 2
//        print(number, terminator: " ")
//    }
//}

// 3 დავალება

//var numb1 = Int.random(in: 1...100)
//var numb2 = Int.random(in: 1...100)
//
//var total = numb1 + numb2
//
//if total % 2 == 0 || total > 100 {
//    print(total)
//}

// 4 დავალება

//var quote = "Swift"
//var number = 5
//
//print(quote + " " + String(number))

// 5 დავალება

//var array = [nil, 1, 2, 3, nil, 10, 100, nil, nil]
//var secondArray: [Int] = []
//var index = 0
//
//for number in array {
//    if number != nil {
//        secondArray.append(number!)
//    } else {
//        array[index] = 0
//    }
//    index += 1
//}
//
//
//print(array)
//print(secondArray)

// 6 დავალება

//let age = 19
//
//print(age > 18 ? "Adult" : "Kid")

// 7 დავალება

//let age = 19
//
//if 6 < age && age < 18 {
//    print("kid")
//} else if 18 <= age && age <= 65{
//    print("adult")
//} else {
//    print("old")
//}
