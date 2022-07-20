import Foundation

/*
 მოცემულია tuple-ების მასივი let people = [(name: ვაჟა, age: 22), (name: მურთაზი, age: 12), (name: შუქური, age: 12), (name: დინარა, age:19), (name: ფრიდა, age:88)] სკოლის ასაკი არის 6 - 18 წლამდე. გამოითვალეთ სკოლის მოსწავლეების საშუალო ასაკი.
 */

let people = [(name: "ვაჟა", age: 22),
              (name: "მურთაზი", age: 12),
              (name: "შუქური", age: 12),
              (name: "დინარა", age:19),
              (name: "ფრიდა", age:88)]

let pupilsAge = people.filter { $0.age > 6 && $0.age < 18 }
let pupilsAvarageAge = pupilsAge.reduce(0) { ($0 + $1.age) } / pupilsAge.count

print(pupilsAvarageAge)
