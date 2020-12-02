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
		let indexPathsToUpdate =
			filteredViewModels
				.indices
				.map { IndexPath(row: $0, section: 0) }
		viewController.updateViewModelForCell(at: indexPathsToUpdate)
	}
	
	func present(notes: [NotesCellViewBackendModel]) {
		viewController?.cellsToDisplay.removeAll()
		notes.forEach {
			viewController?.cellsToDisplay.append(
				NotesCellTableViewModel(cellType: NotesCell.self,
										backendModel: $0))
		}
		viewController?.finishDisplayingCells()
	}
}
