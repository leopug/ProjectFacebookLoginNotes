//
//  NoteTableDataSource.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 24/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

public class NoteTableDataSource: NSObject, UITableViewDataSource, NoteDetailViewControllerDelegate {

    var notes: [Note]!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].noteDescription
        return cell
    }
    
    func loadTableViewData(){
        notes = [Note]()
        notes.append(Note(noteDescription: "first", noteContent: "agora tem texto aqui uhuuul"))
        notes.append(Note(noteDescription: "second", noteContent: "agora tem texto aqui uhuuul 2"))
        notes.append(Note(noteDescription: "third", noteContent: "agora tem texto aqui uhuuul 3"))
        notes.append(Note(noteDescription: "forth", noteContent: "agora tem texto aqui uhuuul 4"))

    }
    
    func editedContentOf(note: Note) {
        for noteFromDataSource in notes {
            if note.noteDescription == noteFromDataSource.noteDescription {
                noteFromDataSource.noteContent = note.noteContent
            }
        }
    }
    
    
    
}
