//
//  NotesViewController.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 22/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate {
    
    var coordinator: Coordinator!
    var tableView: UITableView!
    var tableViewDataSource: NoteTableDataSource!
    var userId: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        title = "FaceNoteAPP: \(userId!)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(addNote))
        
         tableView = UITableView()
         tableViewDataSource = NoteTableDataSource()
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         tableView.dataSource = tableViewDataSource
         tableView.delegate = self
         tableView.translatesAutoresizingMaskIntoConstraints = false
         
         DispatchQueue.global(qos: .default).async {
             [weak self] in
             self?.tableViewDataSource.loadTableViewData()
             DispatchQueue.main.async {
                 self?.tableView.reloadData()
             }
         }
         view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        coordinator.goToNoteDetailView(note: tableViewDataSource.notes[indexPath.row], noteTableViewDataSource: tableViewDataSource)
    }
    
    @objc func addNote(){
        
        let ac = UIAlertController(title: "Note Title", message: "Give your note a title: ", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Ok", style: .default) {
            [weak self, weak ac] _ in
            guard let noteTitle = ac?.textFields?[0].text else { return }
            guard let tableViewDataSource = self?.tableViewDataSource else { return }
            let note = Note(noteDescription: noteTitle, noteContent: "Your Note Here...")
            tableViewDataSource.notes.append(note)
            self?.coordinator.goToNoteDetailView(note: note, noteTableViewDataSource: tableViewDataSource)
            
        })
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}
