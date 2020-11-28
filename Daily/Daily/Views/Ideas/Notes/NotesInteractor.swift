//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase

class NotesInteractor: NotesDataStore {
	internal var notes = [NotesCellViewModel]()
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	
	func updateModels(_ action: NotesUpdateAction,
					  at indices: [Int],
					  completion: @escaping () -> ()) {
		let indexToInsertAt: Int
		var notesToUpdate = [NotesCellViewModel]()
		notesToUpdate.reserveCapacity(indices.count)
		switch action {
		case .unpin:
			for indexOfPinnedNote in indices.sorted(by: >) {
				var noteToTransfer = notes.remove(at: indexOfPinnedNote)
				noteToTransfer.isPinned = false
				notesToUpdate.append(noteToTransfer)
			}
			indexToInsertAt = (notes.firstIndex(where: { $0.isPinned }) ?? -1) + 1
			notesToUpdate.forEach {
				notes.insert($0, at: indexToInsertAt)
			}
		case .pin:
			for indexOfUnpinnedNote in indices.sorted(by: >) {
				var noteToTransfer = notes.remove(at: indexOfUnpinnedNote)
				noteToTransfer.isPinned = true
				notesToUpdate.append(noteToTransfer)
			}
			indexToInsertAt = 0
			notesToUpdate.forEach {
				notes.insert($0, at: indexToInsertAt)
			}
		}
		
		UserRequest.shared.update(notes: notes) {
			//self.presenter?.rearrangeCells(notesToUpdate, moveFrom: indices.sorted(by: >), moveTo: indexToInsertAt)
			self.presenter?.present(notes: self.notes)
			completion()
		}
	}
	
	func deleteModels(at indices: [Int],
					  completion: @escaping () -> ()) {
		UserRequest.shared.update(notes: notes.remove(at: indices)) {
			self.presenter?.removeChosenNotes()
			completion()
		}
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { notes in
			self.notes = notes
			self.presenter?.present(notes: notes)
		}
	}
}
