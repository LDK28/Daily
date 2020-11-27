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
	var allNotes: [NotesCellViewModel] {
		return pinnedNotes + unpinnedNotes
	}
	init() {
		pinnedNotes = []
		unpinnedNotes = []
	}
}

extension Array where Element == NotesCellViewModel {
	mutating func remove(at indices: [Int]) {
		self = self
			.enumerated()
			.filter { !indices.contains($0.offset) }
			.map { $0.element }
	}
}
