//
//  Note.swift
//  newNoteApp
//
//  Created by Дмитрий on 26.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation

public class Note: Codable {
    private var _name: String = ""
    var name: String{
        get{
            return _name
        }
        set{
            _name = String(newValue[..<newValue.index(newValue.startIndex, offsetBy: min(newValue.count, 50))])
        }
    }
    
    var dateCreated : String
    var dateModified : String
    var detailText : String
    var category : NoteCategory
    
    init(dateCreated: String, dateModified: String, detailText: String, category : NoteCategory){
        
        self.dateCreated = dateCreated
        self.dateModified = dateModified
        self.detailText = detailText
        self.category = category
        
    }
    
}
