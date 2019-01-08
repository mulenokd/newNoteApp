//
//  newNoteAppTests.swift
//  newNoteAppTests
//
//  Created by Денис Гынгазов on 26/09/2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import XCTest
@testable import newNoteApp

class NoteTests: XCTestCase {
    
    func testNameSetCorrectValue(){
        //Description: Описание теста
        //Тест name возврата корректного имени
        //Setup: Подготовка объекта к тестированию
        let setup = "Смирнов"
        let note = Note(dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        note.name = setup
        //Testing: Вызов тестируемого метода
        let expected = "Смирнов";
        let actual = note.name
        //Assert: Сравнение результата
        XCTAssertEqual(actual, expected)
    }
    
    func testNameSetIncorrectValue(){
        
       let note = Note(dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.home)
        
        XCTAssertThrowsError(try ) { error in
            XCTAssertEqual(error as? NameErrorList, NameErrorList.outOfRange)
        }
        
    }
    
    func testGetNameValue(){
        
    }
    
    func testNoteConstructor(){
        
    }
    
}
