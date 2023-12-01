/**
    main.swift
    temperatureConverter
    
    This program acts as a temperature temperature converter,
    allowing for the conversion from celsius to fahrenheit,
    and from fahrenheit to celsius. These two modes are
    implemented using enums.
    
    Created by Ben Gaskill on 10/25/22
*/

import Foundation

enum TempConverter: String{
    case fahrenheit
    case celsius
    
    init(in scale: String){
        /* Checks the lowercased first letter
           of the string and assigns the mode */
        switch scale.lowercased() {
        case let substr where substr.prefix(1) == "f":
            self = .fahrenheit
            
        case let substr where substr.prefix(1) == "c":
            self = .celsius
            
        default:
            self = .celsius
        }
    }
    
    // inout is used in order to manipulate the value of temp within the function.
    func convert(for temp: inout Double){
        switch self{
            case .celsius:
                temp = 5 * (temp - 32) / 9
                print(temp)
            case .fahrenheit:
                temp = (9.0/5.0) * temp + 32
                print(temp)
        }
    }
    
    mutating func switchScale(){
        switch self{
            case .fahrenheit:
                self = .celsius
            case .celsius:
                self = .fahrenheit
        }
    }
}

// An instance of TempConverter is created with celcius as the mode
var myConverter = TempConverter(in: "Celsius")

// Conversion Test 1: Freezing Point (F to C)
var temperature = 32.0
print("Converting 32 degrees fahrenheit to degrees celsius:")
myConverter.convert(for: &temperature)

// Conversion Test 2: Boiling Point (F to C)
temperature = 212.0
print("Converting 212 degrees fahrenheit to degrees celsius:")
myConverter.convert(for: &temperature)

// Conversion Test 3: Room Temperature (F to C)
temperature = 68
print("Converting 68 degrees fahrenheit to degrees celsius:")
myConverter.convert(for: &temperature)

myConverter.switchScale()

// Conversion Test 4: Freezing Point (C to F)
temperature = 0.0
print("Converting 0 degrees celsius to degrees fahrenheit:")
myConverter.convert(for: &temperature)

// Conversion Test 5: Boiling Point (C to F)
temperature = 100.00
print("Converting 100 degrees celsius to degrees fahrenheit:")
myConverter.convert(for: &temperature)

// Conversion Test 6: Room Temperature (C to F)
temperature = 20.0
print("Converting 20 degrees celsius to degrees fahrenheit:")
myConverter.convert(for: &temperature)
