//: Playground - noun: a place where people can play

import UIKit

/*:
 ## Chapter 4
 */

/*:
 ### Countable Ranges
 */

let closedRange = 0...5  // 0 to 5 inclusive

let halfOpenRange = 0..<5  // 0 to 5, not including 5

// Both open and half-open ranges must always be increasing.

/*:
 ### For loops
 */

/*
 for constant in countable_range {
    do stuff
 }
 */

let count = 10
var sum = 0
for i in 1...count {
    sum += i   // Note that i is only visible in the scope of the for loop.  It is not available outside of the loop.
}

// To ignore the loop constant..

sum = 1
var lastSum = 0

for _ in 0..<count {
    let temp = sum
    sum = sum + lastSum
    lastSum = temp
}

// To only run in certain conditions..

sum = 0
for i in 1...count where i % 2 == 1 {
    sum += i
}

// Labeled statements - you can use labeled statements to break out of a certain loop

sum = 0
rowLoop: for row in 0..<8 {
    columnLoop: for column in 0..<8 {
        if row == column {
            continue rowLoop
        }
    sum += row * column
    }
}

/*:
 ## Mini-exercises

 ### 1. Create a constant named range and set it equal to a range starting at 1 and ending with 10 inclusive. Write a for loop which iterates over this range and prints the square of each number.
 */
let range = 1...10
for n in range {
    print("\(n) squared = \(n*n)")
}

/*:
 ### 2. Write a for loop to iterate over the same range as in the exercise above and print the square root of each number. You’ll need to type convert your loop constant.
 */
for n in range {
    let squareRoot = sqrt(Double(n))
    print("square root of \(n) = \(squareRoot)")
}

/*:
 ### 3. Use a where clause on the for loop to skip even rows
 */
//sum = 0
//for row in 0..<8 {
//    if row % 2 == 0 {
//        continue
//    }
//    for column in 0..<8 {
//        sum += row * column
//    }
//}
sum = 0
for row in 0..<8 where row % 2 != 0 {
    for column in 0..<8 {
        sum += row * column
    }
}
print("sum = \(sum)")

/*:
 ### Switch statements
 */

// Switch statements work with any data type.

let string = "Dog"

switch string {
case "Cat", "Dog":    // executes if value is either Cat or Dog
    print("Animal is a house pet")
default:
    print("Animal is not a house pet")
}

// You can use ranges as cases...
let hourOfDay = 12
let timeOfDay: String
switch hourOfDay {
case 0...5:
    timeOfDay = "Early morning"
case 6...11:
    timeOfDay = "Morning"
case 12...16:
    timeOfDay = "Afternoon"
default:
    timeOfDay = "Invalid!"
}

// Can use pattern matching as cases...
let number = 54
switch number {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}

// Can also use the underscore character to ignore x since it is not needed
switch number {
case _ where number % 2 == 0:
    print("Even")
default:
    print("Odd")
}

// Partial matching..
let coordinates = (x: 3, y: 2, z: 5)

switch coordinates {
case (0, 0, 0):
    print("origin")
case (_, 0, 0):
    print("On the x-axis")
case (0, _, 0):
    print("On the y-axis")
case (0, 0, _):
    print("On the z-axis")
default:
    print("Somewhere in space")
}

// If we cared about the values we ignored...
switch coordinates {
case (0, 0, 0):
    print("origin")
case (let x, 0, 0):
    print("On the x-axis at x = \(x)")
case (0, let y, 0):
    print("On the y-axis at y = \(y)")
case (0, 0, let z):
    print("On the z-axis at z = \(z)")
case let (x, y, z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

/*:
 ## Mini-exercises
 
 ### 1. Write a switch statement that takes an age as an integer and prints out the life stage related to that age. You can make up the life stages, or use my categorization as follows: 0-2 years, Infant; 3-12 years, Child; 13-19 years, Teenager; 20-39, Adult; 40-60, Middle aged; 61+, Elderly.
 */

let age = 64
switch age {
case 0...2:
    print("Infant")
case 3...12:
    print("Child")
case 13...19:
    print("Teenager")
case 20...39:
    print("Adult")
case 40...60:
    print("Middle aged")
default:
    print("Elderly")
}

/*:
 ### 2. Write a switch statement that takes a tuple containing a string and an integer. The string is a name, and the integer is an age. Use the same cases that you used in the previous exercise and let syntax to print out the name followed by the life stage. For example, for myself it would print out "Matt is an adult.".
 */
let person = ("John", 34)
switch person {
case (let name, 0...2):
    print("\(name) is an infant")
case (let name, 3...12):
    print("\(name) is a child")
case (let name, 13...19):
    print("\(name) is a teenage")
case (let name, 20...39):
    print("\(name) is an adult")
case (let name, 40...60):
    print("\(name) is middle aged")
case let (name, age) where age >= 61:
    print("\(name) is elderly")
default:
    print("invalid age")
}

/*:
 ## Challenges
 
 ### 1. In the following for loop, what will be the value of sum, and how many iterations will happen?
     var sum = 0
     for i in 0...5 {
        sum += i
     }
 */
// 0+1+2+3+4+5 = 15 , six iterations.

/*:
 ### 2. In the while loop below, how many instances of “a” will there be in aLotOfAs? Hint: aLotOfAs.count tells you how many characters are in the string aLotOfAs.
    var aLotOfAs = ""
    while aLotOfAs.count < 10 {
        aLotOfAs += "a"
    }
 */

// The loop stops when there are 10 instances of a in aLotOfAs.  So the answer is 10.

/*
 ### 3. Consider the following switch statement:
     switch coordinates {
     case let (x, y, z) where x == y && y == z:
        print("x = y = z")
     case (_, _, 0):
        print("On the x/y plane")
     case (_, 0, _):
        print("On the x/z plane")
     case (0, _, _):
        print("On the y/z plane")
     default:
        print("Nothing special")
     }
 What will this code print when coordinates is each of the following?
 */
let coordinates0 = (1, 5, 0)  // prints "On the x/y plane"
let coordinates1 = (2, 2, 2)  // prints "x = y = z"
let coordinates2 = (3, 0, 1)  // prints "On the x/z plane"
let coordinates3 = (3, 2, 5)  // prints "Nothing special"
let coordinates4 = (0, 2, 4)  // prints "On the y/z plane"

/*:
 ### 4. A closed range can never be empty. Why?
 */

// Ranges must always be increasing.

/*:
 ### 5. Print a countdown from 10 to 0. (Note: do not use the reversed() method, which will be introduced later.)
 */
for i in 0...10 {
    let value = 10-i
    print("\(value)")
}

/*:
 ### 6. Print 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0. (Note: do not use the stride(from:by:to:) function, which will be introduced later.)
 */
for i in 0...10 {
    let value = Double(i)/10.0
    print("\(value)")
}
