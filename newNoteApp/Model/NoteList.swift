//
//  NoteList.swift
//  newNoteApp
//
//  Created by Дмитрий on 26.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation
public class NoteList {
    
    private var notes : [Note]{
        set{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue){
                UserDefaults.standard.set(encoded, forKey: "notesData")
                UserDefaults.standard.synchronize()
            }
        }
        get{
            if let objects = UserDefaults.standard.value(forKey: "notesData") as? Data {
                let decoder = JSONDecoder()
                if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Note] {
                    print(objectsDecoded)
                    return objectsDecoded
                } else {
                    return []
                }
            } else {
                return []
            }
        }
    }
    
    func NewDate() -> String{
        let date = Date()
        var newDate = String()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ru_RU")
        newDate = formatter.string(from: date)
        
        return newDate
    }
    
    func AddNote(detailText: String){
        let note = Note(dateCreated: NewDate(), dateModified: NewDate(), detailText: detailText)
        self.notes.append(note)
    }
    
    func GetList() -> [Note]{
        return self.notes
    }
    
    func GetNoteByIndex(index: Int) -> Note{
        return notes[index]
    }
    
    func EditNote(detailText: String, index:Int){
        notes[index] = Note(dateCreated: NewDate(), dateModified: NewDate(), detailText: detailText)
    }
    
    func RemoveNote(at index: Int){
        notes.remove(at: index)
    }
    
    func GetCount() -> Int{
        return notes.count
    }
    
}
