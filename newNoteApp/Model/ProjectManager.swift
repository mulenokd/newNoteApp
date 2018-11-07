//
//  ProjectManager.swift
//  newNoteApp
//
//  Created by Дмитрий on 11.10.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation
public class ProjectManager : Project{
    
    func saveData(){
        
        UserDefaults.standard.set(notes, forKey: "notesData")
        UserDefaults.standard.synchronize()
        
        print(notes)
        print("data was saved")
        
    }
    
    func loadData(){
        
        if let array = UserDefaults.standard.array(forKey: "notesData") as? [Note]{
            notes = array
        }else{
            notes = []
        }
        
        print(notes)
        print("data was loaded")
        
    }
    
}

