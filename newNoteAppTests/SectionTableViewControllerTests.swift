//
//  SectionTableViewControllerTests.swift
//  newNoteAppTests
//
//  Created by Дмитрий on 08.01.2019.
//  Copyright © 2019 Муленок Дмитрий. All rights reserved.
//

import XCTest
@testable import newNoteApp

class SectionTableViewControllerTests: XCTestCase{
 
    func testTableView(){
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return NoteCategory.allCases.count + 1
        }
        
    }
    
}
