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
    
    var note = Note(name: "Название", dateCreated: "String", dateModified: "String", detailText: "Текст заметки", category: NoteCategory.work)
    var isEdit = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        detailTextOutput.delegate = self
        nameTextInput.text = note.name
        detailTextOutput.text = note.detailText
        
    }
    
    override func viewWillDisappear(_ animated : Bool){
        
    }
    
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if detailTextOutput.textColor == .lightGray {
            detailTextOutput.text = nil
            detailTextOutput.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if detailTextOutput.text.isEmpty {
            detailTextOutput.text = "Запишите что-нибудь!"
            detailTextOutput.textColor = .lightGray
        }
    }
    
    @IBAction func actionSetNote(_ sender: Any) {
        if isEdit {
            if note.detailText != detailTextOutput.text || note.name != nameTextInput.text {
                note.dateModified = Date().ruString
                note.detailText = detailTextOutput.text
                note.name = nameTextInput.text!
                Alert(title: "Готово!", message: "Заметка изменена")
            }
            self.dismiss(animated: true)
        }
        else{
            note.dateCreated = Date().ruString
            note.dateModified = Date().ruString
            note.detailText = detailTextOutput.text
            note.name = nameTextInput.text!
            self.dismiss(animated: true)
        }
        
    }
    @IBAction func actionSelectCategory(_ sender: Any) {
        
    }
    
    @IBAction func actionBack(_ sender: Any) {
         self.dismiss(animated: true)
    }
    
}
