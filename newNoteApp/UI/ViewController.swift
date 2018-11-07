//
//  ViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 28.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate
{
    @IBOutlet weak var detailTextOutput: UITextView!
    @IBOutlet weak var nameTextInput: UITextField!
    
    var myIndex: Int = 0
    
    override func viewWillDisappear(_ animated : Bool){
//        if isEdit{
//            isEdit = false
//        }
    }
    
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { action in
            self.performSegue(withIdentifier: "unwindToMain", sender: self)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if detailTextOutput.textColor == UIColor.lightGray {
            detailTextOutput.text = nil
            detailTextOutput.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if detailTextOutput.text.isEmpty {
            detailTextOutput.text = "Запишите что-нибудь!"
            detailTextOutput.textColor = UIColor.lightGray
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTextOutput.delegate = self
//        if isEdit{
//            let currentNote = notes.GetNoteByIndex(index: myIndex)
//            nameTextInput.text = currentNote.name
//
//            if currentNote.detailText == ""{
//                detailTextOutput.text = "Запишите что-нибудь!"
//                detailTextOutput.textColor = UIColor.lightGray
//            }
//            else{
//                detailTextOutput.text = currentNote.detailText
//            }
//
//        }else{
//            detailTextOutput.text = "Запишите что-нибудь!"
//            detailTextOutput.textColor = UIColor.lightGray
//        }
    }
    
    @IBAction func actionAddNote(_ sender: Any) {
//        if isEdit{
//            if nameTextInput.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
////                note = Note(name: nameTextInput.text!, dateCreated: "", dateModified: "", detailText: "")
//                notes.EditNote(name: nameTextInput.text!, detailText: detailTextOutput.text, index: myIndex)
//                Alert(title: "Отлично!", message: "Заметка отредактирована")
//            }
//            else{
//                notes.RemoveNote(at: myIndex)
//                Alert(title: "Упс!", message: "Заметка удалена")
//            }
//        }
//        else{
//            if nameTextInput.text!.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
//                if detailTextOutput.text == "Запишите что-нибудь!"{
//                    notes.AddNote(name: nameTextInput.text!, detailText: "")
//                }
//                else{
//                    notes.AddNote(name: nameTextInput.text!, detailText: detailTextOutput.text)
//                }
//                isEdit = true
//                let arNotes = self.notes.GetList()
//                myIndex = arNotes.endIndex - 1
//                Alert(title: "Отлично!", message: "Заметка добавлена")
//            }
//        }
    }
    
}
