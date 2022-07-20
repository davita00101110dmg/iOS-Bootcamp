// 6. იპოვეთ ის ბრენდი, რომელსაც საშუალო საწვავის ხარჯი ყველაზე ცოტა აქვს

// Using constants we used in excercise N2 where we needed to group cars by brands.
let mercedeses = arrayOfCars.filter { $0.brand == Brand.mercedes }
let bmws = arrayOfCars.filter { $0.brand == Brand.bmw }
let bentleys = arrayOfCars.filter { $0.brand == Brand.bentley }
let teslas = arrayOfCars.filter { $0.brand == Brand.tesla }
let audis = arrayOfCars.filter { $0.brand == Brand.audi }

/*
 With map function leaving only expense of the cars, suming up with reduce function and finally
 dividing by quantity.
 Using ternery operator to avoid Division by Zero
 */

let mercedesesAvarageExpense = mercedeses.map{ $0.fuelExpenses.consumption }.reduce(0) { x, y in
    x + y
} / (mercedeses.count > 0 ? mercedeses.count : 1)

let bmwAvarageExpense = bmws.map{ $0.fuelExpenses.consumption }.reduce(0) { x, y in
    x + y
} / (bmws.count > 0 ? bmws.count : 1)

let bentleysAvarageExpense = bentleys.map{ $0.fuelExpenses.consumption }.reduce(0) { x, y in
    x + y
} / (bentleys.count > 0 ? bentleys.count : 1)

let teslasAvarageExpense = teslas.map{ $0.fuelExpenses.consumption }.reduce(0) { x, y in
    x + y
} / (teslas.count > 0 ? teslas.count : 1)

let audisAvarageExpense = audis.map{ $0.fuelExpenses.consumption }.reduce(0) { x, y in
    x + y
} / (audis.count > 0 ? audis.count : 1)

// Creating dictionary with Brand name and total expense values
let brandAndExpense:[String: Int] = ["Mercedes": mercedesesAvarageExpense,
                       "Bmw": bmwAvarageExpense,
                       "Bentley": bentleysAvarageExpense,
                       "Tesla": teslasAvarageExpense,
                       "Audi": audisAvarageExpense]

// Sorting by expenses and making sure 0 is not there so the first value will be the least expense
let sortedAvarageExpense = brandAndExpense.sorted {$0.value < $1.value }.filter { $0.value > 0 }

// Creating an array of answers in case we have multiple
var theLeastExpense:[String] = []

sortedAvarageExpense.forEach { brand, expense in
    if expense == sortedAvarageExpense[0].value {
        theLeastExpense.append("The least expense has \(brand) and it is \(expense)L")
    }
}

// Printing differently if we have more than one answers
theLeastExpense.count > 1 ? print("We have multiple choice!", theLeastExpense.joined(separator: " also ")) : print(theLeastExpense.joined())
