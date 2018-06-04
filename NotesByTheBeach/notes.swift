//
//  notes.swift
//  NotesByTheBeach
//
//  Created by Izati Ng on 1/5/18.
//  Copyright © 2018 bklv. All rights reserved.
//

import Foundation
import Firebase

class Note {
    
    var textNotes: String = ""
    var category: String = ""
    var expense: String = ""
    
   let ref: DatabaseReference!
    
    init(text:String) {
        
        self.textNotes = text
        self.category = text
        self.expense = text
        
       ref = Database.database().reference().child("Notes").childByAutoId()
    }
    
init(snapshot: DataSnapshot) {

    ref = snapshot.ref

   if let value = snapshot.value as? [String: Any] {
    
    textNotes = value["textNotes"] as! String
    category = value["category"] as! String
    expense = value["expense"] as! String

    }
 }
}
    

    
//func save() {
//
//    ref.setValue(toDictionary())
//
//    }
//
//func toDictionary() -> [String: Any] {
//
//        return [
//            "textNotes" : textNotes,
//            "category" : category,
//            "expense" : expense
//            ]
//
//    }
    


