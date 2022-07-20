/*:
 [👈 Optionals](@previous)                [introduction](introduction)                [](@next)
 ## Statements
 */

import Foundation
/*:
 * Important:
    * Loop statements
       - for in
       - while
       - repeat while
    * Conditional statements
       - if
       - if let
       - guard
       - switch
 ---
 */

/*:
 ## Loop statements
 */
/*:
 for Loop
 */

result(for: "დაბეჭდეთ რიცხვები 1 დან 20 მდე") {
 
    
    for number in 1..<20 {
        print(number, terminator: " ")
    }
    print("🟢")
}

//
result(for: "დაბეჭდეთ ყველა ლუწი რიცხვი მოთავსებული -20 დან 22 მდე") {
    for number in -20..<23 {
        if number % 2 == 0 {
            print(number, terminator: " ")
        }
    }
}
//

result(for: "დაბეჭდე რიცხვები 10 დან 1 მდე") {
    for number in stride(from: 10, through: 1, by: -1) {
        print(number)
    }
}



/*:
 while Loop
 */
//
result(for: "შექმენი მთელი რიცხვის აღმნიშვნელი ცვლადი და გაზარდე ბიჯით 2 სანამ არ გახდება 20 ზე მეტი.") {
    var number = 2
    
    while number < 20 {
        number += 2
        print(number, terminator: " ")
    }
}

/*:
 repeat while
 */
//
result(for: "აღნიშნეთ ცვლადი int ტიპის და მანამ დააკელით 10 სანამ არ ჩამოცხდება 15") {
    var k = 90
    repeat {
        k -= 15
    } while k > 10
}
print("A">"a")

/*:
 ## Conditional statements
 */
/*:
 if
 */
//აიღეთ ორი რიცხვი და შეამოწმეთ ამ ორ რიცხვს შორის მოთავსებულ მთელ რიცხვთა ჯამი იყოფა თუ არა 3 ზე

result(for: "აიღეთ ორი რიცხვი და შეამოწმეთ ამ ორ რიცხვს შორის მოთავსებულ მთელ რიცხვთა ჯამი იყოფა თუ არა 3 ზე") {
    var num = 34
    var num2 = 39
    var sum = 0
    
    for number in num...num2 {
        sum += number
    }
    print(sum)
    print(sum % 3 == 0)
    
}

/*:
 if let
 */
//88 გამოვიყენოთ როგორც რიცხვი

/*:
 guard
 */
//იგივე პირობა შეამოწმეთ guard - ით

/*:
 switch
 */

//: [👈 Optionals](@previous)



