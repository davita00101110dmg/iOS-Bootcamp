import UIKit
//
//class Rectangle {
//    var width: Double
//    var height: Double
//
//    var perimeter: Double {
//        get {
//            return 2 * (width + height)
//        }
//        set {
//            width = (newValue * 0.5) * (2 / 3)
//            height = (newValue * 0.5) * (1 / 3)
//        }
//    }
//
//    init(width: Double, height: Double) {
//        self.width = width
//        self.height = height
//    }
//}
//
//var obj1 = Rectangle(width: 10, height: 20)
//print(obj1.perimeter)
//
//obj1.width = 20
//obj1.height = 40
//print(obj1.width)
//print(obj1.height)
//print(obj1.perimeter)

class Player {
    var rating: Int = 0 {
        willSet {
            print("ახლანდელი მნიშვნელობა არის \(rating), ახალი მნიშვნელობა იქნება \(newValue)")
        }
        didSet {
//            print("ძველი მნიშვნელობა იყო \(oldValue), ხოლო ახალი მნიშვნელობა არის \(rating)")
        }
    }
    var name: String

    init(name: String) {
        self.name = name
    }

}

let somePlayer = Player(name: "Player 1")
somePlayer.rating = 7
somePlayer.rating = 0
//

//class Car {
//    let manufacturer: String
//    let startPrice: Int
//    var currentPrice: Int
//
//    init(manufacturer: String, currentPrice: Int) {
//        self.manufacturer = manufacturer
//        self.currentPrice = currentPrice
//        self.price = currentPrice
//    }
//
//    func addPrice(by amount: Int) {
//        currentPrice += amount
//    }
//
//    func minusPrice(by amount: Int) {
//        currentPrice -= amount
//    }
//
//    func resetPrice() {
//        currentPrice = startPrice
//    }
//
//    func printCurrentPrice() {
//        print("Current price of \(manufacturer) is \(currentPrice)")
//    }
//}
//
//let newCar = Car(manufacturer: "Mercedes", currentPrice: 20_000)

//class House {
//    struct Place {
//        let street: String
//        let countryName: String
//    }
//
//    var numberOfDoors: Int = 0
//    var place: Place?
//}
//
//class Planet {
//    struct Place {
//        let galaxy: Int
//        var distanceFromEarth: Int
//    }
//
//    var place: Place?
//}


//@propertyWrapper struct Capitalized {
//    var wrappedValue: String {
//        didSet{
//            wrappedValue = wrappedValue.capitalized
//        }
//    }
//
//    init(wrappedValue: String) {
//        self.wrappedValue = wrappedValue.capitalized
//    }
//}
//
//struct Person {
//    @Capitalized var name: String
//    @Capitalized var surName: String
//
//    var age: Int
//}
//
//let pers = Person(name: "pers1", surName: "ksdbvjds", age: 16)
//print(pers.name)
