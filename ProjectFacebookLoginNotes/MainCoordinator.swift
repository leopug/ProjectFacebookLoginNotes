import Foundation
import UIKit

protocol Coordinator: class {
    
    var navigationController: UINavigationController!{get set}
    
    init(navigationController: UINavigationController)
    
    func goToLoginPage()
    
    func goToNotesView(withUser userId: String)
    
    func goToNoteDetailView(note: Note, noteTableViewDataSource: NoteTableDataSource )
    
}

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController!
      
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToLoginPage() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }
    
    func goToNotesView(withUser userId: String) {
        let notesViewController = NotesViewController()
        notesViewController.coordinator = self
        notesViewController.userId = userId
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(notesViewController, animated: true)
    }
    
    func goToNoteDetailView(note: Note, noteTableViewDataSource: NoteTableDataSource) {
        
        let noteDetailViewController = NoteDetailViewController()
        noteDetailViewController.coordinator = self
        noteDetailViewController.note = note
        noteDetailViewController.delegate = noteTableViewDataSource
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(noteDetailViewController, animated: true)
        
    }
    
}
