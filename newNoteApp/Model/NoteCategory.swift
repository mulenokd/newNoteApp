//
//  NoteCategory.swift
//  newNoteApp
//
//  Created by Дмитрий on 11.10.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import Foundation

enum NoteCategory: Int, Codable, CaseIterable {
    
    case work = 0
    case home = 1
    case health = 2
    case people = 3
    case documents = 4
    case finances = 5
    case other = 6
    
    var description: String {
        switch self {
        case .work: return "Работа"
        case .home: return "Дом"
        case .health: return "Здоровье"
        case .people: return "Люди"
        case .documents: return "Документы"
        case .finances: return "Деньги"
        case .other: return "Другое"

        }
    }
}
