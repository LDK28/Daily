//
//  NotesPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesPresenter {
	private weak var viewController: NotesDisplayLogic?
	
	private func castNotesCell(usingViewModel viewModel: NotesCellViewModel) -> NotesCell? {
		let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell
		cell?.viewModel = viewModel
		return cell
	}
	
	init(viewController: NotesDisplayLogic?) {
		self.viewController = viewController
	}
	
}

extension NotesPresenter: NotesPresentationLogic {
	func removeChosenNotes() {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = viewController.cellsToDisplay.filter { !$0.isChosen }
	}
	
	func rearrangeCells(_ notesViewModels: [NotesCellViewModel],
						moveFrom indices: [Int],
						moveTo index: Int) {
		guard let viewController = viewController else { return }
		indices.forEach {
			viewController.cellsToDisplay.remove(at: $0)
		}
		notesViewModels.forEach {
			if let cell = castNotesCell(usingViewModel: $0) {
				viewController.cellsToDisplay.insert(cell, at: index)
			}
		}
	}
	
	func present(notes: [NotesCellViewModel]) {
		viewController?.cellsToDisplay.removeAll()
		notes.forEach {
			if let cell = castNotesCell(usingViewModel: $0) {
				viewController?.cellsToDisplay.append(cell)
			}
		}
		viewController?.finishDisplayingCells()
	}
}
