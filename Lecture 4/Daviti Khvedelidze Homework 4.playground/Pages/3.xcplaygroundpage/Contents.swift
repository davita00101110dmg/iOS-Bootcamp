import Foundation

/* დააგენერირეთ წილადი რიცხვების 30 წევრიანი მასივი 20 დან 50 ის ჩათვლით. დაამრგვალეთ მასივის თითოეული წევრი და დატოვეთ მხოლოდ ლუწი რიცხვები.
 */

var numArray = (0..<30).map { _ in Double.random(in: 20.0...50.0) }

let roundedAndEvenNumbers = numArray.map { Int(round($0)) }.filter { $0.isMultiple(of: 2) }

print("Array: \(roundedAndEvenNumbers)")
print("Rounded and even array: \(roundedAndEvenNumbers)")
