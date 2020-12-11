//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase

class NotesInteractor: NotesDataStore {
	internal var notes = [NoteBackendModel]()
	private var presenter: NotesPresentationLogic?
	
	
	private func grabNotes(at indices: [Int],
						   shouldBePinned condition: Bool) -> [NoteBackendModel] {
		var grabbedNotes = [NoteBackendModel]()
		grabbedNotes.reserveCapacity(indices.count)
		for index in indices {
			let noteToTransfer = notes.remove(at: index)
			noteToTransfer.isPinned = condition
			grabbedNotes.append(noteToTransfer)
		}
		
		return grabbedNotes
	}
	
	init(presenter: NotesPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	
	func giveIndexOfNote(withViewModel viewModel: NoteCellViewModel,
						 completion: @escaping (Int?) -> ()) {
		let backendModel = NoteBackendModel(copiedModel: viewModel)
		completion(notes.firstIndex(where: { $0 == backendModel }))
	}
	
	func filterNotesThatHave(substring: String) {
		let formattedSubstring = substring.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		if formattedSubstring.isEmpty {
			presenter?.present(notes: notes)
			return
		}
		
		let matchingNotes = notes.filter {
			$0.title.lowercased().contains(formattedSubstring) || $0.details.lowercased().contains(formattedSubstring)
		}
		
		presenter?.presentFilteredNotes(notes: matchingNotes,
										withSubstring: formattedSubstring)
	}
	
	func updateModels(_ action: NotesUpdateAction,
					  at indices: [Int],
					  completion: @escaping () -> ()) {
		let notesToUpdate: [NoteBackendModel]
		switch action {
		case .unpin:
			notesToUpdate = grabNotes(at: indices,
									  shouldBePinned: false)
			let indexAfterFirstPinnedNote = (notes.firstIndex(where: { $0.isPinned }) ?? -1) + 1
			notesToUpdate.forEach {
				notes.insert($0,
							 at: indexAfterFirstPinnedNote)
			}
		case .pin:
			notesToUpdate = grabNotes(at: indices,
									  shouldBePinned: true)
			notesToUpdate.forEach {
				notes.insert($0, at: 0)
			}
		}
		
		UserRequest.shared.update(notes) { result in
			switch result {
			case .success(()):
				self.presenter?.present(notes: self.notes)
				completion()
			case .failure(let error):
				debugPrint(error.localizedDescription)
			}
		}
	}
	
	func deleteModels(at indices: [Int],
					  completion: @escaping () -> ()) {
 		UserRequest.shared.update(notes.remove(at: indices)) { result in
			switch result {
			case .success(()):
				self.presenter?.removeNotes(at: indices)
				completion()
			case .failure(let error):
				debugPrint(error.localizedDescription)
			}
		}
	}
	
	func fetchLatestData(latestInputInSearchBar: String?) {
		UserRequest.shared.getNotes { result in
			switch result {
			case .success(let notes):
				self.notes = notes
				self.filterNotesThatHave(substring: latestInputInSearchBar ?? "")
			default:
				/* handle errors lateron if needed */
				return
			}
		}
	}
}
