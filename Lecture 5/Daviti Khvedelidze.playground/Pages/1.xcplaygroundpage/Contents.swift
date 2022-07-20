// 1. იპოვეთ მანქანა, რომელიც ყველაზე ცოტას წვავს

let sortedByExpense = arrayOfCars.sorted { $0.fuelExpenses.consumption < $1.fuelExpenses.consumption }

if let economicalCar = sortedByExpense.first {
    print("The most economic car is \(economicalCar.color) \(economicalCar.brand) and it needs only \(economicalCar.fuelExpenses.consumption)L of gasoline on 100KM")
}
