//
//  NotesInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit
import Firebase

class NotesInteractor: NotesDataStore {
	internal var dataSource: NotesDataSource?
	private var presenter: NotesPresentationLogic?
	
	init(presenter: NotesPresentationLogic?) {
		self.presenter = presenter
	}
}

extension NotesInteractor: NotesBusinessLogic {
	
	func updateModels(_ action: NotesUpdateAction,
					  atIndices indices: [Int],
					  completion: @escaping () -> ()) {
		guard var dataSource = dataSource else {
			completion()
			return
		}
		switch action {
		case .pin:
			let indicesOfPinnedNotesToUpdate =
				dataSource.allNotes
				.enumerated()
				.filter { !$0.element.isPinned && indices.contains($0.offset) }
				.map { $0.offset }
			indicesOfPinnedNotesToUpdate
				.forEach { i in
					
				}
			
		case .unpin:
			dataSource.pinnedNotes
				.enumerated()
				.forEach {
					if indices.contains($0.offset) {
						dataSource.unpinnedNotes.insert(dataSource.pinnedNotes.remove(at: $0.offset), at: 0)
					}
				}
				
		}
		self.dataSource = dataSource
		UserRequest.shared.update(notes: dataSource) {
			completion()
		}
	}
	
	func deleteModels(pinnedNotesIndices: [Int],
					  unpinnedNotesIndices: [Int],
					  completion: @escaping () -> ()) {
		guard dataSource != nil else {
			completion()
			return
		}
		dataSource?.pinnedNotes.remove(at: pinnedNotesIndices)
		dataSource?.unpinnedNotes.remove(at: unpinnedNotesIndices)
		UserRequest.shared.update(notes: dataSource ?? NotesDataSource()) {
			self.presenter?.removeChosenNotes()
			completion()
		}
		
	}
	
	func fetchCells() {
		UserRequest.shared.getNotes() { dataSource in
			guard let dataSource = dataSource else { return }
			self.dataSource = dataSource
			self.presenter?.present(notes: dataSource.allNotes)
		}
	}
}
