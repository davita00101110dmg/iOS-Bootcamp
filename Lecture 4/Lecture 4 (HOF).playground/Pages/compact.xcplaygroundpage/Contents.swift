/*:
 ## compact map
 */
//შექმენით მასივი მხოლოდ nonOptional ელემენტებისგან
let arrayOfNumers = ["1","2","10_000","five","-1x"]

let newArray = arrayOfNumers.compactMap { Int($0) }
newArray

//:  [👈 map](@previous)

