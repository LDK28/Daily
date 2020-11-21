//
//  NotesDataSource.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

class NotesDataSource {
	var notesCellViewModels: [NotesCellViewModel]?
	
	init(notesCellViewModels: [NotesCellViewModel]? = nil) {
		self.notesCellViewModels = notesCellViewModels
	}
	
}
