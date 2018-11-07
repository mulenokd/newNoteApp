//
//  Note.swift
//  newNoteApp
//
//  Created by Дмитрий on 26.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation

struct Note: Codable {
    
    var name: String
    var dateCreated: String
    var dateModified: String
    var detailText: String
    var category : NoteCategory
    
    init(name: String, dateCreated: String, dateModified: String, detailText: String, category : NoteCategory){
        
        self.name = name
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.detailText = detailText
        self.category = category
        
    }
    
}
