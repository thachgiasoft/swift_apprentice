//: Playground - noun: a place where people can play

import UIKit

/*:
 # Chapter 8: Collection Iteration with Closures
 */


var multiplyClosure: (Int, Int) -> Int  // declaration of variable holding a closure

// the parameter list appears inside braces, and there is an 'in' keyword after the return type

multiplyClosure = { (a: Int, b: Int) -> Int in
    return a * b
}

/*:
 ### Shorthand syntax
 */

// You can leave out the return keyword if the closure consists of a single statement.

multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b   // return keyword omitted
}

// Can use type inference to shorten the syntax by removing the type information

multiplyClosure = { (a, b) in
    a * b
}

// can omit the parameter list and refer to each parameter by number, starting at zero.
multiplyClosure = {
    $0 * $1
}

// Since closures are just functions without names, you can pass either a function or a closure into the operation parameter.
func operateOnNumbers(_ a: Int, _ b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    print(result)
    return result
}

let addClosure = { (a: Int, b: Int) in
    a + b
}

operateOnNumbers(4, 2, operation: addClosure)

// Can define the entire thing inline, like this:
operateOnNumbers(5, 3) { (a: Int, b: Int) -> Int in
    return a * b
}

operateOnNumbers(10, 3, operation: { $0 + $1 })

/*:
 ### Trailing closure syntax:
 
 Remove the label and pull the braces outside of the function call parameter list.
 */
operateOnNumbers(4, 2) {
    $0 + $1
}

// Closures introduce a new scope and inherit all entities visible to the scope in which they are defined.

var counter = 0
let incremenetCounter = {
    counter += 1
}
// incrementCounter is able to access the counter variable becuase the closure is defined i
