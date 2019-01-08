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
        
        func saveData(notes: [Note]){
            
            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(notes)
            
            UserDefaults.standard.set(encoded, forKey: "notesData")
            UserDefaults.standard.synchronize()
            
        }
        
    }
    
    func testSaveIncorrectData(){
        
        func saveData(notes: [Note]){

            let encoder = JSONEncoder()
            let encoded = try? encoder.encode(notes)
            
            UserDefaults.standard.set(encoded, forKey: "notesData")
            UserDefaults.standard.synchronize()
            
        }
        
    }
    
}

