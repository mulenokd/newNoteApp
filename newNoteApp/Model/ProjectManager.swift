//
//  ProjectManager.swift
//  newNoteApp
//
//  Created by Дмитрий on 11.10.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation
public class ProjectManager {
    
    func saveData(notes: [Note]){
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(notes){
            UserDefaults.standard.set(encoded, forKey: "notesData")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    func loadData() -> [Note]{
        
        guard let objects = UserDefaults.standard.value(forKey: "notesData") as? Data else { return [] }
        let decoder = JSONDecoder()
        guard let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Note] else { return [] }
        return objectsDecoded
        
    }
    
}

