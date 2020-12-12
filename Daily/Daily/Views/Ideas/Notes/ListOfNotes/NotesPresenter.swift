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
				(viewController.cellsToDisplay as? Array<NoteCellViewModel>)?
					.enumerated()
					.filter({ !indices.contains($0.offset) })
					.map({ $0.element })
		else { return }
		viewController.cellsToDisplay = filteredViewModels
	}
	
	func presentFilteredNotes(notes: [NoteBackendModel],
							  withSubstring substring: String) {
		fillCells(with: notes)
		viewController?.displayFilteredCells(thatHaveSubstring: substring)
	}
	
	func present(notes: [NoteBackendModel]) {
		fillCells(with: notes)
		viewController?.displayAllCells()
	}
	
	private func fillCells(with notes: [NoteBackendModel]) {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay.removeAll()
		notes.forEach {
			viewController.cellsToDisplay.append(
				NoteCellViewModel(cellType: NotesCell.self,
								  backendModel: $0))
		}
	}
}
