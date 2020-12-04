//
//  NotesPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesPresenter {
	private weak var viewController: NotesDisplayLogic?
	
	init(viewController: NotesDisplayLogic?) {
		self.viewController = viewController
	}
}

extension NotesPresenter: NotesPresentationLogic {
	
	func prepareFilteredNotes(_ notesCellViewBackdendModels: [NotesCellViewBackendModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = []
		notesCellViewBackdendModels
			.forEach {
				viewController.cellsToDisplay.append(
					NotesCellTableViewModel(cellType: NotesCell.self,
											isPinned: $0.isPinned,
											title: $0.title,
											details: $0.details,
											assignedDateAndTime: $0.assignedDateAndTime))
			}
		viewController.displayCells()
	}
	
	func removeNotes(at indices: [Int]) {
		guard
			let viewController = viewController,
			let filteredViewModels =
				(viewController.cellsToDisplay as? Array<NotesCellTableViewModel>)?
					.enumerated()
					.filter({ !indices.contains($0.offset) })
					.map({ $0.element })
		else { return }
		viewController.cellsToDisplay = filteredViewModels
	}
	
	func present(notes: [NotesCellViewBackendModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay.removeAll()
		notes.forEach {
			viewController.cellsToDisplay.append(
				NotesCellTableViewModel(cellType: NotesCell.self,
										backendModel: $0))
		}
		viewController.displayCells()
	}
}
