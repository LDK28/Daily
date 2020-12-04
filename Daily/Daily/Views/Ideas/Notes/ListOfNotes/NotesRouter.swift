//
//  NotesRouter.swift
//  Daily
//
//  Created by Арсений Токарев on 19.11.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class NotesRouter: NotesDataPassing {
	
	private weak var viewController: NotesVC?
	internal weak var dataStore: NotesDataStore?
  
	init(viewController: NotesVC?, dataStore: NotesDataStore?) {
		self.dataStore = dataStore
		self.viewController = viewController
	}
}

extension NotesRouter: NotesRoutingLogic {
	func navigateToEditingNote(withViewModel viewModel: NotesCellViewBackendModel) {
		let vc = EditNoteModule.build()
		vc.modalPresentationStyle = .fullScreen
		vc.router?.integrateNoteInModule(viewModel)
		viewController?.navigationController?.pushViewController(vc, animated: true)
	}
}
