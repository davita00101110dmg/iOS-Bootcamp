// Creating arrays of colors and brands to be able to use them for randomizing
public let colorsOfCars = ["green", "red", "blue", "black", "yellow", "white"]
public let brandsOfCars: [Brand] = Brand.allCases

// Creating an array of 15 Car objects with all random properties
public let arrayOfCars = (0..<15).map { _ in
    Car(brand: brandsOfCars.randomElement()!, color: colorsOfCars.randomElement()!, numberOfDoors: Int.random(in: 2...4), fuelExpenses: FuelExpenses(capacity: Int.random(in: 40...80), consumption: Int.random(in: 8...20)))
}
