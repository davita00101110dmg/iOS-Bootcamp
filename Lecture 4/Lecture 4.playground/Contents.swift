var array = [1, 2, 3, -100, -10, 5]

//let sumOfPositives = array.reduce(0) { partialResult, currentNumber in
//    currentNumber >= 0 ? partialResult + currentNumber : partialResult
//}
//
//print(sumOfPositives)

//let negativeNumbers = array.filter { $0 < 0 }
////
////print(negativeNumbers)
//
//array.removeAll { $0.isMultiple(of: 2)}
//
//print(array)

//let monitorByInches = [
//    "sony": 25.0,
//    "samsung": 30.0
//]
//
//let k = monitorByInches.filter { key,value in
//    key == "sony"
//}
//
//print(k)

//let a = array.contains { number in
//    number.isMultiple(of: 7)
//}
//
//print(a)

array.forEach { number in
    print(number)
}
