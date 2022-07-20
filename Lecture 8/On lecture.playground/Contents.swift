import UIKit
import PlaygroundSupport
defer { PlaygroundPage.current.finishExecution() }
//
//// Inheritance
//
class Animal {
    let isDomestic: Bool

    init(isDomestic: Bool) {
        self.isDomestic = isDomestic
    }

    func makeNoise() {
        print("wooof i am \(Self.self)")
    }

    convenience init() {
        self.init(isDomestic: false)
    }
}

let wolf = Animal(isDomestic: false)
let lion = Animal()
//wolf.makeNoise()

class Cat: Animal {
    var hairLength: Double
    var hasLongHair: Bool { hairLength > 10 }

    init(hairLength: Double) {
        self.hairLength = hairLength
        super.init(isDomestic: true)
    }

    convenience init() {
        self.init(hairLength: 11)
    }

    override func makeNoise() {
        print("miaw i am \(Self.self)")
    }
}


let cat1 = Cat()
//cat1.makeNoise()


class Dog: Animal {
    var isOld: Bool

    init(isOld: Bool) {
        self.isOld = isOld
        super.init(isDomestic: true)
    }

    override func makeNoise() {
        print("waf i am \(Self.self)")
    }
}

let dog1 = Dog(isOld: false)
//dog1.makeNoise()

//
//class HunterDog: Dog {
//    enum HuntingLevel {
//        case beginner, medium, advanced
//    }
//
//    var huntingLevel: HuntingLevel
//
//    init(huntingLevel: HuntingLevel) {
//        self.huntingLevel = huntingLevel
//        super.init(isOld: false)
//    }
//
//    override func makeNoise() {
//        print("voice of \(Self.self)")
//    }
//}
//
//let hunterdog1 = HunterDog(huntingLevel: .advanced)
////hunterdog1.makeNoise()
//
//
//let allAnimal = [
//    cat1,
//    dog1,
//    hunterdog1
//]
//
//allAnimal.forEach { animal in
//    if let cat = animal as? Cat{
//        print(cat.hasLongHair)
//    }
//}
//

protocol Flyable {
    var currentSpeed: Double { get set }
    var maxSpeed: Double { get set }
    var isSpiritual: Bool { get set }
    
    func increaseSpeed()
    init(currentSpeed: Double)
}

class Bird: Flyable {
    required init(currentSpeed: Double) {
        self.currentSpeed = currentSpeed
    }
    
    var currentSpeed: Double = 0.0
    
    var maxSpeed: Double
    
    var isSpiritual: Bool
    
    func increaseSpeed() {
        if currentSpeed < maxSpeed - 2 {
            currentSpeed += 2.0
        }
    }
    
    var name: String
    
    init(name: String, currentSpeed: Double, maxSpeed: Double, isSpiritual: Bool) {
        self.name = name
        self.currentSpeed = currentSpeed
        self.maxSpeed = maxSpeed
        self.isSpiritual = isSpiritual
    }
}


let bird1 = Bird(name: "bird1", currentSpeed: 10.0, maxSpeed: 30, isSpiritual: true)
bird1.currentSpeed
bird1.increaseSpeed()
bird1.currentSpeed

