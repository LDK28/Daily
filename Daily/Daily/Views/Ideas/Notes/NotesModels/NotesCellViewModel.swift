//
//  NoteCellViewModel.swift
//  Daily
//
//  Created by Арсений Токарев on 21.11.2020.
//

import UIKit

struct NotesCellViewModel: Codable {
	var title: String
	var details: String
	var isPinned = false
	var assignedDateAndTime: Date?
}

struct NotesDataSource: Codable {
	var pinnedNotes: [NotesCellViewModel]
	var unpinnedNotes: [NotesCellViewModel]
	
	init() {
		pinnedNotes = []
		unpinnedNotes = []
	}
}
