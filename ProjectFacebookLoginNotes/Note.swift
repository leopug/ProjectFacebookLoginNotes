//
//  Note.swift
//  ProjectFacebookLoginNotes
//
//  Created by Ana Caroline de Souza on 24/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation

class Note: Codable {
    var noteDescription: String
    var noteContent: String
    
    init(noteDescription: String, noteContent: String) {
        self.noteDescription = noteDescription
        self.noteContent = noteContent
    }
    
}
