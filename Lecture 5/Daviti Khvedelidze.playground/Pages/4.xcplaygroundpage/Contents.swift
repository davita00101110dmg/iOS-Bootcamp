// 4. იპოვეთ ის მანქანა, რომლიც ერთი მთლიანად სავზე ავზით ყველაზე მეტი მანძილის გავლას შეძლებს

// The formula is: capacity divided by required amount to cover 100KM and then multiplying that number on 100 which gives us the number which car can travel with 1 tank

let carsDistanceWithOneTank = arrayOfCars.map { car in
    (color: car.color, brand: car.brand.rawValue, distance: (car.fuelExpenses.capacity / car.fuelExpenses.consumption) * 100)
}.sorted { $0.distance > $1.distance}


if let carWithLongestDistance = carsDistanceWithOneTank.first {
    print("Car that can travel the longest distance with a single tank is \(carWithLongestDistance.color) \(carWithLongestDistance.brand) and it can travel \(carWithLongestDistance.distance)KM")

}
