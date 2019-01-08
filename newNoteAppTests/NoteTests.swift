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
        
        let setup = "Смирнов"
        let note = Note(name: "", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        
        XCTAssertNoThrow(try note.setName(newValue: setup))
        
    }
    
    func testNameSetIncorrectValue(){
        
        let setup = "Смирнов-Смирнов-Смирнов-Смирнов-Смирнов-Смирнов-Смирнов"
        let note = Note(name: "", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        
        XCTAssertThrowsError(try note.setName(newValue: setup))
        
    }
    
    func testNameGetCorrectValue(){

        let setup = "Смирнов"
        let note = Note(name: "", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        let expected = "Смирнов"
        try? note.setName(newValue: setup)
        
        XCTAssertEqual(note.name, expected)
    }
    
    func testNoteConstructor(){
        
        let note = Note(name: "Смирнов", dateCreated: "1 янв 2019", dateModified: "1 янв 2019", detailText: "Текст заметки", category: NoteCategory.home)
        let expectedName = "Смирнов"
        let expectedDateCreated = "1 янв 2019"
        let expectedDateModified = "1 янв 2019"
        let expectedDetailText = "Текст заметки"
        let expectedCategory = NoteCategory.home
        
        XCTAssertEqual(note.name, expectedName)
        XCTAssertEqual(note.dateCreated, expectedDateCreated)
        XCTAssertEqual(note.dateModified, expectedDateModified)
        XCTAssertEqual(note.detailText, expectedDetailText)
        XCTAssertEqual(note.category, expectedCategory)
        
    }
    
}
