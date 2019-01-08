//
//  Note.swift
//  newNoteApp
//
//  Created by Дмитрий on 26.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation

public class Note: Codable {
    
    var name: String
    var dateCreated : String
    var dateModified : String
    var detailText : String
    var category : NoteCategory
    
    public func setName(newValue: String) throws {
        print(newValue.count)
        if newValue.count > 50 {
            throw NameErrorList.outOfRange
        }
        self.name = newValue
    }
    
    init(name: String, dateCreated: String, dateModified: String, detailText: String, category : NoteCategory){
        
        self.name = name
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.detailText = detailText
        self.category = category
        
    }
    
}
