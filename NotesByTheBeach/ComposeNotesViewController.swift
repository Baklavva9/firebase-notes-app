//
//  ComposeNotesViewController.swift
//  NotesByTheBeach
//
//  Created by Izati Ng on 2/5/18.
//  Copyright © 2018 bklv. All rights reserved.
//

import UIKit
import Firebase

class ComposeNotesViewController: UIViewController {
    
    @IBOutlet var doneComposeBarButtonItem: UIBarButtonItem!
    @IBOutlet var cancelBarButtonItem: UIBarButtonItem!
    
    @IBOutlet var categoryTextField: UITextField!
    @IBOutlet var expenseTextField: UITextField!
    
    @IBOutlet var composeTextView: UITextView!
    
    
    let db = Firestore.firestore()
    
    func textViewShouldReturn(_ composeTextView: UITextView) -> Bool {
        composeTextView.resignFirstResponder()
        return true
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if let nextTextField = view.viewWithTag(textField.tag + 1) {
//            textField.resignFirstResponder()
//         //   nextTextField.becomeFirstResponder()
//        }
//
//        return true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = doneComposeBarButtonItem
        self.navigationItem.leftBarButtonItem = cancelBarButtonItem
        
        
        // defining text input variable
        composeTextView.text = ""
        categoryTextField.text = ""
        expenseTextField.text = ""

        
    }
    

    @IBAction func doneCompose(_ sender: UIBarButtonItem) {
        
        if composeTextView.text != "" || categoryTextField.text != "" || expenseTextField.text != "" {

            let ref = Database.database().reference().child("Notes").childByAutoId()
        
            let newNote = ["textNotes"  : composeTextView.text!,
                          "category"    : categoryTextField.text!,
                          "expense"     : expenseTextField.text!,
                                                                    ]
            ref.updateChildValues(newNote)
            
            return
    
        }
            
        dismiss(animated: true, completion: nil)
    
    }
    
    

}





