import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }

enum Corner: String, CaseIterable {
case left
case right
case top
case bottom
case topLeft
case topRight
case bottomLeft
case bottomRight
case middle
}

var corners = (1...10).compactMap { _ in Corner.allCases.randomElement() }

// 1
//let stringValues = corners.map { $0.rawValue }
//print(stringValues)

// 2 დაუმთავრებელი
//stringValues.forEach { element in
//    if element != "top" && element != "middle" && element != "bottom" {
//        print("არის სხვა ელემენტიც")
//    }
//}

// 3
//let stringValuesLowercased = corners.map{ $0.rawValue.lowercased() }
//var leftsCounter = 0
//stringValuesLowercased.forEach { element in
//    if element.contains("left") {
//        leftsCounter += 1
//    }
//}

//print(leftsCounter >= 2)

// 4
//let uniqueItems = Set(corners.map { $0.rawValue })
//print(uniqueItems.count)

// 5 half half dasaweri
//var firstHalf: [String]
//var secondHalf: [String]
//
//stringValues.forEach { element in
//    firstHalf.append(element)
//
//}

// 6
//let onlyBottomRights = stringValues.filter { $0 == "bottomRight" }

//print(onlyBottomRights)

// 8 დაუმთავრებელი
//for element in stringValues {
////    if element == "bottomRight" {
////        continue
////    }
//    while element == "bottomRight" {
//        continue
//    }
//    print(element)
//}

// 9
//var indexesOfBottoms: [Int] = []
//var index = 0
//stringValues.forEach { element in
//    if element == "bottom" {
//        indexesOfBottoms.append(index)
//    }
//    index += 1
//}
//indexesOfBottoms.count > 0 ? print(indexesOfBottoms) : print("No bottom element in array")
