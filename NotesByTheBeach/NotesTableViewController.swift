//
//  NotesTableViewController.swift
//  NotesByTheBeach
//
//  Created by Izati Ng on 1/5/18.
//  Copyright © 2018 bklv. All rights reserved.
//

import UIKit
import Firebase

class NotesTableViewController: UITableViewController {
    
    @IBOutlet var rightBarButtonItem: UIButton!
    
    var notes = [Note]()
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref = Database.database().reference().child("Notes")
        
        ref.observe(.value, with: { (snapshot) in
            
            self.notes.removeAll()
            print(snapshot)
            
            
                for child in snapshot.children {
                    let noteSnapshot = child as! DataSnapshot
                    let note = Note(snapshot: noteSnapshot)
                
                    self.notes.insert(note, at: 0)
                }
                
                self.tableView.reloadData()
            })
        
    //    updateData()
    
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NotesTableViewCell
        
        //Append dictionary to cell
        
        let note = notes[indexPath.row]
        
//      cell.note = note
        cell.categoryLabel.text = note.category
        cell.expenseLabel.text = note.expense
        cell.notesLabel.text = note.textNotes
    
        return cell
    }
    
    // Mark: Perform showCompose
    
    func composeNotes(_ sender: Any) {
        performSegue(withIdentifier: "showCompose", sender: rightBarButtonItem)
    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
        
        }
    
    // Mark: Updating firestore data with changes in firebase database
//    func updateData() {
//
//        //Mapping firebase to firestore
//        let noteReference = db.collection("Notes")
//
//        db.runTransaction({ (transaction, errorPointer) -> Any? in
//            let noteDocument: DocumentSnapshot
//            do {
//                try noteDocument = transaction.getDocument(noteReference)
//            } catch let fetchError as NSError {
//                errorPointer?.pointee = fetchError
//                return nil
//            }
//
//            guard let oldNote = noteDocument.data()?["population"] as? Int else {
//                let error = NSError(
//                    domain: "AppErrorDomain",
//                    code: -1,
//                    userInfo: [
//                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
//                    ]
//                )
//                errorPointer?.pointee = error
//                return nil
//            }
//
//            transaction.updateData(["population": oldPopulation + 1], forDocument: sfReference)
//            return nil
//        }) { (object, error) in
//            if let error = error {
//                print("Transaction failed: \(error)")
//            } else {
//                print("Transaction successfully committed!")
//            }
//        }
//
//    }
    
}


