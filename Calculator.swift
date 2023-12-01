//
//  main.swift
//  Calculator
//
//  This program acts as a simple calculator,
//  allowing the user to add, multiply, divide,
//  or take the modulus of any two numbers.
//
//  Created by Ben Gaskill  on 10/15/22.
//

import Foundation

func printMenu(){
    print("a for Addition")
    print("s for Subtraction")
    print("m for Multiplication")
    print("d for Division")
    print("% for Modulus")
}

func add(a: Double, b: Double) -> Double? {
    return a + b
}

func subtract(a: Double, b: Double) -> Double? {
    return a - b
}

func multiply(a: Double, b: Double) -> Double? {
    return a * b
}

func divide(num: Double, denom: Double) -> Double? {
    return num/denom
}

func modulus(a: Double, b: Double) -> Double?{
    /* Checks that the original value is not
       the same as the rounded version, aka
       checking that a whole number is present*/
    guard a == round(a)  else{
        return nil
    }
    
    guard b == round(b) else{
        return nil
    }
    return Double(Int(a) % Int(b))
}

var calculate: (Double, Double) -> Double?
var menuInput = ""

print("Please choose from the following options. Type quit when you are done:")

while menuInput != "quit" {
    printMenu()
    menuInput = readLine()!
    
    switch menuInput{
    case "a":
        calculate = add
        print("You have selected ADD")
    case "s":
        calculate = subtract
        print("You have selected SUBTRACT")
    case "m":
        calculate = multiply
        print("You have selected MULTIPLY")
    case "d":
        calculate = divide
        print("You have selected DIVIDE")
    case "%":
        calculate = modulus
        print("You have selected MODULUS")
    default:
        print("Unrecognized choice")
        continue
    }
    
    print("Please enter the first number:")
    let first = readLine()
    
    print("Please enter the second number:")
    let second = readLine()
    
    let doubleFirst = Double(first!)
    let doubleSecond = Double(second!)

    
    // Ensures that both entries can be converted into doubles
    guard let first = doubleFirst else{
        print("The entry cannot be made into a double")
        continue
    }
    
    guard let second = doubleSecond else{
        print("The entry cannot be made into a double")
        continue
    }
    
    print("The result is:", calculate(doubleFirst!, doubleSecond!) ?? "Invalid Operation")
    continue
}
