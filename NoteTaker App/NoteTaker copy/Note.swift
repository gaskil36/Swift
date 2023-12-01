//
//  Note.swift
//  NoteTaker
//
//  This file houses the Note struct. The struct contains an enum
//  representing the priority level of the Note. A note also consists
//  of a title and body.

//  Created by Benjamin Gaskill on 11/12/22.
//

import Foundation

struct Note{
    enum priorityLvl: Int{
        case low = 0
        case med
        case high
        
        mutating func incrementLvl() -> Void{
            switch self{
                case .low:
                    self = .med
                case .med:
                    self = .high
                case .high:
                    self = .high
            }
        }
        
        mutating func decrementLvl() -> Void{
            switch self{
                case .low:
                    self = .low
                case .med:
                    self = .low
                case .high:
                    self = .med
            }
        }
    }
    
    var priority = priorityLvl.low
    
    static var idGen: Int = 0
    
    var title = ""
    var body = ""
    var id = ""
     
    static let gregCal: Calendar = Calendar(identifier: .gregorian)
    var creationDate

    init(title: String, body: String){
        self.title = title
        self.body = body
        self.id t= title + String(Note.idGen)   // The generated ID note is converted to a string and appended.
        Note.idGen += 1                        // The generated ID is incremented by 1.
        creationDate = Date()
    }S
    
    mutating func updateName(with name: String) -> String{
        self.title = name
        return title
    }
    
    mutating func updateBody(with text: String) -> String{
        self.body = text
        return body
    }
    
    mutating func appendBody(with text: String) -> Void{
        self.body = body + text
    }
    
    lazy var eventDate:Date
    
    mutating func setEventDate(event: Date?){
        if event == nil{
            eventDate = creationDate + 86400    // Equivalent to one day (in seconds) after Note creation
            print(eventDate)                    // Based on timeInterval documentation in the Swift API
        }
            
        else {
            eventDate = event
        }
    }
}
