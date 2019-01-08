//
//  NoteTests.swift
//  newNoteAppTests
//
//  Created by Дмитрий on 09.01.2019.
//  Copyright © 2019 Муленок Дмитрий. All rights reserved.
//

import XCTest
@testable import newNoteApp

class NoteTests: XCTestCase {
    
    func testNameSetСorrectValue() {
        
        let note = Note(name: "", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        try? note.setName(newValue: "Смирнов")
        let expected = "Смирнов"
        XCTAssertEqual(note.name, expected)
    }
    
    func testNameSetIncorrectValue(){
        
        let setup = "Смирнов-Смирнов-Смирнов-Смирнов-Смирнов-Смирнов-Смирнов"
        let note = Note(name: "", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        
        XCTAssertThrowsError(try note.setName(newValue: setup)) { error in
            XCTAssertEqual(error as? NameErrorList, NameErrorList.outOfRange)
        }
        
    }
    
    func testGetNameValue(){
        
    }
    
    func testNoteConstructor(){
        
    }
    
}
