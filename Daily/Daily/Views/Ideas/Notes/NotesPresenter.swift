//
//  NotesPresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesPresenter: NotesDataStore {
	var dataSource = NotesDataSource()
	weak var tableView: UITableView?
	weak var viewController: NotesDisplayLogic? {
		didSet {
			tableView = (viewController as? NotesVC)?.tableView
		}
	}
	
}

extension NotesPresenter: NotesPresentationLogic {
	func present() {
		guard let cellViewModels = dataSource.notesCellViewModels else { return }
		for cellViewModel in cellViewModels {
			if let cell = tableView?.dequeueReusableCell(withIdentifier: NotesCell.cellIdentifier) as?  NotesCell{
				cell.viewModel = cellViewModel
				viewController?.cellsToDisplay.append(cell)
			}
		}
		viewController?.displaySomething()
	}
}
