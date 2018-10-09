//
//  ViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 28.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var detailTextOutput: UITextView!
    
    var notes = NoteList()
    
    override func viewWillDisappear(_ animated : Bool){
        if isEdit{
            isEdit = false
        }
    }
    
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: { action in
            self.performSegue(withIdentifier: "unwindToMain", sender: self)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEdit{
            let currentNote = notes.GetNoteByIndex(index: myIndex)
            detailTextOutput.text = currentNote.detailText
        }
    }
    
    @IBAction func actionAddNote(_ sender: Any) {
        if isEdit{
            if detailTextOutput.text.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                notes.EditNote(detailText: detailTextOutput.text, index: myIndex)
                Alert(title: "Отлично!", message: "Заметка отредактирована")
                
            }
            else{
                notes.RemoveNote(at: myIndex)
                Alert(title: "Упс!", message: "Заметка удалена")
            }
        }
        else{
            if detailTextOutput.text.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                notes.AddNote(detailText: detailTextOutput.text)
                isEdit = true
                let arNotes = self.notes.GetList()
                myIndex = arNotes.endIndex - 1
                Alert(title: "Отлично!", message: "Заметка добавлена")
            }
        }
//        self.view.endEditing(true)
    }
    
}
