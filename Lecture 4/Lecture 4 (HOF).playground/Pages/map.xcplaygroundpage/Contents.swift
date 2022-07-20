import UIKit

/*:
 Higher Order Functions
 */

/*:
 * Important:
   * map
   * compactMap
   * flatMap
   * reduce
   * filter
   * removeAll
   * contains
   * foreach
   * sorted
 ---
 */

/*:
 🟢 Map arrays
 */


//მოცემული დავალება შეასრულეთ map ფუნქციის გამოყენებით
let mixedStrings = ["text1","text2","text3","text4","text5"]
var uppercasedStrings: [String] = []

for text in mixedStrings {
    uppercasedStrings.append(text.uppercased())
}
uppercasedStrings

let uppercasedUsingMap = mixedStrings.map { $0.uppercased() }

//🌕 iterates +1

//მოცემული მასივისგან მიიღეთ მასივი რომელშიც იქნება 3 ელემენტი და ეს ელემენტი იქნება სახელები და გვარები გაერთიანებული.
var persons = [["name1","surname1"],["name2","surname2"],["name3","surname3"]]
//var persons = [[1,1],[2,3],[4,5]]

let joinedNamesAndSurnames = persons.map {
    $0[0] + " " + $0[1]
}
joinedNamesAndSurnames

//მოცემული მასივიდან დააბრუნეთ ისევ ორი მასივი რომელშიც მხოლოდ ის ცხოველები იქნებიან რომელთა ტიპშიც შედის ასო "a"
let animals = [
    ["dog","cat","cow"],
    ["tiger","lion","gepard","cangaroo"]
]

/*: [flat 👉](@next)
 */

// მოცემული მასივიდან შექმენით ინტეჯერების მასივი
let arrayOfNumers = ["1","2","10_000","five","-1x"]


/*: [compact 👉](@next)
 */

//შექმენით მხოლოდ სახელების მასივი
let basketballPlayers = [
    (name: "Bryant",number:24),
    (name: "Jordan",number:23),
    (name: "Durant",number:35),
    (name: "lebron",number:23)
]
/*:
 🟢 Map dictionary
 */

/*
 შექმენით ახალი dictionary სადაც მნიშვნელობები შევსებული იქნება სანტიმეტრებში.
 FYI - 1 inch = 2.54 cm
 */
let monitorsByInches = [
    "sony" : 25,
    "samsuns" : 30,
    "siemens" : 28,
    "viewsonic" : 25
]


/*:
 🟢 Map sets
 */
/*:
 > Set ზე map ფუნქციის გამოყენება აბრუნებს მასივს.
 */

let lowercasedSet = Set(["a","b","c","d"])

let upper = lowercasedSet.map { $0.uppercased() }

