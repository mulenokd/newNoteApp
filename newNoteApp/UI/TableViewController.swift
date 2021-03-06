//
//  TableViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 27.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var notes = [Note]()
    var sectionNotes = [Note]()
    var tempNote = Note(name: "", dateCreated: "", dateModified: "", detailText: "", category: NoteCategory.home)
    var sectionNum:Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        notes = ProjectManager().loadData()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if sectionNum == NoteCategory.allCases.last!.rawValue + 1 {
            self.title = "Все заметки"
        }
        else{
            self.title = NoteCategory(rawValue: sectionNum)?.description
        }
        
    }
    
    override func viewWillAppear(_ animated : Bool){
        super.viewWillAppear(animated)
        
        if tempNote.name != "" && tempNote.detailText != ""{
            tempNote.dateCreated = Date().ruString
            tempNote.dateModified = Date().ruString
            notes.append(tempNote)
            tempNote = Note(name: "", dateCreated: "", dateModified: "", detailText: "", category: NoteCategory.home)
        }
        
        notes = notes.sorted(by: { $0.dateModified > $1.dateModified })
        
        if sectionNum == NoteCategory.allCases.last!.rawValue + 1{
            sectionNotes = notes
        }
        else{
            sectionNotes.removeAll()
            for note in notes {
                if note.category.rawValue == sectionNum{
                    sectionNotes.append(note)
                }
            }
        }
        
        ProjectManager().saveData(notes: notes)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        let currentNote = sectionNotes[indexPath.row]
        cell.textLabel?.text = currentNote.name
        cell.detailTextLabel?.text = currentNote.dateModified
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.removeAll(where: { (note) -> Bool in
                return note === sectionNotes[indexPath.row]
            })
            sectionNotes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ProjectManager().saveData(notes: notes)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String{
        return "Удалить"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "detailNote") as! ViewController
        secondVC.note = sectionNotes[indexPath.row]
        secondVC.isEdit = true
        present(secondVC, animated: true)
        
    }
    
    @IBAction func actionNewNote(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "detailNote") as! ViewController
        secondVC.note = tempNote
        present(secondVC, animated: true)
        
    }
    
}
