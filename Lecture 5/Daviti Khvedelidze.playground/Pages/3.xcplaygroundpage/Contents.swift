// 3. დაალაგეთ მანქანები კარების რაოდენობის მიხედვით

let sortedByDoors = arrayOfCars.sorted { $0.numberOfDoors < $1.numberOfDoors }

if let theLeastDoorsCar = sortedByDoors.first {
    print("Sorted array by number of doors, and of course the first \(theLeastDoorsCar.color) \(theLeastDoorsCar.brand) has \(theLeastDoorsCar.numberOfDoors) doors")
}
