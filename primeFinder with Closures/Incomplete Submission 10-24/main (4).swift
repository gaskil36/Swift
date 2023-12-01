//
//  main.swift
//  primeFinder
//
//  Created by Benjamin Gaskill
//  References primeFinder by Jacob Levy
//

import Foundation
var current = -1;
var count = 0
var numPrimes = 0
var nonPrimes = 0
var smallest: Int?
var largest: Int?
var prime: Bool
var entry: String? = ""

func readNumbers(using label: String , for process: (Int) -> Bool) {

 entry = readLine()
    if entry == nil {
        print("Invalid entry")
    }
    
    prime = true

    guard let convert = Double(entry!), convert == floor(convert) else {
        print("\(entry) is Not Prime!")
    }

if (count>0){
   print("The total entries: \(count)");
   print("The total number of Prime numbers entered: \(numPrimes)");
   print("The total number of Non-Prime numbers entered: \(nonPrimes)");
   if (numPrimes > 0){
     print("The largest Prime Number:  \(largest!)");
     print("The smallest Prime Number: \(smallest!)");
   }
 } else{
   print("No numbers entered");
 }
    
}

func isPrime(_num: Int) -> Bool {
    
    let num = Int(convert)
    
    guard num != 0 else{
        break
    }

    switch num{
    case ...1: prime = false
    case 2, 3: prime = true
    case let number where number > 2 :
            for each in 2...Int(sqrt(Double(number))){
                if (number % each) == 0{
                    prime = false
                    break;
                }
        }
    case let number: //makes the switch exhaustive
        print("Unrecognized: \(number)")
    }

    count += 1
    
    if prime{
        print( "\(num) is Prime!")
        numPrimes += 1
        if numPrimes == 1{
            largest = num
            smallest = num
        }
        else{
            if (num > largest!){
                largest = num
            } else if (num < smallest!){
                smallest = num
            }
        }
    } else{
        print( "\(num) is Non-Prime!")
        nonPrimes += 1
    }
    current = num
}

while (current != 0){

   readNumbers(using: "Prime", for: isPrime(num:))
   
   readNumbers(using: "Even") {
       $0%2 == 0
   }
   
   readNumbers(using: "a Multiple of 5") {
       $0%5 == 0
   }
}




         






