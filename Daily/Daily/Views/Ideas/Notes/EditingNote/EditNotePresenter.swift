//
//  EditNotePresenter.swift
//  Daily
//
//  Created by Арсений Токарев on 03.12.2020.
//  Copyright (c) 2020. All rights reserved.

import UIKit

class EditNotePresenter {
	weak var viewController: EditNoteDisplayLogic?
	
}

extension EditNotePresenter: EditNotePresentationLogic {
	func present(title: String?, description: String?) {
		let viewModels: [MainCellViewModel] = [
			TextViewViewModel(cellType: TitleTextViewCell.self,
							  text: title),
			
			TextViewViewModel(cellType: DescriptionTextViewCell.self,
							  text: description),
		]
		
		viewController?.cellsToDisplay = viewModels
	}
	

	func transferNoteDataToView(_ data: NoteBackendModel) {
		viewController?.fillFieldsWithNoteContent(data)
	}
}
