import Foundation

/*
 მოცემულია მასივი let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]. დააგენერირეთ 5 წევრიანი მასივი 1-დან 30-ის ჩათვლით. შექმენით სტრინგების ორ განზომილებიანი მასივი სადაც თითოეული ქვემასივი შეიცავს იმ რაოდენობის ინგლისური ანბანის ასოს რა მნიშვნელობაც ექნება დაგენერირებული მასივის ელემენტებს. ასევე დაგენერირებული მასივის წევრის მნიშვნელობა უნდა შეესაბამებოდეს ქვემასივში დამატებული ელემენტის პოზიციას ანბანში. მაგ. 2 - ის შემთხვევაში ქვემასივი უნდა შეიცავდეს 2 ცალ "B"-ს. იმ შემთხვევაში თუ დაგენერირებული რიცხვი ცდება ანბანის რაოდენობას დაამატეთ შემთხვევითი სიმბოლო ანბანიდან იგივე პრინციპით.
 */

var alphabetArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

var randomNumbers = (0..<5).map { _ in Int.random(in: 1...30)}

if randomNumbers.contains(where: { $0 > 26 }) == true {
    randomNumbers.removeAll()
    for _ in 0..<5 {
        randomNumbers.append(Int.random(in: 1...alphabetArray.count))
    }
}

var finalArray:[[String]] = []
var i = 0
for number in randomNumbers {
    finalArray.append([])
    print("\(number) - \(alphabetArray[number - 1])")
    for _ in 0..<number {
        finalArray[i].append(alphabetArray[number - 1])
    }
    i += 1
}

print(finalArray)

/*
 პირველ ამოცანაში მიღებული ორგანზომილებიანი მასივისგან შექმენით ანბანის მიხედვით სორტირებული სტრინგი სადაც ყველა სიმბოლო იქნება უნიკალური.
 */

let finalString = Set(finalArray.flatMap { $0 }).sorted().joined(separator: "")

print("Final string is - \(finalString)")
