//
//  ProjectManagerTests.swift
//  newNoteAppTests
//
//  Created by Дмитрий on 08.01.2019.
//  Copyright © 2019 Муленок Дмитрий. All rights reserved.
//

import XCTest
@testable import newNoteApp

class ProjectManagerTests: XCTestCase{
    
    func testSaveCorrectData(){
        
        let notes = [Note(name: "Заметка 1", dateCreated: "1 янв 2019", dateModified: "1 янв 2019", detailText: "Текст заметки", category: NoteCategory.home),
                     Note(name: "Заметка 2", dateCreated: "1 янв 2019", dateModified: "1 янв 2019", detailText: "Текст заметки", category: NoteCategory.home),
                     Note(name: "Заметка 3", dateCreated: "1 янв 2019", dateModified: "1 янв 2019", detailText: "Текст заметки", category: NoteCategory.home)]
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let encoded = try? encoder.encode(notes)
        let decoded = try? decoder.decode(Array.self, from: encoded!) as [Note]
        
        let notesDecoded:[Note] = decoded!
        
        for index in 0...notes.count - 1 {
            XCTAssertEqual(notes[index].name, notesDecoded[index].name)
            XCTAssertEqual(notes[index].dateCreated, notesDecoded[index].dateCreated)
            XCTAssertEqual(notes[index].dateModified, notesDecoded[index].dateModified)
            XCTAssertEqual(notes[index].detailText, notesDecoded[index].detailText)
            XCTAssertEqual(notes[index].category, notesDecoded[index].category)
        }
        
    }
    
}

