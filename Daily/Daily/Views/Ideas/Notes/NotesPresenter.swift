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
	func deleteNoteCell(at indexPath: IndexPath) {
		viewController?.cellsToDisplay.remove(at: indexPath.row)
		viewController?.delete(at: indexPath)
	}
	
	func updateNotesCells(with cellViewModel: NotesCellViewModel) {
		if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell {
			cell.viewModel = cellViewModel
			viewController?.cellsToDisplay.append(cell)
			viewController?.insert(at: IndexPath(row: 0, section: 0))
		}
	}

	
	func present(notesCells: NotesDataSource) {
		viewController?.cellsToDisplay.removeAll()
		for pinnedCellViewModel in notesCells.pinnedNotes {
			if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell {
				cell.viewModel = pinnedCellViewModel
				viewController?.cellsToDisplay.append(cell)
			}
		}
		
		for unpinnedCellViewModel in notesCells.unpinnedNotes {
			if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell {
				cell.viewModel = unpinnedCellViewModel
				viewController?.cellsToDisplay.append(cell)
			}
		}
		
		viewController?.finishDisplayingCells()
	}
}
