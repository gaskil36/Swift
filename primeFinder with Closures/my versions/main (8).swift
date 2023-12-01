//
//  main.swift
//  primeFinder
//
//  Created by Jacob Levy on 8/25/21.
//  Copyright © 2021 Jacob Levy. All rights reserved.
//

import Foundation

// The Global Variables. Can be used anywhere in the program :)
var current = -1;
var count = 0
var numPrimes = 0
var nonPrimes = 0
var smallest: Int?
var largest: Int?
var prime: Bool
var entry: String? = ""//gets the loop started

func readNumbers(using label: String, for process: (Int) -> Bool) {

   // Handle input from the user and checking entry validity
	entry = process
	if entry == nil {
		print("Invalid input!")
	}
	
	prime = true

    // Performing conversions
	guard let convert = Double(entry!), convert == floor(convert) else {
		print("\(entry) is Not \(label)!")
		continue
	}

	let num = Int(convert)

    switch using.lowercased(){
        case "prime": // check for primeness
        case "even": // check for being even
        case "a multiple of 5": // check for being a multiple of 5
    }
    
}

// Example function call

readNumbers(using:"Prime", for: isPrime(num:))

func isPrime(_num: Int) -> Bool{
    
}




while (current != 0){
	
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
		 


