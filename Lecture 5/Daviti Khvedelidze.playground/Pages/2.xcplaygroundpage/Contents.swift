// 2. დააჯგუფეთ მანქანები ბრენდების მიხედვით

// First way
let mercedeses = arrayOfCars.filter { $0.brand == Brand.mercedes }
let bmws = arrayOfCars.filter { $0.brand == Brand.bmw }
let bentleys = arrayOfCars.filter { $0.brand == Brand.bentley }
let teslas = arrayOfCars.filter { $0.brand == Brand.tesla }
let audis = arrayOfCars.filter { $0.brand == Brand.audi }

print("We have\(mercedeses.count) mercedeses,\(bmws.count) bmws \(bentleys.count) bentleys \(teslas.count) teslas and \(audis.count) audis.")

// Second way
var groupedByBrands: [String: Int] = [:]

arrayOfCars.forEach { car in
    groupedByBrands[car.brand.rawValue] = (groupedByBrands[car.brand.rawValue] ?? 0) + 1
}

groupedByBrands.forEach { (brand, frequency) in
    print("We have \(frequency) \(brand)s")
}
