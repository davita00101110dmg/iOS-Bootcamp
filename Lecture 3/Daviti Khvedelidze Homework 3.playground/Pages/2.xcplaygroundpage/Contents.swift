import Foundation

// ჩემი
//func intersectionOfArrays(arr1: [Int], arr2: [Int]) -> Set<Int> {
//    let intersection = Set(arr1).intersection(Set(arr2))
//    return intersection
//}

func intersectionOfArrays(arr1: [Int], arr2: [Int]) -> [Int] {
    return Array(Set(arr1).intersection(Set(arr2)))
}

let firstArray = [1, 2, 3, 10]
let secondArray = [2, 3, 4, 10]

print(intersectionOfArrays(arr1: firstArray, arr2: secondArray))
