//
//  SectionTableViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 28.12.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteCategory.allCases.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        if indexPath.row > NoteCategory.allCases.last!.rawValue {
            cell.textLabel?.text = "Все" as String
        }
        else {
            cell.textLabel?.text = NoteCategory(rawValue: indexPath.row)?.description
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notesSegue" {
            let nextScene =  segue.destination as! TableViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedSection = indexPath.row
                nextScene.sectionNum = selectedSection
            }
        }
    }
    
    
}
