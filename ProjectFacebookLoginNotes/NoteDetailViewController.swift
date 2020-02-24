//
//  NoteDetailViewController.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 24/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

protocol NoteDetailViewControllerDelegate: class {
    func editedContentOf(note:Note)
}

class NoteDetailViewController: UIViewController {

    var noteDetailTextView: UITextView!
    var note: Note!
    var coordinator: Coordinator!
    weak var delegate: NoteDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = note.noteDescription
        
        noteDetailTextView = UITextView(frame: .zero)
        noteDetailTextView.textAlignment = .left
        noteDetailTextView.translatesAutoresizingMaskIntoConstraints = false
        noteDetailTextView.font = UIFont(name: "Times new roman", size: 30)
        noteDetailTextView.text = note.noteContent
        noteDetailTextView.sizeToFit()
        noteDetailTextView.isEditable = true
        view.addSubview(noteDetailTextView)
        
        NSLayoutConstraint.activate([
              noteDetailTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
              noteDetailTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
              noteDetailTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
              noteDetailTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
          ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        note.noteContent = noteDetailTextView.text
        delegate?.editedContentOf(note: note)
    }

}
