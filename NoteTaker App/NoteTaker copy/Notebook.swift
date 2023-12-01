//
//  Notebook.swift
//  NoteTaker
//
//  This file represents a Notebook. It holds a Dictionary of Notes.
//  These notes are created with the Note struct type. The Notebook can
//  insert, remove, copy, retrieve and print the Notes in the Notebook.

//  Created by Benjamin Gaskill on 11/12/22.
//

import Foundation

class Notebook{

    var Notes = [String: Note]()
    var count = Notes.count
    
    init(firstNote: Note?){
        guard firstNote == nil else{
            Notes[firstNote!.id] = firstNote
            return
        }
    }
    
    func insert(note: Note) -> Void{
        Notes[note.id] = note               // A instance of the Note struct is inserted into the Notebook
    }
    
    func remove(note: Note) -> Note?{
        Notes.removeValue(forKey: note.id) // Removes the note at the specified index from the dictionary
        return note
    }
    
    func copy(note: Note) -> String{
        var num = 1 // Used to attach a unique number to the title
        var noteCopy = note     // Stores a copy of the note in a new variable
        noteCopy.title = note.title + String(num)
        num += 1
        insert(note: noteCopy)  // Inserts the note copy into the notebook
        return noteCopy.title
    }
    
    func retrieve(noteWith name: String) -> Note?{
        if name == Note.title{  // Intended: return if the provided name matches the title                        property of the specified note
            return Note.title
        }
        else{
            return nil
        }
    }
    
    func printNotes(){
        for each Note in Notebook{
            print(Note.name + " " + Note.body)
        }
    }

}
