/**
    main.swift
    temperatureConverter
    
    This program acts as a temperature temperature converter,
    allowing for the conversion from celsius to fahrenheit, 
    and from fahrenheit to celsius. These two modes are 
    implemented using enums. 
    
    Created by Ben Gaskill on 10/25/22
*/

enum tempConverter: String{
    case fahrenheit
    case celsius
    
    init(in scale: String){
        switch scale.lowercased() {
        case let substr where substr.prefix(1) == "f":
            self = .fahrenheit
            print("fah") // remove later
            
        case let substr where substr.prefix(1) == "c":
            self = .celsius
            print("cel") // remove later
            
        default:
            self = .celsius
            print("Invalid Input!")
        }
    }
    
    // Assumes the above works. Intention: by now self is either fahrenheit 
    // or celsius, based on the first letter of the substring.         // Error: cannot assign to value: 'temp' is a 'let' constant.
    func convert(for temp: inout Double){     // MIGHT HAVE TO CHANGE "inout" LATER. NOT IN THE DIRECTIONS BUT IT WORKS FOR NOW, SINCE FUNCTION PARAMETERS ARE CONSTANTS BY DEFAULT.
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


var temperature = 32.0 // Used to solve ERROR 1
var myConverter = tempConverter(in: "Celsius")

myConverter.convert(for: &temperature)  // ERROR 1: If I try to enter a double value right here: Error: Cannot pass immutable value as ionout argument: literals are not mutable 
myConverter.switchScale()

temperature = 0.0

myConverter.convert(for: &temperature)







/**
// Testing the creation of the enum and the status (REMOVE LATER)
//var myConverter = tempConverter.celsius

var myConverter = tempConverter(in: "Celsius")    //THIS IS WHAT IT NEEDS TO BE
switch myConverter{
    case .fahrenheit: print("You have selected fahrenheit")
    case .celsius: print("you have selected celsius")
}

//var myTemp = tempConverter(rawValue: "fagrenheit")
print("Raw value for .fahrenheit is \(tempConverter.fahrenheit.rawValue)")
// REMOVE LATER
*/
