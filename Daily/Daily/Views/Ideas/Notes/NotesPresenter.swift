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
	func removeChosenNotes() {
		guard let viewController = viewController else { return }
		viewController.cellsToDisplay = viewController.cellsToDisplay.filter { !$0.isChosen }
	}
	
	func present(notes: [NotesCellViewModel]) {
		viewController?.cellsToDisplay.removeAll()
		notes.forEach {
			if let cell = (viewController as? NotesVC)?.tableView.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as? NotesCell {
				let a = $0
				cell.viewModel = $0
				viewController?.cellsToDisplay.append(cell)
			}
		}
		viewController?.finishDisplayingCells()
	}
}
