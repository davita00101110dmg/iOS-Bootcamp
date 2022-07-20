import Foundation

//func differentNumbers(array: [Int]) -> Int {
//    var totalOfDifferentNumbers = 0
//    var storage: [Int: Int] = [:]
//    for number in array {
//        storage[number] = (storage[number] ?? 0) + 1
//    }
//    for _ in storage.keys {
//        totalOfDifferentNumbers += 1
//    }
//    return totalOfDifferentNumbers
//}

func differentNumbers(array: [Int]) -> Int {
    return Array(Set(array)).count
}
    
let arrayOfNumbers = [1, 2, 2, 3, 3, 3, 10, 100]

print(differentNumbers(array: arrayOfNumbers))
