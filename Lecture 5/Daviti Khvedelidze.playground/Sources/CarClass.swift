public class Car {
    public let brand: Brand
    public let color: String
    public let numberOfDoors: Int
    public let fuelExpenses: FuelExpenses
    
    public init(brand: Brand, color: String, numberOfDoors: Int, fuelExpenses: FuelExpenses) {
        self.brand = brand
        self.color = color
        self.numberOfDoors = numberOfDoors
        self.fuelExpenses = fuelExpenses
    }
}
