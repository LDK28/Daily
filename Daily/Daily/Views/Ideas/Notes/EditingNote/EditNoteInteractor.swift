//
//  EditNoteInteractor.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditNoteInteractor: EditNoteDataStore {
	var presenter: EditNotePresentationLogic?
	var index: Int?
	var noteCellViewBackendModel: NoteBackendModel?
}

extension EditNoteInteractor: EditNoteBusinessLogic {
	func fetchCells() {
		guard let noteData = noteCellViewBackendModel else { return }
		presenter?.present(title: noteData.title,
						   description: noteData.details)
	}
	
	func didChange(title: String?,
				   details: String?) {
		guard
			let viewModel = noteCellViewBackendModel,
			let index = index
		else { return }
		
		if let details = details {
			viewModel.details = details
		}
		
		if let title = title {
			viewModel.title = title
		}
		
		UserRequest.shared.update(viewModel,
								  at: index) { result in
			switch result {
			case .failure(let error):
				debugPrint(error.localizedDescription)
			default:
				self.presenter?.handleCellChange()
			}
		}
	}
}
