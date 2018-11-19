//
//  TableViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 27.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        notes = ProjectManager().loadData()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    override func viewWillAppear(_ animated : Bool){
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentNote = notes[indexPath.row]
        cell.textLabel?.text = currentNote.name
        cell.detailTextLabel?.text = currentNote.dateModified
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
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
        secondVC.note = notes[indexPath.row]
        secondVC.isEdit = true
        present(secondVC, animated: true)
        
    }
    
    @IBAction func actionNewNote(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "detailNote") as! ViewController
        secondVC.modalPresentationStyle = UIModalPresentationStyle.none
        present(secondVC, animated: true)
        
    }
    
}
