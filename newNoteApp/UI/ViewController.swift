//
//  ViewController.swift
//  newNoteApp
//
//  Created by Дмитрий on 28.09.2018.
//  Copyright © 2018 Муленок Дмитрий. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    @IBOutlet weak var nameTextView: UITextView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var note = Note(name: "", dateCreated: "", dateModified: "", detailText: "", category: NoteCategory.home)
    var isEdit = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameTextView.delegate = self
        detailTextView.delegate = self
        
        nameTextView.isScrollEnabled = false
        detailTextView.isScrollEnabled = false
        
        nameTextView.text = note.name
        detailTextView.text = note.detailText
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        pickerView.selectRow(note.category.rawValue, inComponent: 0, animated: true)
        
        if nameTextView.text.isEmpty {
            nameTextView.text = "Введите название заметки"
            nameTextView.textColor = .lightGray
        }
        
        if detailTextView.text.isEmpty {
            detailTextView.text = "Запишите что-нибудь"
            detailTextView.textColor = .lightGray
        }
        print("viewDidLoad")
        scrollView.keyboardDismissMode = .onDrag
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return NoteCategory.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return NoteCategory(rawValue: row)!.description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        note.category = NoteCategory(rawValue: row)!
    }
    
    func Alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: { action in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            if textView == detailTextView{
                textView.text = "Запишите что-нибудь"
            }
            else{
                textView.text = "Введите название заметки"
            }
            textView.textColor = .lightGray
        }
        
//        scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width, height: (scrollView.frame.size.height - 300))
        
    }
    
    @IBAction func actionSetNote(_ sender: Any) {
        do {
            if isEdit {
                if note.detailText != detailTextView.text || note.name != nameTextView.text {
                    try note.setName(newValue: nameTextView.text)
                    print("after catch")
                    note.dateModified = Date().ruString
                    note.detailText = detailTextView.text
                }
            }else{
                try note.setName(newValue: nameTextView.text)
                print("after catch")
                note.dateCreated = Date().ruString
                note.dateModified = Date().ruString
                note.detailText = detailTextView.text
            }
            self.dismiss(animated: true)
        } catch {
            Alert(title: "Внимание", message: "Название не должно быть больше 50 символов" )
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
         self.dismiss(animated: true)
    }
    
}
