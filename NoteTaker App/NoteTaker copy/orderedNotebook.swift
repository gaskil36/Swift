//
//  orderedNotebook.swift
//  NoteTaker
//
//  This file represents an ordered Notebook.
//  Created by  on 11/12/22.
//

import Foundation

class orderedNotebook: Notebook{
    
    var ordered = [String]()    // orderedNotebook should only directly work with this array
    
    override init(firstNote: Note?){
        guard firstNote == nil else{
            ordered[firstNote!.id] = firstNote // add the id of firstnote to the array
            super.init(firstNote: firstNote) // 3 b i
            return
        }
    }
    
    override func copy(note: Note) -> String{
        note.copy(note)
        ordered.append(note.id)  // append copy's id to ordered array
        return note.id
        
    }
    
    override func remove(note: Note) -> Note?{
        if ordered.contains(note){
            remove(note: note)  // Removes note from Notes dictionary
            ordered.remove(at: note.id) // Removes note from Ordered array
            return
        }
        
        else{
            return nil
        }
    }
        
    override func printNotes(){
        for notes in ordered {
            print("\(notes)")
        }
    }
    
    func append(note: Note){
        ordered.append(note.id)
        note.insert(note: note)
    }
    
    func insert(note: Note, at position: Int){
        if position < ordered.count {
            ordered.insert(note, at: position)
        }
        else {
            ordered.append(note)
        }
    }
    
    func move(note from: Int, to position: Int) -> (moved: Bool, position: Int?){
        if from > ordered.count || position < 0 {
            return (false, nil)
        }
        
        else if position > ordered.count {
            ordered.append(note)
            return (true, position)
        }
        
        else {
            ordered.insert(note, at: position)
            return (true, position)
        }
    }
    
    func move(note: Note, to position: Int) -> (moved: Bool, position: Int?){
        if position < 0 || !ordered.contains(note) {
            return (false, nil)
        }
        
        else if position > ordered.count {
            ordered.append(note)
            return (true, position)
        }
        
        else {
            ordered.insert(note, at: position)
            return (true, position)
        }
    }
    
    func sort(using closure: ((key: String, value: Note), (key: String, value: Note)) -> Bool){
        Notes.sorted(by: sort(using: ((key: note.id, value: note), (key: note.id, value: note))))
        
       // What is the correct syntax?
       // Notes.sorted(by: closure)
       // Notes.sorted(by: (key, value), (key, value))
       // Notes.sorted(by: sort)
        }
}
