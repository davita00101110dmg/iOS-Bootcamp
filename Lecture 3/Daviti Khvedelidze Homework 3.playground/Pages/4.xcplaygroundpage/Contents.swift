import Foundation

let unionClosurePrinter = {(arr1: [Int], arr2: [Int]) in
    print(Set(arr1).union(Set(arr2)))
}

func unionOfTwoArrays(arr1: [Int], arr2: [Int], closure: ([Int], [Int]) -> ()) {
    closure(arr1, arr2)
}

let firstArray = [1, 2, 3, 10]
let secondArray = [2, 3, 4, 10]

unionOfTwoArrays(arr1: firstArray, arr2: secondArray, closure: unionClosurePrinter)
