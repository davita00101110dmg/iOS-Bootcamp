////import UIKit
////import Darwin
////
//class Car {
//    let manufacturer: String
//    var model: String = "z3"
//    var price: Int
//
//    init(manufacturer: String, model: String, price: Int) {
//        self.manufacturer = manufacturer
//        self.model = model
//        self.price = price
//    }
//
//    convenience init (manufacturer: String, model: String) {
//        self.init(manufacturer: manufacturer, model: model, price: 200)
//    }
//
//    func addPrice(amount: Int) {
//        price += amount
//    }
//}
//
//let firstCar = Car(manufacturer: "BMW", model: "z4", price: 200)
//
//print(firstCar.price)
//firstCar.addPrice(amount: 100)
//print(firstCar.price)
//
////class Person {
////    let name:String
////    var age:Int
////
////    init?(name:String, age:Int) {
////        self.name = name
////        if age > 17 {
////            self.age = age
////        } else {
////            return nil
////        }
////    }
////}
////
////let youngerPerson = Person(name: "name1", age: 15)
////print(youngerPerson?.age)
//
//class CheapCar {
//    var price:Int
//
//    init(price:Int) {
//        self.price = price
//    }
//}
//
//var allCars = [
//    Car(manufacturer: "name1", model: "model1", price: 100),
//    Car(manufacturer: "name2", model: "model2", price: 200),
//    Car(manufacturer: "name3", model: "model3", price: 500),
//    Car(manufacturer: "name4", model: "model4", price: 1000)
//]
//
//let cheapCars = allCars.compactMap { car -> CheapCar? in
//    if car.price < 800 {
//        return CheapCar(price: car.price)
//    } else {
//        return nil
//    }
//}
//
//cheapCars.count

enum FuelType: Int {
    case petrol
    case diesel
    case electro
    case hybrid
}

enum Country: String {
    case geo = "Georgia"
    case us = "USA"
    case deu = "Germany"
}

class Car {
    let manufacturer: String
    var model: String = "z3"
    var price: Int
    var fuel: FuelType
    
    init(manufacturer: String, model: String, price: Int, fuel: FuelType) {
        self.manufacturer = manufacturer
        self.model = model
        self.price = price
        self.fuel = fuel
    }
    
    convenience init(manufacturer: String, model: String) {
        self.init(manufacturer: manufacturer, model: model, price: 200, fuel: .diesel)
    }
    
    func addPrice(amount: Int) {
        price += amount
    }
    
}

//var allCars = [
//Car(manufacturer: "name1", model: "model1", price: 100),
//Car(manufacturer: "name2", model: "model2", price: 1000),
//Car(manufacturer: "name3", model: "model3", price: 200),
//Car(manufacturer: "name4", model: "33", price: 500),
//Car(manufacturer: "name3", model: "3434", price: 200),
//Car(manufacturer: "name4", model: "34", price: 500)
//]
//
//// ახალი კლასი 3 იანი რომელშიც იქნება შესული ეგეთი მასივი
//
//let carContains3 = allCars.filter { $0.model.contains("3") }
//
//for car in carContains3 {
//    print(car.model)
//}

let fuelTypeForNewCar = FuelType.petrol

let newCar = Car(manufacturer: "man1", model: "mod1", price: 100, fuel: .electro)

print(newCar.fuel.rawValue)

switch newCar.fuel {
case .petrol:
    print("მანქანის საწვავის ტიპი არის - petrol")
case .diesel:
    print("მანქანის საწვავის ტიპი არის - diesel")
case .electro:
    print("მანქანის საწვავის ტიპი არის - electro")
default:
    print("სხვა")
}
