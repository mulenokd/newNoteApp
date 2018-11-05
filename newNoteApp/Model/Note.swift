//
//  Note.swift
//  newNoteApp
//
//  Created by Дмитрий on 26.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation

struct Note : Codable{
    
    var name: String
    var dateCreated: String
    var dateModified: String
    var detailText: String
//    var category : NoteCategory
    
}
