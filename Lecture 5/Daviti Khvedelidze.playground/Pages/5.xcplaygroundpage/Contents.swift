// 5. ყველაზე მეტი რომელი ფერის მანქანა არის მასივში

// Creating an array with only colors
let colorsArray = arrayOfCars.map { $0.color }

// Creating dictionary for pairing colors and their frequency
var colorsFrequency: [String: Int] = [:]

colorsArray.forEach { color in
    colorsFrequency[color] = (colorsFrequency[color] ?? 0) + 1
}

// Creating an array of answers in case we have multiple
var theMostFrequentColor:[String] = []

colorsFrequency.forEach { (brand, frequency) in
    if frequency == colorsFrequency.values.max() {
        theMostFrequentColor.append("The most frequent color - \(brand) frequency \(frequency)")
    }
}

// Printing differently if we have more than one answers
theMostFrequentColor.count > 1 ? print("We have multiple choice!", theMostFrequentColor.joined(separator: " also ")) : print(theMostFrequentColor.joined())
