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
            }
            else{
                notes.RemoveNote(at: myIndex)
            }
        }
        else{
            if detailTextOutput.text.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                notes.AddNote(detailText: detailTextOutput.text)
                isEdit = true
                let arNotes = self.notes.GetList()
                myIndex = arNotes.endIndex - 1
                
                let alertController = UIAlertController(title: "Отлично!", message:
                    "Заметка добавлена", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default,handler: nil))
                self.present(alertController, animated: true, completion: nil)
                
            }
        }
        self.view.endEditing(true)
    }
    
}
